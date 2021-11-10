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
 * @file        NSString+ObjectiveCPP.mm
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 */

#import <ObjectiveCPP.hpp>

static NSStringEncoding ObjectiveCPP_defaultCPPStringEncoding = NSUTF8StringEncoding;

@implementation NSString( ObjectiveCPP )

+ ( NSStringEncoding )defaultCPPStringEncoding
{
    @synchronized( self )
    {
        return ObjectiveCPP_defaultCPPStringEncoding;
    }
}

+ ( void )setDefaultCPPStringEncoding: ( NSStringEncoding )encoding
{
    @synchronized( self )
    {
        ObjectiveCPP_defaultCPPStringEncoding = encoding;
    }
}

+ ( NSString * )stringWithCPPString: ( const std::string & )cppString
{
    NSString * str;
    
    str = [ NSString stringWithCString: cppString.c_str() encoding: [ NSString defaultCPPStringEncoding ] ];
    
    return ( str ) ? str : @"";
}

+ ( NSString * )stringWithCPPString: ( const std::string & )cppString encoding: ( NSStringEncoding )enc
{
    NSString * str;
    
    str = [ NSString stringWithCString: cppString.c_str() encoding: enc ];
    
    return ( str ) ? str : @"";
}

+ ( std::string )cppStringWithContentsOfFile: ( NSString * )path encoding: ( NSStringEncoding )enc error: ( NSError * __autoreleasing * )error
{
    return [ [ NSString stringWithContentsOfFile: path encoding: enc error: error ] cppStringUsingEncoding: enc ];
}

+ ( std::string )cppStringWithContentsOfFile: ( NSString * )path usedEncoding: ( nullable NSStringEncoding * )enc error: ( NSError * __autoreleasing * )error
{
    return [ [ NSString stringWithContentsOfFile: path usedEncoding: enc error: error ] cppStringUsingEncoding: *( enc ) ];
}

+ ( std::string )cppStringWithContentsOfURL: ( NSURL * )url encoding: ( NSStringEncoding )enc error: ( NSError * __autoreleasing * )error
{
    return [ [ NSString stringWithContentsOfURL: url encoding: enc error: error ] cppStringUsingEncoding: enc ];
}

+ ( std::string )cppStringWithContentsOfURL: ( NSURL * )url usedEncoding: ( nullable NSStringEncoding * )enc error: ( NSError * __autoreleasing * )error
{
    return [ [ NSString stringWithContentsOfURL: url usedEncoding: enc error: error ] cppStringUsingEncoding: *( enc ) ];
}

- ( NSString * )initWithCPPString: ( const std::string & )cppString
{
    NSString * str;
    
    str = [ self initWithCString: cppString.c_str() encoding: [ NSString defaultCPPStringEncoding ] ];
    
    return ( str ) ? str : @"";
}

- ( NSString * )initWithCPPString: ( const std::string & )cppString encoding: ( NSStringEncoding )encoding
{
    NSString * str;
    
    str = [ self initWithCString: cppString.c_str() encoding: encoding ];
    
    return ( str ) ? str : @"";
}

