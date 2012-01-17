#import <Foundation/Foundation.h>
#import <iostream>
#import "NSString+ObjectiveCPP.h"

int main( void )
{
    @autoreleasepool
    {
        {
            std::string cppString = "hello, world";
            NSString * objcString = [ NSString stringWithCPPString: cppString encoding: NSUTF8StringEncoding ];
            
            NSLog( @"%@", objcString );
        }
        
        {
            NSString * objcString = @"hello, universe";
            std::string cppString = [ objcString cppStringUsingEncoding: NSUTF8StringEncoding ];
            
            std::cout << cppString << std::endl;
        }
    }
    
    return 0;
}
