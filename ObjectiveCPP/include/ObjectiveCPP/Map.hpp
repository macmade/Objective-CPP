/*******************************************************************************
 * The MIT License (MIT)
 * 
 * Copyright (c) 2015 Jean-David Gadina - www.xs-labs.com / www.digidna.net
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/

/*!
 * @header      Map.hpp
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 */

#include <map>

#ifndef NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#endif

NS_ASSUME_NONNULL_BEGIN

namespace ObjectiveCPP
{
    NSDictionary * DictionaryFromMap( const std::map< std::string, std::string > & map );
    
    template < typename TK, typename TV, typename ObjCClassK, typename ObjCClassV >
    NSDictionary * DictionaryFromMap( const std::map< TK, TV > & map, SEL initMethodK, SEL initMethodV )
    {
        NSMutableDictionary * d;
        id ( * iK )( id, SEL, TK );
        id ( * iV )( id, SEL, TV );
        
        d = [ NSMutableDictionary dictionaryWithCapacity: map.size() ];
        
        if( [ ObjCClassK instancesRespondToSelector: initMethodK ] && [ ObjCClassV instancesRespondToSelector: initMethodV ] )
        {
            for( auto p: map )
            {
                {
                    NSObject< NSCopying > * oK;
                    NSObject              * oV;
                    
                    oK = [ ObjCClassK alloc ];
                    oV = [ ObjCClassV alloc ];
                    iK = reinterpret_cast< id ( * )( id, SEL, TK ) >( [ oK methodForSelector: initMethodK ] );
                    iV = reinterpret_cast< id ( * )( id, SEL, TV ) >( [ oV methodForSelector: initMethodV ] );
                    
                    if( iK != nullptr && iV != nullptr )
                    {
                        oK = iK( oK, initMethodK, p.first );
                        oV = iV( oV, initMethodV, p.second );
                        
                        if( oK != nil && oV != nil )
                        {
                            [ d setObject: oV forKey: oK ];
                        }
                    }
                    
                    #if !defined( __clang__ ) || !defined( __has_feature ) || !__has_feature( objc_arc )
                    [ oK release ];
                    [ oV release ];
                    #endif
                }
            }
        }
        
        return [ NSDictionary dictionaryWithDictionary: d ];
    }
    
    template < typename T, typename ObjCClass >
    NSDictionary * DictionaryFromMap( const std::map< T, T > & map, SEL initMethod )
    {
        return DictionaryFromMap< T, T, ObjCClass, ObjCClass >( map, initMethod, initMethod );
    }
    
    template < typename TK, typename TV, typename ObjCClassK, typename ObjCClassV >
    std::map< TK, TV > MapFromDictionary( NSDictionary * dictionary, SEL getterK, SEL getterV )
    {
        std::map< TK, TV > m;
        NSObject         * oK;
        NSObject         * oV;
        TK ( * iK )( id, SEL );
        TV ( * iV )( id, SEL );
        
        if( [ ObjCClassK instancesRespondToSelector: getterK ] &&  [ ObjCClassV instancesRespondToSelector: getterV ] )
        {
            for( oK in dictionary )
            {
                oV = [ dictionary objectForKey: oK ];
                
                if( [ oK isKindOfClass: [ ObjCClassK class ] ] && [ oV isKindOfClass: [ ObjCClassV class ] ] )
                {
                    iK = reinterpret_cast< TK ( * )( id, SEL ) >( [ oK methodForSelector: getterK ] );
                    iV = reinterpret_cast< TV ( * )( id, SEL ) >( [ oV methodForSelector: getterV ] );
                    
                    if( iK != nullptr && iV != nullptr )
                    {
                        m.insert( { iK( oK, getterK ), iV( oV, getterV ) } );
                    }
                }
            }
        }
        
        return m;
    }
    
    template < typename T, typename ObjCClass >
    std::map< T, T > MapFromDictionary( NSDictionary * dictionary, SEL getter )
    {
        return MapFromDictionary< T, T, ObjCClass, ObjCClass >( dictionary, getter, getter );
    }
}

NS_ASSUME_NONNULL_END
