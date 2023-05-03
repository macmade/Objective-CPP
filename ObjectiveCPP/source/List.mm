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
    NSArray * ArrayFromList( const std::list< std::string > & list )
    {
        return ArrayFromList< std::string, NSString >( list, @selector( initWithCPPString: ) );
    }
    
    NSArray * ArrayFromList( const std::list< bool > & list )
    {
        return ArrayFromList< bool, NSNumber >( list, @selector( initWithBool: ) );
    }
    
    NSArray * ArrayFromList( const std::list< signed char > & list )
    {
        return ArrayFromList< signed char, NSNumber >( list, @selector( initWithChar: ) );
    }
    
    NSArray * ArrayFromList( const std::list< unsigned char > & list )
    {
        return ArrayFromList< unsigned char, NSNumber >( list, @selector( initWithUnsignedChar: ) );
    }
    
    NSArray * ArrayFromList( const std::list< signed short > & list )
    {
        return ArrayFromList< signed short, NSNumber >( list, @selector( initWithShort: ) );
    }
    
    NSArray * ArrayFromList( const std::list< unsigned short > & list )
    {
        return ArrayFromList< unsigned short, NSNumber >( list, @selector( initWithUnsignedShort: ) );
    }
    
    NSArray * ArrayFromList( const std::list< signed int > & list )
    {
        return ArrayFromList< signed int, NSNumber >( list, @selector( initWithInt: ) );
    }
    
    NSArray * ArrayFromList( const std::list< unsigned int > & list )
    {
        return ArrayFromList< unsigned int, NSNumber >( list, @selector( initWithUnsignedInt: ) );
    }
    
    NSArray * ArrayFromList( const std::list< signed long > & list )
    {
        return ArrayFromList< signed long, NSNumber >( list, @selector( initWithLong: ) );
    }
    
    NSArray * ArrayFromList( const std::list< unsigned long > & list )
    {
        return ArrayFromList< unsigned long, NSNumber >( list, @selector( initWithUnsignedLong: ) );
    }
    
    NSArray * ArrayFromList( const std::list< signed long long > & list )
    {
        return ArrayFromList< signed long long, NSNumber >( list, @selector( initWithLong: ) );
    }
    
    NSArray * ArrayFromList( const std::list< unsigned long long > & list )
    {
        return ArrayFromList< unsigned long long, NSNumber >( list, @selector( initWithUnsignedLongLong: ) );
    }
    
    NSArray * ArrayFromList( const std::list< float > & list )
    {
        return ArrayFromList< float, NSNumber >( list, @selector( initWithFloat: ) );
    }
    
    NSArray * ArrayFromList( const std::list< double > & list )
    {
        return ArrayFromList< double, NSNumber >( list, @selector( initWithDouble: ) );
    }
}
