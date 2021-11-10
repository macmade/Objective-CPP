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
 * @file        Test-NSString+ObjectiveCPP.mm
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 * @abstract    Unit tests for NSString( ObjectiveCPP )
 */

#define XSTEST_GTEST_COMPAT
#import <XSTest/XSTest.hpp>
#import <ObjectiveCPP.hpp>

using namespace testing;

TEST( ObjectiveCPP_NSString, defaultCPPStringEncoding )
{
    ASSERT_TRUE( [ NSString defaultCPPStringEncoding ] == NSUTF8StringEncoding );
    
    [ NSString setDefaultCPPStringEncoding: NSASCIIStringEncoding ];
    
    ASSERT_TRUE( [ NSString defaultCPPStringEncoding ] == NSASCIIStringEncoding );
    
    [ NSString setDefaultCPPStringEncoding: NSUTF8StringEncoding ];
    
    ASSERT_TRUE( [ NSString defaultCPPStringEncoding ] == NSUTF8StringEncoding );
}

TEST( ObjectiveCPP_NSString, stringWithCPPString )
{
    ASSERT_TRUE( [ [ NSString stringWithCPPString: "hello, world" ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, stringWithCPPString_encoding )
{
    ASSERT_TRUE( [ [ NSString stringWithCPPString: "hello, world" encoding: NSUTF8StringEncoding  ] isEqualToString: @"hello, world" ] );
    ASSERT_TRUE( [ [ NSString stringWithCPPString: "hello, world" encoding: NSASCIIStringEncoding ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, cppStringWithContentsOfFile_encoding_error )
{
    NSError * e;
    
    e = nil;
    
    ASSERT_TRUE( [ NSString cppStringWithContentsOfFile: @"/etc/hosts" encoding: NSUTF8StringEncoding error: &e ].length() > 0 );
    ASSERT_TRUE( e == nil );
    
    ASSERT_TRUE( [ NSString cppStringWithContentsOfFile: @"/foo/bar" encoding: NSUTF8StringEncoding error: &e ].length() == 0 );
    ASSERT_TRUE( e != nil );
}

TEST( ObjectiveCPP_NSString, cppStringWithContentsOfFile_usedEncoding_error )
{
    NSError        * e;
    NSStringEncoding enc;
    
    e   = nil;
    enc = 0;
    
    ASSERT_TRUE( [ NSString cppStringWithContentsOfFile: @"/etc/hosts" usedEncoding: &enc error: &e ].length() > 0 );
    ASSERT_TRUE( e == nil );
    ASSERT_TRUE( enc != 0 );
    
    ASSERT_TRUE( [ NSString cppStringWithContentsOfFile: @"/foo/bar" usedEncoding: &enc error: &e ].length() == 0 );
    ASSERT_TRUE( e != nil );
    ASSERT_TRUE( enc != 0 );
}

TEST( ObjectiveCPP_NSString, cppStringWithContentsOfURL_encoding_error )
{
    NSError * e;
    NSURL   * u1;
    NSURL   * u2;
    
    e  = nil;
    u1 = [ NSURL URLWithString: @"file:///etc/hosts" ];
    u2 = [ NSURL URLWithString: @"file:///foo/bar" ];
    
    ASSERT_TRUE( [ NSString cppStringWithContentsOfURL: u1 encoding: NSUTF8StringEncoding error: &e ].length() > 0 );
    ASSERT_TRUE( e == nil );
    
    ASSERT_TRUE( [ NSString cppStringWithContentsOfURL: u2 encoding: NSUTF8StringEncoding error: &e ].length() == 0 );
    ASSERT_TRUE( e != nil );
}

TEST( ObjectiveCPP_NSString, cppStringWithContentsOfURL_usedEncoding_error )
{
    NSError        * e;
    NSStringEncoding enc;
    NSURL          * u1;
    NSURL          * u2;
    
    e   = nil;
    enc = 0;
    u1  = [ NSURL URLWithString: @"file:///etc/hosts" ];
    u2  = [ NSURL URLWithString: @"file:///foo/bar" ];
    
    ASSERT_TRUE( [ NSString cppStringWithContentsOfURL: u1 usedEncoding: &enc error: &e ].length() > 0 );
    ASSERT_TRUE( e == nil );
    ASSERT_TRUE( enc != 0 );
    
    ASSERT_TRUE( [ NSString cppStringWithContentsOfURL: u2 usedEncoding: &enc error: &e ].length() == 0 );
    ASSERT_TRUE( e != nil );
    ASSERT_TRUE( enc != 0 );
}

TEST( ObjectiveCPP_NSString, initWithCPPString )
{
    ASSERT_TRUE( [ [ [ NSString alloc ] initWithCPPString: "hello, world" ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, initWithCPPString_encoding )
{
    ASSERT_TRUE( [ [ [ NSString alloc ] initWithCPPString: "hello, world" encoding: NSUTF8StringEncoding  ] isEqualToString: @"hello, world" ] );
    ASSERT_TRUE( [ [ [ NSString alloc ] initWithCPPString: "hello, world" encoding: NSASCIIStringEncoding ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, cppString )
{
    ASSERT_TRUE( [ @"hello, world" cppString ] == "hello, world" );
}

TEST( ObjectiveCPP_NSString, cppStringUsingEncoding )
{
    ASSERT_TRUE( [ @"hello, world" cppStringUsingEncoding: NSUTF8StringEncoding  ] == "hello, world" );
    ASSERT_TRUE( [ @"hello, world" cppStringUsingEncoding: NSASCIIStringEncoding ] == "hello, world" );
}

TEST( ObjectiveCPP_NSString, cppStringByAppendingString )
{
    ASSERT_TRUE( [ @"hello, world" cppStringByAppendingString: @"..." ] == "hello, world..." );
}

TEST( ObjectiveCPP_NSString, stringByAppendingCPPString )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByAppendingCPPString: "..." ] isEqualToString: @"hello, world..." ] );
}

TEST( ObjectiveCPP_NSString, cppStringByPaddingToLength_withString_startingAtIndex )
{
    ASSERT_TRUE( [ @"hello, world" cppStringByPaddingToLength: 15 withString: @"." startingAtIndex: 0 ] == "hello, world..." );
}

TEST( ObjectiveCPP_NSString, stringByPaddingToLength_withCPPString_startingAtIndex )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByPaddingToLength: 15 withCPPString: "." startingAtIndex: 0 ] isEqualToString: @"hello, world..." ] );
}

TEST( ObjectiveCPP_NSString, cppStringByPaddingToLength_withCPPString_startingAtIndex )
{
    ASSERT_TRUE( [ @"hello, world" cppStringByPaddingToLength: 15 withCPPString: "." startingAtIndex: 0 ] == "hello, world..." );
}

TEST( ObjectiveCPP_NSString, componentsSeparatedByCPPString )
{
    ASSERT_TRUE( [ [ @"hello, world" componentsSeparatedByCPPString: " " ] count ] == 2 );
}

TEST( ObjectiveCPP_NSString, cppStringByTrimmingCharactersInSet )
{
    ASSERT_TRUE( [ @" hello, world " cppStringByTrimmingCharactersInSet: [ NSCharacterSet whitespaceCharacterSet ] ] == "hello, world" );
}

TEST( ObjectiveCPP_NSString, cppSubstringFromIndex )
{
    ASSERT_TRUE( [ @"hello, world" cppSubstringFromIndex: 7 ] == "world" );
}

TEST( ObjectiveCPP_NSString, cppSubstringWithRange )
{
    ASSERT_TRUE( [ @"hello, world" cppSubstringWithRange: NSMakeRange( 7, 2 ) ] == "wo" );
}

TEST( ObjectiveCPP_NSString, cppSubstringToIndex )
{
    ASSERT_TRUE( [ @"hello, world" cppSubstringToIndex: 5 ] == "hello" );
}

TEST( ObjectiveCPP_NSString, rangeOfCPPString )
{
    NSRange r;
    
    r = [ @"hello, world" rangeOfCPPString: "wo" ];
    
    ASSERT_TRUE( r.location == 7 );
    ASSERT_TRUE( r.length   == 2 );
    
    r = [ @"hello, world" rangeOfCPPString: "universe" ];
    
    ASSERT_TRUE( r.location == NSNotFound );
    ASSERT_TRUE( r.length   == 0 );
}

TEST( ObjectiveCPP_NSString, rangeOfCPPString_options )
{
    NSRange r;
    
    r = [ @"hello, world" rangeOfCPPString: "wo" options: NSCaseInsensitiveSearch ];
    
    ASSERT_TRUE( r.location == 7 );
    ASSERT_TRUE( r.length   == 2 );
    
    r = [ @"hello, world" rangeOfCPPString: "WO" options: NSCaseInsensitiveSearch ];
    
    ASSERT_TRUE( r.location == 7 );
    ASSERT_TRUE( r.length   == 2 );
    
    r = [ @"hello, world" rangeOfCPPString: "universe" options: NSCaseInsensitiveSearch ];
    
    ASSERT_TRUE( r.location == NSNotFound );
    ASSERT_TRUE( r.length   == 0 );
}

TEST( ObjectiveCPP_NSString, rangeOfCPPString_options_range )
{
    NSRange r;
    
    r = [ @"hello, world" rangeOfCPPString: "wo" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ];
    
    ASSERT_TRUE( r.location == 7 );
    ASSERT_TRUE( r.length   == 2 );
    
    r = [ @"hello, world" rangeOfCPPString: "WO" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ];
    
    ASSERT_TRUE( r.location == 7 );
    ASSERT_TRUE( r.length   == 2 );
    
    r = [ @"hello, world" rangeOfCPPString: "wo" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 4 ) ];
    
    ASSERT_TRUE( r.location == NSNotFound );
    ASSERT_TRUE( r.length   == 0 );
    
    r = [ @"hello, world" rangeOfCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ];
    
    ASSERT_TRUE( r.location == NSNotFound );
    ASSERT_TRUE( r.length   == 0 );
}

TEST( ObjectiveCPP_NSString, rangeOfCPPString_options_range_locale )
{
    NSRange r;
    
    r = [ @"hello, world" rangeOfCPPString: "wo" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) locale: nil ];
    
    ASSERT_TRUE( r.location == 7 );
    ASSERT_TRUE( r.length   == 2 );
    
    r = [ @"hello, world" rangeOfCPPString: "WO" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) locale: nil ];
    
    ASSERT_TRUE( r.location == 7 );
    ASSERT_TRUE( r.length   == 2 );
    
    r = [ @"hello, world" rangeOfCPPString: "wo" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 4 ) locale: nil ];
    
    ASSERT_TRUE( r.location == NSNotFound );
    ASSERT_TRUE( r.length   == 0 );
    
    r = [ @"hello, world" rangeOfCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) locale: nil ];
    
    ASSERT_TRUE( r.location == NSNotFound );
    ASSERT_TRUE( r.length   == 0 );
}

