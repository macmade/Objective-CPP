Objective-CPP
=============

[![Build Status](https://img.shields.io/github/workflow/status/macmade/Objective-CPP/ci-mac?label=macOS&logo=apple)](https://github.com/macmade/Objective-CPP/actions/workflows/ci-mac.yaml)
[![Build Status](https://img.shields.io/github/workflow/status/macmade/Objective-CPP/ci-win?label=Windows&logo=windows)](https://github.com/macmade/Objective-CPP/actions/workflows/ci-win.yaml)
[![Issues](http://img.shields.io/github/issues/macmade/Objective-CPP.svg?logo=github)](https://github.com/macmade/Objective-CPP/issues)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?logo=git)
![License](https://img.shields.io/badge/license-mit-brightgreen.svg?logo=open-source-initiative)  
[![Contact](https://img.shields.io/badge/follow-@macmade-blue.svg?logo=twitter&style=social)](https://twitter.com/macmade)
[![Sponsor](https://img.shields.io/badge/sponsor-macmade-pink.svg?logo=github-sponsors&style=social)](https://github.com/sponsors/macmade)

About
-----

**C++ compatibility library for Objective-C**  
Objective-CPP is a library intended to ease software development using Objective-C++.

It declares categories on Objective-C classes, to work with the STL C++ types, such as std::string, std::vector, etc.

For instance, with Objective-CPP, you can call every method of the NSString class passing std::string objects, instead of NSString objects.
The same applies for the return types, as you can get seamlessly std::string objects out of NSString objects.

### Example:

Here's a little example with NSString:

    {
        NSString * objcString = @"hello, world";
        std::string cppString = [ objcString cppStringUsingEncoding: NSUTF8StringEncoding ];
        
        std::cout << cppString << std::endl;
    }
    
And the same in the other way:

    {
        std::string cppString = "hello, world";
        NSString * objcString = [ NSString stringWithCPPString: cppString encoding: NSUTF8StringEncoding ];
        
        NSLog( @"%@", objcString );
    }

#### Strings:

Objective-CPP expands the NSString class with a category, adding support for C++ strings (std::string).  
All methods from NSString can then return a std::string instead of a NSString *, or take std::string arguments instead of NSString * arguments.

By default, Objective-CPP uses UTF-8 as default encoding for strings, for converting NSString objects into C++ string objects, and reverse.  
You can set another encoding using the new 'setDefaultCPPStringEncoding' class method of NSString:

    [ NSString setDefaultCPPStringEncoding: NSASCIIStringEncoding ];

License
-------

Objective-CPP is released under the terms of the MIT License.

Repository Infos
----------------

    Owner:			Jean-David Gadina - XS-Labs
    Web:			www.xs-labs.com
    Blog:			www.noxeos.com
    Twitter:		@macmade
    GitHub:			github.com/macmade
    LinkedIn:		ch.linkedin.com/in/macmade/
    StackOverflow:	stackoverflow.com/users/182676/macmade
