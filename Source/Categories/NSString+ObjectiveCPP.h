#ifdef __cplusplus

#import <Foundation/Foundation.h>
#import <string>

@interface NSString( ObjectiveCPP )

+ ( NSStringEncoding )defaultCPPStringEncoding;
+ ( void )setDefaultCPPStringEncoding: ( NSStringEncoding )encoding;

+ ( id )stringWithCPPString: ( std::string & )cppString encoding: ( NSStringEncoding )enc;
+ ( std::string )cppStringWithContentsOfFile: ( NSString * )path encoding: ( NSStringEncoding )enc error: ( NSError ** )error;
+ ( std::string )cppStringWithContentsOfFile: ( NSString * )path usedEncoding: ( NSStringEncoding * )enc error: ( NSError ** )error;
+ ( std::string )cppStringWithContentsOfURL: ( NSURL * )url encoding: ( NSStringEncoding )enc error: ( NSError ** )error;
+ ( std::string )cppStringWithContentsOfURL: ( NSURL * )url usedEncoding: ( NSStringEncoding * )enc error: ( NSError ** )error;

- ( id )initWithCPPString: ( std::string & )cppString encoding: ( NSStringEncoding )encoding;
- ( std::string )cppStringUsingEncoding: ( NSStringEncoding )encoding;
- ( std::string )cppStringByAppendingString: ( NSString * )aString;
- ( NSString * )stringByAppendingCPPString: ( std::string & )aString;
- ( std::string )cppStringByPaddingToLength: ( NSUInteger )newLength withString: ( NSString * )padString startingAtIndex: ( NSUInteger )padIndex;
- ( NSString * )stringByPaddingToLength: ( NSUInteger )newLength withCPPString: ( std::string & )padString startingAtIndex: ( NSUInteger )padIndex;
- ( NSArray * )componentsSeparatedByCPPString: ( std::string & )separator;
- ( std::string )cppStringByTrimmingCharactersInSet: ( NSCharacterSet * )set;
- ( std::string )cppSubstringFromIndex: ( NSUInteger )anIndex;
- ( std::string )cppSubstringWithRange: ( NSRange )aRange;
- ( std::string )cppSubstringToIndex: ( NSUInteger )anIndex;
- ( NSRange )rangeOfCPPString: ( std::string & )aString;
- ( NSRange )rangeOfCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask;
- ( NSRange )rangeOfCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )aRange;
- ( NSRange )rangeOfCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )searchRange locale: ( NSLocale * )locale;
- ( std::string )cppStringByReplacingOccurrencesOfString: ( NSString * )target withString: ( NSString * )replacement;
- ( std::string )cppStringByReplacingOccurrencesOfString: ( NSString * )target withString: ( NSString * )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange;
- ( NSString * )stringByReplacingOccurrencesOfString: ( NSString * )target withCPPString: ( std::string & )replacement;
- ( NSString * )stringByReplacingOccurrencesOfString: ( NSString * )target withCPPString: ( std::string & )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange;
- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( std::string & )target withString: ( NSString * )replacement;
- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( std::string & )target withString: ( NSString * )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange;
- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( std::string & )target withCPPString: ( std::string & )replacement;
- ( NSString * )stringByReplacingOccurrencesOfCPPString: ( std::string & )target withCPPString: ( std::string & )replacement options: ( NSStringCompareOptions )options range: ( NSRange )searchRange;
- ( std::string )cppStringByReplacingCharactersInRange: ( NSRange )range withString: ( NSString * )replacement;
- ( NSString * )stringByReplacingCharactersInRange: ( NSRange )range withCPPString: ( std::string & )replacement;
- ( NSComparisonResult )caseInsensitiveCompareWithCPPString: ( std::string & )aString;
- ( NSComparisonResult )localizedCaseInsensitiveCompareWithCPPString: ( std::string & )aString;
- ( NSComparisonResult )compareWithCPPString: ( std::string & )aString;
- ( NSComparisonResult )localizedCompareWithCPPString: ( std::string & )aString;
- ( NSComparisonResult )compareWithCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask;
- ( NSComparisonResult )compareWithCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )range;
- ( NSComparisonResult )compareWithCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask range: ( NSRange )range locale: ( id )locale;
- ( NSComparisonResult )localizedStandardCompareWithCPPString: ( std::string & )string;
- ( BOOL )hasCPPStringPrefix: ( std::string & )aString;
- ( BOOL )hasCPPStringSuffix: ( std::string & )aString;
- ( BOOL )isEqualToCPPString: ( std::string & )aString;
- ( std::string )cppStringByFoldingWithOptions: ( NSStringCompareOptions )options locale: ( NSLocale * )locale;
- ( NSString * )commonPrefixWithCPPString: ( std::string & )aString options: ( NSStringCompareOptions )mask;
- ( std::string )commonCPPPrefixWithString: ( NSString * )aString options: ( NSStringCompareOptions )mask;
- ( std::string )capitalizedCPPString;
- ( std::string )lowercaseCPPString;
- ( std::string )uppercaseCPPString;
- ( std::string )decomposedCPPStringWithCanonicalMapping;
- ( std::string )decomposedCPPStringWithCompatibilityMapping;
- ( std::string )precomposedCPPStringWithCanonicalMapping;
- ( std::string )precomposedCPPStringWithCompatibilityMapping;
- ( std::string )lastPathComponentAsCPPString;
- ( std::string )pathExtensionAsCPPString;
- ( std::string )cppStringByAbbreviatingWithTildeInPath;
- ( std::string )cppStringByAppendingPathComponent: ( NSString * )aString;
- ( NSString * )cppStringByAppendingCPPPathComponent: ( std::string & )aString;
- ( std::string )cppStringByAppendingPathExtension: ( NSString * )ext;
- ( NSString * )stringByAppendingCPPPathExtension: ( std::string & )ext;
- ( std::string )cppStringByDeletingLastPathComponent;
- ( std::string )cppStringByDeletingPathExtension;
- ( std::string )cppStringByExpandingTildeInPath;
- ( std::string )cppStringByResolvingSymlinksInPath;
- ( std::string )cppStringByStandardizingPath;
- ( std::string )cppStringByAddingPercentEscapesUsingEncoding: ( NSStringEncoding )encoding;
- ( std::string )cppStringByReplacingPercentEscapesUsingEncoding: ( NSStringEncoding )encoding;

@end

#endif