TEST( ObjectiveCPP_NSString, cppStringByReplacingOccurrencesOfString_withString )
{
    ASSERT_TRUE( [ @"hello, world" cppStringByReplacingOccurrencesOfString: @"world" withString: @"universe" ] == "hello, universe" );
    ASSERT_TRUE( [ @"hello, world" cppStringByReplacingOccurrencesOfString: @"foo"   withString: @"universe" ] == "hello, world" );
}

TEST( ObjectiveCPP_NSString, cppStringByReplacingOccurrencesOfString_withString_options_range )
{
    ASSERT_TRUE( [ @"hello, world" cppStringByReplacingOccurrencesOfString: @"world" withString: @"universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] == "hello, universe" );
    ASSERT_TRUE( [ @"hello, world" cppStringByReplacingOccurrencesOfString: @"WORLD" withString: @"universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] == "hello, universe" );
    ASSERT_TRUE( [ @"hello, world" cppStringByReplacingOccurrencesOfString: @"world" withString: @"universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0,  4 ) ] == "hello, world" );
    ASSERT_TRUE( [ @"hello, world" cppStringByReplacingOccurrencesOfString: @"foo"   withString: @"universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] == "hello, world" );
}

TEST( ObjectiveCPP_NSString, stringByReplacingOccurrencesOfString_withCPPString )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfString: @"world" withCPPString: "universe" ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfString: @"foo"   withCPPString: "universe" ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, stringByReplacingOccurrencesOfString_withCPPString_options_range )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfString: @"world" withCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfString: @"WORLD" withCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfString: @"world" withCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0,  4 ) ] isEqualToString: @"hello, world" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfString: @"foo"   withCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, stringByReplacingOccurrencesOfCPPString_withString )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "world" withString: @"universe" ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "foo"   withString: @"universe" ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, stringByReplacingOccurrencesOfCPPString_withString_options_range )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "world" withString: @"universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "WORLD" withString: @"universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "world" withString: @"universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0,  4 ) ] isEqualToString: @"hello, world" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "foo"   withString: @"universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, stringByReplacingOccurrencesOfCPPString_withCPPString )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "world" withCPPString: "universe" ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "foo"   withCPPString: "universe" ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, stringByReplacingOccurrencesOfCPPString_withCPPString_options_range )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "world" withCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "WORLD" withCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, universe" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "world" withCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0,  4 ) ] isEqualToString: @"hello, world" ] );
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingOccurrencesOfCPPString: "foo"   withCPPString: "universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] isEqualToString: @"hello, world" ] );
}