- ( std::string )cppString
{
    const char * cp;
    
    cp = [ self cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringUsingEncoding: ( NSStringEncoding )encoding
{
    const char * cp;
    
    cp = [ self cStringUsingEncoding: encoding ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByAppendingString: ( NSString * )aString
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByAppendingString: aString ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( NSString * )stringByAppendingCPPString: ( const std::string & )aString
{
    return [ self stringByAppendingString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByPaddingToLength: ( NSUInteger )newLength withString: ( NSString * )padString startingAtIndex: ( NSUInteger )padIndex
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByPaddingToLength: newLength withString: padString startingAtIndex:padIndex ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( NSString * )stringByPaddingToLength: ( NSUInteger )newLength withCPPString: ( const std::string & )padString startingAtIndex: ( NSUInteger )padIndex
{
    return [ self stringByPaddingToLength: newLength withString: [ NSString stringWithCPPString: padString encoding: [ NSString defaultCPPStringEncoding ] ] startingAtIndex: padIndex ];
}

- ( std::string )cppStringByPaddingToLength: ( NSUInteger )newLength withCPPString: ( const std::string & )padString startingAtIndex: ( NSUInteger )padIndex
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByPaddingToLength: newLength withString: [ NSString stringWithCPPString: padString encoding: [ NSString defaultCPPStringEncoding ] ] startingAtIndex: padIndex ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( NSArray * )componentsSeparatedByCPPString: ( const std::string & )separator
{
    return [ self componentsSeparatedByString: [ NSString stringWithCPPString: separator encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByTrimmingCharactersInSet: ( NSCharacterSet * )set
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByTrimmingCharactersInSet: set ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppSubstringFromIndex: ( NSUInteger )anIndex
{
    NSString   * s;
    const char * cp;
    
    s  = [ self substringFromIndex: anIndex ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppSubstringWithRange: ( NSRange )aRange
{
    NSString   * s;
    const char * cp;
    
    s  = [ self substringWithRange: aRange ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppSubstringToIndex: ( NSUInteger )anIndex
{
    NSString   * s;
    const char * cp;
    
    s  = [ self substringToIndex: anIndex ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( NSRange )rangeOfCPPString: ( const std::string & )aString
{
    return [ self rangeOfString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSRange )rangeOfCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask
{
    return [ self rangeOfString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask ];
}

- ( NSRange )rangeOfCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )aRange
{
    return [ self rangeOfString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask range: aRange ];
}

- ( NSRange )rangeOfCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )searchRange locale: ( nullable NSLocale * )locale
{
    return [ self rangeOfString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask range: searchRange locale: locale ];
}

- ( std::string )cppStringByReplacingOccurrencesOfString: ( NSString * )target withString: ( NSString * )replacement
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByReplacingOccurrencesOfString: target withString: replacement ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByReplacingOccurrencesOfString: ( NSString * )target withString: ( NSString * )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByReplacingOccurrencesOfString: target withString: replacement options: options range: searchRange ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( NSString * )stringByReplacingOccurrencesOfString: ( NSString * )target withCPPString: ( const std::string & )replacement
{
    return [ self stringByReplacingOccurrencesOfString: target withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSString * )stringByReplacingOccurrencesOfString: ( NSString * )target withCPPString: ( const std::string & )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange
{
    return [ self stringByReplacingOccurrencesOfString: target withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] options: options range: searchRange ];
}

- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( const std::string & )target withString: ( NSString * )replacement
{
    return [ self stringByReplacingOccurrencesOfString: [ NSString stringWithCPPString: target encoding: [ NSString defaultCPPStringEncoding ] ] withString: replacement ];
}

- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( const std::string & )target withString: ( NSString * )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange
{
    return [ self stringByReplacingOccurrencesOfString: [ NSString stringWithCPPString: target encoding: [ NSString defaultCPPStringEncoding ] ] withString: replacement options: options range: searchRange ];
}

- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( const std::string & )target withCPPString: ( const std::string & )replacement
{
    return [ self stringByReplacingOccurrencesOfString: [ NSString stringWithCPPString: target encoding: [ NSString defaultCPPStringEncoding ] ] withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( const std::string & )target withCPPString: ( const std::string & )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange
{
    return [ self stringByReplacingOccurrencesOfString: [ NSString stringWithCPPString: target encoding: [ NSString defaultCPPStringEncoding ] ] withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] options: options range: searchRange ];
}

- ( std::string )cppStringByReplacingCharactersInRange: ( NSRange )range withString: ( NSString * )replacement
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByReplacingCharactersInRange: range withString: replacement ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( NSString * )stringByReplacingCharactersInRange: ( NSRange )range withCPPString: ( const std::string & )replacement
{
    return [ self stringByReplacingCharactersInRange: range withString: [ NSString stringWithCPPString: replacement encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )caseInsensitiveCompareWithCPPString: ( const std::string & )aString
{
    return [ self caseInsensitiveCompare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )localizedCaseInsensitiveCompareWithCPPString: ( const std::string & )aString
{
    return [ self localizedCaseInsensitiveCompare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )compareWithCPPString: ( const std::string & )aString
{
    return [ self compare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )localizedCompareWithCPPString: ( const std::string & )aString
{
    return [ self localizedCompare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( NSComparisonResult )compareWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask
{
    return [ self compare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask ];
}

- ( NSComparisonResult )compareWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )range
{
    return [ self compare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask range: range ];
}

- ( NSComparisonResult )compareWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )range locale: ( nullable id )locale
{
    return [ self compare: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask range: range locale: locale ];
}

- ( NSComparisonResult )localizedStandardCompareWithCPPString: ( const std::string & )string
{
    return [ self localizedStandardCompare: [ NSString stringWithCPPString: string encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( BOOL )hasCPPStringPrefix: ( const std::string & )aString
{
    return [ self hasPrefix: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( BOOL )hasCPPStringSuffix: ( const std::string & )aString
{
    return [ self hasSuffix: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( BOOL )isEqualToCPPString: ( const std::string & )aString
{
    return [ self isEqualToString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByFoldingWithOptions: ( NSStringCompareOptions )options locale: ( nullable NSLocale * )locale
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByFoldingWithOptions: options locale: locale ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( NSString * )commonPrefixWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask
{
    return [ self commonPrefixWithString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask ];
}

- ( std::string )commonCPPPrefixWithString: ( NSString * )aString options: ( NSStringCompareOptions )mask
{
    NSString   * s;
    const char * cp;
    
    s  = [ self commonPrefixWithString: aString options: mask ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )commonCPPPrefixWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask
{
    NSString   * s;
    const char * cp;
    
    s  = [ self commonPrefixWithString: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] options: mask ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )capitalizedCPPString
{
    NSString   * s;
    const char * cp;
    
    s  = [ self capitalizedString ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )lowercaseCPPString
{
    NSString   * s;
    const char * cp;
    
    s  = [ self lowercaseString ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )uppercaseCPPString
{
    NSString   * s;
    const char * cp;
    
    s  = [ self uppercaseString ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )lastPathComponentAsCPPString
{
    NSString   * s;
    const char * cp;
    
    s  = [ self lastPathComponent ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )pathExtensionAsCPPString
{
    NSString   * s;
    const char * cp;
    
    s  = [ self pathExtension ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByAbbreviatingWithTildeInPath
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByAbbreviatingWithTildeInPath ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByAppendingPathComponent: ( NSString * )aString
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByAppendingPathComponent: aString ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( NSString * )stringByAppendingCPPPathComponent: ( const std::string & )aString
{
    return [ self stringByAppendingPathComponent: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByAppendingCPPPathComponent: ( const std::string & )aString
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByAppendingPathComponent: [ NSString stringWithCPPString: aString encoding: [ NSString defaultCPPStringEncoding ] ] ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByAppendingPathExtension: ( NSString * )ext
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByAppendingPathExtension: ext ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( nullable NSString * )stringByAppendingCPPPathExtension: ( const std::string & )ext
{
    return [ self stringByAppendingPathExtension: [ NSString stringWithCPPString: ext encoding: [ NSString defaultCPPStringEncoding ] ] ];
}

- ( std::string )cppStringByAppendingCPPPathExtension: ( const std::string & )ext
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByAppendingPathExtension: [ NSString stringWithCPPString: ext encoding: [ NSString defaultCPPStringEncoding ] ] ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByDeletingLastPathComponent
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByDeletingLastPathComponent ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByDeletingPathExtension
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByDeletingPathExtension ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByExpandingTildeInPath
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByExpandingTildeInPath ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByResolvingSymlinksInPath
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByResolvingSymlinksInPath ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByStandardizingPath
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByStandardizingPath ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByAddingPercentEscapesUsingEncoding: ( NSStringEncoding )encoding
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByAddingPercentEscapesUsingEncoding: encoding ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

- ( std::string )cppStringByReplacingPercentEscapesUsingEncoding: ( NSStringEncoding )encoding
{
    NSString   * s;
    const char * cp;
    
    s  = [ self stringByReplacingPercentEscapesUsingEncoding: encoding ];
    cp = [ s cStringUsingEncoding: [ NSString defaultCPPStringEncoding ] ];
    
    return std::string( ( cp ) ? cp : "" );
}

@end
