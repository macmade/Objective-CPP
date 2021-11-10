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
 * @header      List.hpp
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 */

#include <list>

#ifndef NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#endif

NS_ASSUME_NONNULL_BEGIN

namespace ObjectiveCPP
{
    NSArray * ArrayFromList( const std::list< std::string > & vector );
    NSArray * ArrayFromList( const std::list< bool > & vector );
    NSArray * ArrayFromList( const std::list< signed char > & vector );
    NSArray * ArrayFromList( const std::list< unsigned char > & vector );
    NSArray * ArrayFromList( const std::list< signed short > & vector );
    NSArray * ArrayFromList( const std::list< unsigned short > & vector );
    NSArray * ArrayFromList( const std::list< signed int > & vector );
    NSArray * ArrayFromList( const std::list< unsigned int > & vector );
    NSArray * ArrayFromList( const std::list< signed long > & vector );
    NSArray * ArrayFromList( const std::list< unsigned long > & vector );
    NSArray * ArrayFromList( const std::list< signed long long > & vector );
    NSArray * ArrayFromList( const std::list< unsigned long long > & vector );
    NSArray * ArrayFromList( const std::list< float > & vector );
    NSArray * ArrayFromList( const std::list< double > & vector );
    
    template < typename T, typename ObjCClass >
    NSArray * ArrayFromList( const std::list< T > & vector, SEL initMethod )
    {
        NSMutableArray * a;
        id ( * i )( id, SEL, T );
        
        a = [ NSMutableArray arrayWithCapacity: vector.size() ];
        
        if( [ ObjCClass instancesRespondToSelector: initMethod ] )
        {
            for( auto v: vector )
            {
                {
                    NSObject * o;
                    
                    o = [ ObjCClass alloc ];
                    i = reinterpret_cast< id ( * )( id, SEL, T ) >( [ o methodForSelector: initMethod ] );
                    
                    if( i != nullptr )
                    {
                        o = i( o, initMethod, v );
                        
                        if( o != nil )
                        {
                            [ a addObject: o ];
                        }
                    }
                    
                    #if !defined( __clang__ ) || !defined( __has_feature ) || !__has_feature( objc_arc )
                    [ o release ];
                    #endif
                }
            }
        }
        
        return [ NSArray arrayWithArray: a ];
    }
    
    template < typename T, typename ObjCClass >
    std::list< T > ListFromArray( NSArray * array, SEL getter )
    {
        std::list< T > l;
        NSObject     * o;
        T ( * i )( id, SEL );
        
        if( [ ObjCClass instancesRespondToSelector: getter ] )
        {
            for( o in array )
            {
                if( [ o isKindOfClass: [ ObjCClass class ] ] )
                {
                    i = reinterpret_cast< T ( * )( id, SEL ) >( [ o methodForSelector: getter ] );
                    
                    if( i != nullptr )
                    {
                        l.push_back( i( o, getter ) );
                    }
                }
            }
        }
        
        return l;
    }
}

NS_ASSUME_NONNULL_END