TEST( ObjectiveCPP_NSString, cppStringByReplacingCharactersInRange_withString )
{
    ASSERT_TRUE( [ @"hello, world" cppStringByReplacingCharactersInRange: NSMakeRange( 7, 5 ) withString: @"universe" ] == "hello, universe" );
}

TEST( ObjectiveCPP_NSString, stringByReplacingCharactersInRange_withCPPString )
{
    ASSERT_TRUE( [ [ @"hello, world" stringByReplacingCharactersInRange: NSMakeRange( 7, 5 ) withCPPString: "universe" ] isEqualToString: @"hello, universe" ] );
}

TEST( ObjectiveCPP_NSString, caseInsensitiveCompareWithCPPString )
{
    ASSERT_TRUE( [ @"hello, world" caseInsensitiveCompareWithCPPString: "hello, WORLD"    ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" caseInsensitiveCompareWithCPPString: "HELLO, WORLD"    ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" caseInsensitiveCompareWithCPPString: "HELLO, WORLD..." ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" caseInsensitiveCompareWithCPPString: "hello, UNIVERSE" ] != NSOrderedSame );
}

TEST( ObjectiveCPP_NSString, localizedCaseInsensitiveCompareWithCPPString )
{
    ASSERT_TRUE( [ @"hello, world" localizedCaseInsensitiveCompareWithCPPString: "hello, WORLD"    ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedCaseInsensitiveCompareWithCPPString: "HELLO, WORLD"    ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedCaseInsensitiveCompareWithCPPString: "HELLO, WORLD..." ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedCaseInsensitiveCompareWithCPPString: "hello, UNIVERSE" ] != NSOrderedSame );
}

TEST( ObjectiveCPP_NSString, compareWithCPPString )
{
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world"    ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "HELLO, WORLD"    ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world..." ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, universe" ] != NSOrderedSame );
}

TEST( ObjectiveCPP_NSString, localizedCompareWithCPPString )
{
    ASSERT_TRUE( [ @"hello, world" localizedCompareWithCPPString: "hello, world"    ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedCompareWithCPPString: "HELLO, WORLD"    ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedCompareWithCPPString: "hello, world..." ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedCompareWithCPPString: "hello, universe" ] != NSOrderedSame );
}

TEST( ObjectiveCPP_NSString, compareWithCPPString_options )
{
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world"    options: NSCaseInsensitiveSearch ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "HELLO, WORLD"    options: NSCaseInsensitiveSearch ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world..." options: NSCaseInsensitiveSearch ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, universe" options: NSCaseInsensitiveSearch ] != NSOrderedSame );
}

TEST( ObjectiveCPP_NSString, compareWithCPPString_options_range )
{
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world"    options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world"    options: NSCaseInsensitiveSearch range: NSMakeRange( 0,  4 ) ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "HELLO, WORLD"    options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "HELLO, WORLD"    options: NSCaseInsensitiveSearch range: NSMakeRange( 0,  4 ) ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world..." options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) ] != NSOrderedSame );
}

TEST( ObjectiveCPP_NSString, compareWithCPPString_options_range_locale )
{
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world"    options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) locale: nil ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world"    options: NSCaseInsensitiveSearch range: NSMakeRange( 0,  4 ) locale: nil ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "HELLO, WORLD"    options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) locale: nil ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "HELLO, WORLD"    options: NSCaseInsensitiveSearch range: NSMakeRange( 0,  4 ) locale: nil ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, world..." options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) locale: nil ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" compareWithCPPString: "hello, universe" options: NSCaseInsensitiveSearch range: NSMakeRange( 0, 12 ) locale: nil ] != NSOrderedSame );
}

