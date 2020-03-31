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
 * @file        Test-List.mm
 * @copyright   (c) 2015 - Jean-David Gadina - www.xs-labs.com / www.digidna.net
 * @abstract    Unit tests for list functions
 */

#define XSTEST_GTEST_COMPAT
#import <XSTest/XSTest.hpp>
#import <ObjectiveCPP.hpp>

/* Not wanted for Objective-C */
#pragma clang diagnostic ignored "-Wobjc-missing-property-synthesis"
#pragma clang diagnostic ignored "-Wselector"

@interface ObjectiveCPP_List_Test: NSObject

@property( atomic, readwrite, assign ) std::string string;

- ( instancetype )initWithSTDString: ( std::string )s;

@end

@implementation ObjectiveCPP_List_Test

- ( instancetype )initWithSTDString: ( std::string )s
{
    if( ( self = [ super init ] ) )
    {
        self.string = s;
    }
    
    return self;
}

@end

using namespace testing;

TEST( ObjectiveCPP_List, ArrayFromList_String )
{
    std::list< std::string > l = { "hello, world", "hello, universe" };
    NSArray< NSString * >  * a;
    
    a = ObjectiveCPP::ArrayFromList( l );
    
    ASSERT_TRUE( a.count == l.size() );
    
    ASSERT_TRUE( [ a[ 0 ] isKindOfClass: [ NSString class ] ] );
    ASSERT_TRUE( [ a[ 1 ] isKindOfClass: [ NSString class ] ] );
    
    ASSERT_TRUE( [ a[ 0 ] isEqualToString: @"hello, world" ] );
    ASSERT_TRUE( [ a[ 1 ] isEqualToString: @"hello, universe" ] );
}

TEST( ObjectiveCPP_List, ArrayFromList_Bool )
{
    std::list< bool >       l = { true, false, true };
    NSArray< NSNumber * > * a;
    
    a = ObjectiveCPP::ArrayFromList( l );
    
    ASSERT_TRUE( a.count == l.size() );
    
    ASSERT_TRUE( [ a[ 0 ] isKindOfClass: [ NSNumber class ] ] );
    ASSERT_TRUE( [ a[ 1 ] isKindOfClass: [ NSNumber class ] ] );
    ASSERT_TRUE( [ a[ 2 ] isKindOfClass: [ NSNumber class ] ] );
    
    ASSERT_TRUE( [ a[ 0 ] isEqual: @1 ] );
    ASSERT_TRUE( [ a[ 1 ] isEqual: @0 ] );
    ASSERT_TRUE( [ a[ 2 ] isEqual: @1 ] );
}

template< typename T >
void ObjectiveCPP_List_ArrayFromList_Number_T( void )
{
    std::list< T >          l = { 0, 1, 2, 42 };
    NSArray< NSNumber * > * a;
    
    a = ObjectiveCPP::ArrayFromList( l );
    
    ASSERT_TRUE( a.count == l.size() );
    
    ASSERT_TRUE( [ a[ 0 ] isKindOfClass: [ NSNumber class ] ] );
    ASSERT_TRUE( [ a[ 1 ] isKindOfClass: [ NSNumber class ] ] );
    ASSERT_TRUE( [ a[ 2 ] isKindOfClass: [ NSNumber class ] ] );
    ASSERT_TRUE( [ a[ 3 ] isKindOfClass: [ NSNumber class ] ] );
    
    ASSERT_TRUE( [ a[ 0 ] isEqual: @0 ] );
    ASSERT_TRUE( [ a[ 1 ] isEqual: @1 ] );
    ASSERT_TRUE( [ a[ 2 ] isEqual: @2 ] );
    ASSERT_TRUE( [ a[ 3 ] isEqual: @42 ] );
}

TEST( ObjectiveCPP_List, ArrayFromList_Number )
{
    ObjectiveCPP_List_ArrayFromList_Number_T< signed char >();
    ObjectiveCPP_List_ArrayFromList_Number_T< unsigned char >();
    ObjectiveCPP_List_ArrayFromList_Number_T< signed short >();
    ObjectiveCPP_List_ArrayFromList_Number_T< unsigned short >();
    ObjectiveCPP_List_ArrayFromList_Number_T< signed int >();
    ObjectiveCPP_List_ArrayFromList_Number_T< unsigned int >();
    ObjectiveCPP_List_ArrayFromList_Number_T< signed long >();
    ObjectiveCPP_List_ArrayFromList_Number_T< unsigned long >();
    ObjectiveCPP_List_ArrayFromList_Number_T< signed long long >();
    ObjectiveCPP_List_ArrayFromList_Number_T< unsigned long long >();
    ObjectiveCPP_List_ArrayFromList_Number_T< float >();
    ObjectiveCPP_List_ArrayFromList_Number_T< double >();
}

TEST( ObjectiveCPP_List, ArrayFromList_Custom )
{
    std::list< std::string >              l = { "hello, world", "hello, universe" };
    NSArray< ObjectiveCPP_List_Test * > * a;
    
    a = ObjectiveCPP::ArrayFromList< std::string, ObjectiveCPP_List_Test >( l, @selector( initWithSTDString: ) );
    
    ASSERT_TRUE( a.count == l.size() );
    
    ASSERT_TRUE( [ a[ 0 ] isKindOfClass: [ ObjectiveCPP_List_Test class ] ] );
    ASSERT_TRUE( [ a[ 1 ] isKindOfClass: [ ObjectiveCPP_List_Test class ] ] );
    
    ASSERT_TRUE( a[ 0 ].string == "hello, world" );
    ASSERT_TRUE( a[ 1 ].string == "hello, universe" );
}

TEST( ObjectiveCPP_List, ListFromArray_String )
{
    NSArray                * a;
    std::list< std::string > l;
    
    a = @[ @"hello, world", @"hello, universe" ];
    l = ObjectiveCPP::ListFromArray< std::string, NSString >( a, @selector( cppString ) );
    
    ASSERT_TRUE( a.count == l.size() );
    
    ASSERT_TRUE( *( std::next( l.begin(), 0 ) ) == "hello, world" );
    ASSERT_TRUE( *( std::next( l.begin(), 1 ) ) == "hello, universe" );
}

TEST( ObjectiveCPP_List, ListFromArray_Int )
{
    NSArray        * a;
    std::list< int > l;
    
    a = @[ @0, @1, @2, @42 ];
    l = ObjectiveCPP::ListFromArray< int, NSNumber >( a, @selector( intValue ) );
    
    ASSERT_TRUE( a.count == l.size() );
    
    ASSERT_TRUE( *( std::next( l.begin(), 0 ) ) == 0 );
    ASSERT_TRUE( *( std::next( l.begin(), 1 ) ) == 1 );
    ASSERT_TRUE( *( std::next( l.begin(), 2 ) ) == 2 );
    ASSERT_TRUE( *( std::next( l.begin(), 3 ) ) == 42 );
}
