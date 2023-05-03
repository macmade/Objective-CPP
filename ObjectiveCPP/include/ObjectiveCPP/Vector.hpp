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
 * @header      Vector.hpp
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 */

#include <vector>

#ifndef NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#endif

NS_ASSUME_NONNULL_BEGIN

namespace ObjectiveCPP
{
    NSArray * ArrayFromVector( const std::vector< std::string > & vector );
    NSArray * ArrayFromVector( const std::vector< bool > & vector );
    NSArray * ArrayFromVector( const std::vector< signed char > & vector );
    NSArray * ArrayFromVector( const std::vector< unsigned char > & vector );
    NSArray * ArrayFromVector( const std::vector< signed short > & vector );
    NSArray * ArrayFromVector( const std::vector< unsigned short > & vector );
    NSArray * ArrayFromVector( const std::vector< signed int > & vector );
    NSArray * ArrayFromVector( const std::vector< unsigned int > & vector );
    NSArray * ArrayFromVector( const std::vector< signed long > & vector );
    NSArray * ArrayFromVector( const std::vector< unsigned long > & vector );
    NSArray * ArrayFromVector( const std::vector< signed long long > & vector );
    NSArray * ArrayFromVector( const std::vector< unsigned long long > & vector );
    NSArray * ArrayFromVector( const std::vector< float > & vector );
    NSArray * ArrayFromVector( const std::vector< double > & vector );
    
    #ifdef __clang__
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wnullability-completeness"
    #endif
    template < typename T, typename ObjCClass >
    NSArray * ArrayFromVectorIterator( typename std::vector< T >::iterator begin, typename std::vector< T >::iterator end, SEL initMethod )
    #ifdef __clang__
    #pragma clang diagnostic pop
    #endif
    {
        NSMutableArray * a;
        id ( * i )( id, SEL, T );
        
        a = [ [ NSMutableArray alloc ] init ];

        #if !defined( __clang__ ) || !defined( __has_feature ) || !__has_feature( objc_arc )
        [ a autorelease ];
        #endif
        
        if( [ ObjCClass instancesRespondToSelector: initMethod ] )
        {
            for( auto it = begin; it != end; it++ )
            {
                {
                    NSObject * o;
                    
                    o = [ ObjCClass alloc ];
                    i = reinterpret_cast< id ( * )( id, SEL, T ) >( [ o methodForSelector: initMethod ] );
                    
                    if( i != nullptr )
                    {
                        o = i( o, initMethod, *( it ) );
                        
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
    NSArray * ArrayFromVectorIterator( typename std::vector< T >::iterator begin, typename std::vector< T >::iterator end, ObjCClass * _Nullable ( ^ _Nonnull convert )( const T & ) )
    {
        NSMutableArray * a = [ [ NSMutableArray alloc ] init ];

        #if !defined( __clang__ ) || !defined( __has_feature ) || !__has_feature( objc_arc )
        [ a autorelease ];
        #endif

        for( auto it = begin; it != end; it++ )
        {
            ObjCClass * o = convert( *( it ) );

            if( o != nil )
            {
                [ a addObject: o ];
            }
        }

        return [ NSArray arrayWithArray: a ];
    }

    template < typename T, typename ObjCClass >
    NSArray * ArrayFromVector( const std::vector< T > & vector, SEL initMethod )
    {
        std::vector< T > & v( const_cast< std::vector< T > & >( vector ) );

        return ArrayFromVectorIterator< T, ObjCClass >( v.begin(), v.end(), initMethod );
    }

    template < typename T, typename ObjCClass >
    NSArray * ArrayFromVector( const std::vector< T > & vector, ObjCClass * _Nullable ( ^ _Nonnull convert )( const T & ) )
    {
        std::vector< T > & v( const_cast< std::vector< T > & >( vector ) );

        return ArrayFromVectorIterator< T, ObjCClass >( v.begin(), v.end(), convert );
    }
    
    template < typename T, typename ObjCClass >
    std::vector< T > VectorFromArray( NSArray * array, SEL getter )
    {
        std::vector< T > v;
        NSObject       * o;
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
                        v.push_back( i( o, getter ) );
                    }
                }
            }
        }
        
        return v;
    }
}

NS_ASSUME_NONNULL_END