TEST( ObjectiveCPP_NSString, localizedStandardCompareWithCPPString )
{
    ASSERT_TRUE( [ @"hello, world" localizedStandardCompareWithCPPString: "hello, world"    ] == NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedStandardCompareWithCPPString: "HELLO, WORLD"    ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedStandardCompareWithCPPString: "hello, world..." ] != NSOrderedSame );
    ASSERT_TRUE( [ @"hello, world" localizedStandardCompareWithCPPString: "hello, universe" ] != NSOrderedSame );
}

TEST( ObjectiveCPP_NSString, hasCPPStringPrefix )
{
    ASSERT_TRUE(  [ @"hello, world" hasCPPStringPrefix: "hello" ] );
    ASSERT_FALSE( [ @"hello, world" hasCPPStringPrefix: "bonjour" ] );
}

TEST( ObjectiveCPP_NSString, hasCPPStringSuffix )
{
    ASSERT_TRUE(  [ @"hello, world" hasCPPStringSuffix: "world" ] );
    ASSERT_FALSE( [ @"hello, world" hasCPPStringSuffix: "universe" ] );
}

TEST( ObjectiveCPP_NSString, isEqualToCPPString )
{
    ASSERT_TRUE(  [ @"hello, world" isEqualToCPPString: "hello, world" ] );
    ASSERT_FALSE( [ @"hello, world" isEqualToCPPString: "hello, universe" ] );
}

