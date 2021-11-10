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
 * @header      NSString+ObjectiveCPP.hpp
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 */

#include <string>

#ifndef NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_BEGIN
#define NS_ASSUME_NONNULL_END
#define nullable
#endif

#ifndef instancetype
#define instancetype id
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString( ObjectiveCPP )

+ ( NSStringEncoding )defaultCPPStringEncoding;
+ ( void )setDefaultCPPStringEncoding: ( NSStringEncoding )encoding;

+ ( NSString * )stringWithCPPString: ( const std::string & )cppString;
+ ( NSString * )stringWithCPPString: ( const std::string & )cppString encoding: ( NSStringEncoding )enc;
+ ( std::string )cppStringWithContentsOfFile: ( NSString * )path encoding: ( NSStringEncoding )enc error: ( NSError * __autoreleasing * )error;
+ ( std::string )cppStringWithContentsOfFile: ( NSString * )path usedEncoding: ( nullable NSStringEncoding * )enc error: ( NSError * __autoreleasing * )error;
+ ( std::string )cppStringWithContentsOfURL: ( NSURL * )url encoding: ( NSStringEncoding )enc error: ( NSError * __autoreleasing * )error;
+ ( std::string )cppStringWithContentsOfURL: ( NSURL * )url usedEncoding: ( nullable NSStringEncoding * )enc error: ( NSError * __autoreleasing * )error;

- ( NSString * )initWithCPPString: ( const std::string & )cppString;
- ( NSString * )initWithCPPString: ( const std::string & )cppString encoding: ( NSStringEncoding )encoding;

- ( std::string )cppString;
- ( std::string )cppStringUsingEncoding: ( NSStringEncoding )encoding;
- ( std::string )cppStringByAppendingString: ( NSString * )aString;
- ( NSString * )stringByAppendingCPPString: ( const std::string & )aString;
- ( std::string )cppStringByPaddingToLength: ( NSUInteger )newLength withString: ( NSString * )padString startingAtIndex: ( NSUInteger )padIndex;
- ( NSString * )stringByPaddingToLength: ( NSUInteger )newLength withCPPString: ( const std::string & )padString startingAtIndex: ( NSUInteger )padIndex;
- ( std::string )cppStringByPaddingToLength: ( NSUInteger )newLength withCPPString: ( const std::string & )padString startingAtIndex: ( NSUInteger )padIndex;
- ( NSArray * )componentsSeparatedByCPPString: ( const std::string & )separator;
- ( std::string )cppStringByTrimmingCharactersInSet: ( NSCharacterSet * )set;
- ( std::string )cppSubstringFromIndex: ( NSUInteger )anIndex;
- ( std::string )cppSubstringWithRange: ( NSRange )aRange;
- ( std::string )cppSubstringToIndex: ( NSUInteger )anIndex;

- ( NSRange )rangeOfCPPString: ( const std::string & )aString;
- ( NSRange )rangeOfCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask;
- ( NSRange )rangeOfCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )aRange;
- ( NSRange )rangeOfCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )searchRange locale: ( nullable NSLocale * )locale;

- ( std::string )cppStringByReplacingOccurrencesOfString: ( NSString * )target withString: ( NSString * )replacement;
- ( std::string )cppStringByReplacingOccurrencesOfString: ( NSString * )target withString: ( NSString * )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange;
- ( NSString * )stringByReplacingOccurrencesOfString: ( NSString * )target withCPPString: ( const std::string & )replacement;
- ( NSString * )stringByReplacingOccurrencesOfString: ( NSString * )target withCPPString: ( const std::string & )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange;
- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( const std::string & )target withString: ( NSString * )replacement;
- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( const std::string & )target withString: ( NSString * )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange;
- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( const std::string & )target withCPPString: ( const std::string & )replacement;
- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( const std::string & )target withCPPString: ( const std::string & )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange;
- ( std::string )cppStringByReplacingCharactersInRange: ( NSRange )range withString: ( NSString * )replacement;
- ( NSString * )stringByReplacingCharactersInRange: ( NSRange )range withCPPString: ( const std::string & )replacement;

- ( NSComparisonResult )caseInsensitiveCompareWithCPPString: ( const std::string & )aString;
- ( NSComparisonResult )localizedCaseInsensitiveCompareWithCPPString: ( const std::string & )aString;
- ( NSComparisonResult )compareWithCPPString: ( const std::string & )aString;
- ( NSComparisonResult )localizedCompareWithCPPString: ( const std::string & )aString;
- ( NSComparisonResult )compareWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask;
- ( NSComparisonResult )compareWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )range;
- ( NSComparisonResult )compareWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )range locale: ( nullable id )locale;
- ( NSComparisonResult )localizedStandardCompareWithCPPString: ( const std::string & )string;

- ( BOOL )hasCPPStringPrefix: ( const std::string & )aString;
- ( BOOL )hasCPPStringSuffix: ( const std::string & )aString;
- ( BOOL )isEqualToCPPString: ( const std::string & )aString;

- ( std::string )cppStringByFoldingWithOptions: ( NSStringCompareOptions )options locale: ( nullable NSLocale * )locale;
- ( NSString * )commonPrefixWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask;
- ( std::string )commonCPPPrefixWithString: ( NSString * )aString options: ( NSStringCompareOptions )mask;
- ( std::string )commonCPPPrefixWithCPPString: ( const std::string & )aString options: ( NSStringCompareOptions )mask;
- ( std::string )capitalizedCPPString;
- ( std::string )lowercaseCPPString;
- ( std::string )uppercaseCPPString;
- ( std::string )lastPathComponentAsCPPString;
- ( std::string )pathExtensionAsCPPString;
- ( std::string )cppStringByAbbreviatingWithTildeInPath;
- ( std::string )cppStringByAppendingPathComponent: ( NSString * )aString;
- ( NSString * )stringByAppendingCPPPathComponent: ( const std::string & )aString;
- ( std::string )cppStringByAppendingCPPPathComponent: ( const std::string & )aString;
- ( std::string )cppStringByAppendingPathExtension: ( NSString * )ext;
- ( nullable NSString * )stringByAppendingCPPPathExtension: ( const std::string & )ext;
- ( std::string )cppStringByAppendingCPPPathExtension: ( const std::string & )ext;
- ( std::string )cppStringByDeletingLastPathComponent;
- ( std::string )cppStringByDeletingPathExtension;
- ( std::string )cppStringByExpandingTildeInPath;
- ( std::string )cppStringByResolvingSymlinksInPath;
- ( std::string )cppStringByStandardizingPath;
- ( std::string )cppStringByAddingPercentEscapesUsingEncoding: ( NSStringEncoding )encoding;
- ( std::string )cppStringByReplacingPercentEscapesUsingEncoding: ( NSStringEncoding )encoding;

@end

NS_ASSUME_NONNULL_END
