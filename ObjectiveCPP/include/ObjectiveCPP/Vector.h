/*******************************************************************************
 * Copyright (c) 2015, Jean-David Gadina - www.xs-labs.com / www.digidna.net
 * Distributed under the Boost Software License, Version 1.0.
 * 
 * Boost Software License - Version 1.0 - August 17th, 2003
 * 
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 * 
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

/*!
 * @header      Vector.h
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
    template < typename T, typename ObjCClass >
    NSArray * ArrayFromVector( const std::vector< T > & vector, SEL initMethod )
    {
        NSMutableArray * a;
        id ( * i )( id, SEL, T );
        
        a = [ NSMutableArray arrayWithCapacity: vector.size() ];
        
        for( auto v: vector )
        {
            {
                id o;
                
                o = [ ObjCClass alloc ];
                i = reinterpret_cast< id ( * )( id, SEL, T ) >( [ o methodForSelector: initMethod ] );
                o = i( o, initMethod, v );
                
                if( o != nil )
                {
                    [ a addObject: o ];
                }
                
                #if !defined( __clang__ ) || !defined( __has_feature ) || !__has_feature( objc_arc )
                [ o release ];
                #endif
            }
        }
        
        return [ NSArray arrayWithArray: a ];
    }
}

NS_ASSUME_NONNULL_END