TEST( ObjectiveCPP_NSString, cppStringByFoldingWithOptions_locale )
{
    ASSERT_TRUE( [ @"ß" cppStringByFoldingWithOptions: NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch | NSWidthInsensitiveSearch locale: nil ] == "ss" );
}

TEST( ObjectiveCPP_NSString, commonPrefixWithCPPString_options )
{
    ASSERT_TRUE( [ [ @"hello, world" commonPrefixWithCPPString: "hello, universe" options: NSCaseInsensitiveSearch ] isEqualToString: @"hello, " ] );
    ASSERT_TRUE( [ [ @"hello, world" commonPrefixWithCPPString: "HELLO, UNIVERSE" options: NSCaseInsensitiveSearch ] isEqualToString: @"hello, " ] );
    ASSERT_TRUE( [ [ @"hello, world" commonPrefixWithCPPString: "foo"             options: NSCaseInsensitiveSearch ] isEqualToString: @"" ] );
}

TEST( ObjectiveCPP_NSString, commonCPPPrefixWithString_options )
{
    ASSERT_TRUE( [ @"hello, world" commonCPPPrefixWithString: @"hello, universe" options: NSCaseInsensitiveSearch ] == "hello, " );
    ASSERT_TRUE( [ @"hello, world" commonCPPPrefixWithString: @"HELLO, UNIVERSE" options: NSCaseInsensitiveSearch ] == "hello, " );
    ASSERT_TRUE( [ @"hello, world" commonCPPPrefixWithString: @"foo"             options: NSCaseInsensitiveSearch ] == "" );
}

TEST( ObjectiveCPP_NSString, commonCPPPrefixWithCPPString_options )
{
    ASSERT_TRUE( [ @"hello, world" commonCPPPrefixWithCPPString: "hello, universe" options: NSCaseInsensitiveSearch ] == "hello, " );
    ASSERT_TRUE( [ @"hello, world" commonCPPPrefixWithCPPString: "HELLO, UNIVERSE" options: NSCaseInsensitiveSearch ] == "hello, " );
    ASSERT_TRUE( [ @"hello, world" commonCPPPrefixWithCPPString: "foo"             options: NSCaseInsensitiveSearch ] == "" );
}

TEST( ObjectiveCPP_NSString, capitalizedCPPString )
{
    ASSERT_TRUE( [ @"hello, world" capitalizedCPPString ] == "Hello, World" );
}

TEST( ObjectiveCPP_NSString, lowercaseCPPString )
{
    ASSERT_TRUE( [ @"HELLO, WORLD" lowercaseCPPString ] == "hello, world" );
}

