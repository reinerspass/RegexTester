//
//  AppController.h
//  RegexTester
//
//  Created by Markus Teufel on 12/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject
{
    NSRegularExpression *regex;
    BOOL usesNSRegularExpressionCaseInsensitive;
    BOOL usesNSRegularExpressionAllowCommentsAndWhitespace;
    BOOL usesNSRegularExpressionIgnoreMetacharacters;
    BOOL usesNSRegularExpressionDotMatchesLineSeparators;
    BOOL usesNSRegularExpressionAnchorsMatchLines;
    BOOL usesNSRegularExpressionUseUnixLineSeparators;
    BOOL usesNSRegularExpressionUseUnicodeWordBoundaries;
}

@property (unsafe_unretained) IBOutlet NSTextView *regexTextView;
@property (unsafe_unretained) IBOutlet NSTextView *plainTextView;

@property BOOL usesNSRegularExpressionCaseInsensitive;
@property BOOL usesNSRegularExpressionAllowCommentsAndWhitespace;
@property BOOL usesNSRegularExpressionIgnoreMetacharacters;
@property BOOL usesNSRegularExpressionDotMatchesLineSeparators;
@property BOOL usesNSRegularExpressionAnchorsMatchLines;
@property BOOL usesNSRegularExpressionUseUnixLineSeparators;
@property BOOL usesNSRegularExpressionUseUnicodeWordBoundaries;

-(NSMatchingOptions)options;

@end
