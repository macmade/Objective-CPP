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
 * @file        Vector.mm
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 */

#import <ObjectiveCPP.hpp>

namespace ObjectiveCPP
{
    NSArray * ArrayFromVector( const std::vector< std::string > & vector )
    {
        return ArrayFromVector< std::string, NSString >
        (
            vector,
            ^( const std::string & v )
            {
                return [ [ NSString alloc ] initWithCPPString: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< bool > & vector )
    {
        return ArrayFromVector< bool, NSNumber >
        (
            vector,
            ^( const bool & v )
            {
                return [ [ NSNumber alloc ] initWithBool: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< signed char > & vector )
    {
        return ArrayFromVector< signed char, NSNumber >
        (
            vector,
            ^( const signed char & v )
            {
                return [ [ NSNumber alloc ] initWithChar: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< unsigned char > & vector )
    {
        return ArrayFromVector< unsigned char, NSNumber >
        (
            vector,
            ^( const unsigned char & v )
            {
                return [ [ NSNumber alloc ] initWithUnsignedChar: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< signed short > & vector )
    {
        return ArrayFromVector< signed short, NSNumber >
        (
            vector,
            ^( const signed short & v )
            {
                return [ [ NSNumber alloc ] initWithShort: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< unsigned short > & vector )
    {
        return ArrayFromVector< unsigned short, NSNumber >
        (
            vector,
            ^( const unsigned short & v )
            {
                return [ [ NSNumber alloc ] initWithUnsignedShort: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< signed int > & vector )
    {
        return ArrayFromVector< signed int, NSNumber >
        (
            vector,
            ^( const signed int & v )
            {
                return [ [ NSNumber alloc ] initWithInt: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< unsigned int > & vector )
    {
        return ArrayFromVector< unsigned int, NSNumber >
        (
            vector,
            ^( const unsigned int & v )
            {
                return [ [ NSNumber alloc ] initWithUnsignedInt: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< signed long > & vector )
    {
        return ArrayFromVector< signed long, NSNumber >
        (
            vector,
            ^( const signed long & v )
            {
                return [ [ NSNumber alloc ] initWithLong: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< unsigned long > & vector )
    {
        return ArrayFromVector< unsigned long, NSNumber >
        (
            vector,
            ^( const unsigned long & v )
            {
                return [ [ NSNumber alloc ] initWithUnsignedLong: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< signed long long > & vector )
    {
        return ArrayFromVector< signed long long, NSNumber >
        (
            vector,
            ^( const signed long long & v )
            {
                return [ [ NSNumber alloc ] initWithLongLong: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< unsigned long long > & vector )
    {
        return ArrayFromVector< unsigned long long, NSNumber >
        (
            vector,
            ^( const unsigned long long & v )
            {
                return [ [ NSNumber alloc ] initWithUnsignedLongLong: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< float > & vector )
    {
        return ArrayFromVector< float, NSNumber >
        (
            vector,
            ^( const float & v )
            {
                return [ [ NSNumber alloc ] initWithFloat: v ];
            }
        );
    }
    
    NSArray * ArrayFromVector( const std::vector< double > & vector )
    {
        return ArrayFromVector< double, NSNumber >
        (
            vector,
            ^( const double & v )
            {
                return [ [ NSNumber alloc ] initWithDouble: v ];
            }
        );
    }
}