TEST( ObjectiveCPP_NSString, uppercaseCPPString )
{
    ASSERT_TRUE( [ @"hello, world" uppercaseCPPString ] == "HELLO, WORLD" );
}

TEST( ObjectiveCPP_NSString, lastPathComponentAsCPPString )
{
    ASSERT_TRUE( [ @"foo/bar" lastPathComponentAsCPPString ] == "bar" );
}

TEST( ObjectiveCPP_NSString, pathExtensionAsCPPString )
{
    ASSERT_TRUE( [ @"foo/bar.txt" pathExtensionAsCPPString ] == "txt" );
}

TEST( ObjectiveCPP_NSString, cppStringByAbbreviatingWithTildeInPath )
{
    NSString * p;
    
    p = [ NSString stringWithFormat: @"/Users/%@/Desktop", NSUserName() ];
    
    ASSERT_TRUE( [ p cppStringByAbbreviatingWithTildeInPath ] == "~/Desktop" );
}

TEST( ObjectiveCPP_NSString, cppStringByAppendingPathComponent )
{
    ASSERT_TRUE( [ @"/foo/bar" cppStringByAppendingPathComponent: @"foobar" ] == "/foo/bar/foobar" );
}

TEST( ObjectiveCPP_NSString, stringByAppendingCPPPathComponent )
{
    ASSERT_TRUE( [ [ @"/foo/bar" stringByAppendingCPPPathComponent: "foobar" ] isEqualToString: @"/foo/bar/foobar" ] );
}

TEST( ObjectiveCPP_NSString, cppStringByAppendingCPPPathComponent )
{
    ASSERT_TRUE( [ @"/foo/bar" cppStringByAppendingCPPPathComponent: "foobar" ] == "/foo/bar/foobar" );
}

TEST( ObjectiveCPP_NSString, cppStringByAppendingPathExtension )
{
    ASSERT_TRUE( [ @"/foo/bar" cppStringByAppendingPathExtension: @"txt" ] == "/foo/bar.txt" );
}

TEST( ObjectiveCPP_NSString, stringByAppendingCPPPathExtension )
{
    ASSERT_TRUE( [ [ @"/foo/bar" stringByAppendingCPPPathExtension: "txt" ] isEqualToString: @"/foo/bar.txt" ] );
}

TEST( ObjectiveCPP_NSString, cppStringByAppendingCPPPathExtension )
{
    ASSERT_TRUE( [ @"/foo/bar" cppStringByAppendingCPPPathExtension: "txt" ] == "/foo/bar.txt" );
}

TEST( ObjectiveCPP_NSString, cppStringByDeletingLastPathComponent )
{
    ASSERT_TRUE( [ @"/foo/bar" cppStringByDeletingLastPathComponent ] == "/foo" );
}

TEST( ObjectiveCPP_NSString, cppStringByDeletingPathExtension )
{
    ASSERT_TRUE( [ @"/foo/bar.txt" cppStringByDeletingPathExtension ] == "/foo/bar" );
}

TEST( ObjectiveCPP_NSString, cppStringByExpandingTildeInPath )
{
    ASSERT_TRUE( [ @"~/Documents" cppStringByExpandingTildeInPath ].length() > std::string( "~/Documents" ).length() );
}

TEST( ObjectiveCPP_NSString, cppStringByResolvingSymlinksInPath )
{
    ASSERT_TRUE( [ @"/private/etc/hosts" cppStringByResolvingSymlinksInPath ] == "/etc/hosts" );
}

TEST( ObjectiveCPP_NSString, cppStringByStandardizingPath )
{
    ASSERT_TRUE( [ @"/private/etc/hosts" cppStringByStandardizingPath ] == "/etc/hosts" );
}

TEST( ObjectiveCPP_NSString, cppStringByAddingPercentEscapesUsingEncoding )
{
    ASSERT_TRUE( [ @"hello, world" cppStringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding ] == "hello,%20world" );
}

TEST( ObjectiveCPP_NSString, cppStringByReplacingPercentEscapesUsingEncoding )
{
    ASSERT_TRUE( [ @"hello,%20world" cppStringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding ] == "hello, world" );
}
