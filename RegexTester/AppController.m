//
//  AppController.m
//  RegexTester
//
//  Created by Markus Teufel on 12/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController
@synthesize regexTextView;
@synthesize plainTextView;
@synthesize usesNSRegularExpressionCaseInsensitive, usesNSRegularExpressionAllowCommentsAndWhitespace, usesNSRegularExpressionIgnoreMetacharacters, usesNSRegularExpressionDotMatchesLineSeparators, usesNSRegularExpressionAnchorsMatchLines, usesNSRegularExpressionUseUnixLineSeparators, usesNSRegularExpressionUseUnicodeWordBoundaries;


- (void)awakeFromNib
{
    [regexTextView.textStorage setAttributedString:[[NSAttributedString alloc] initWithString:@"e"]];
    [plainTextView.textStorage setAttributedString:[[NSAttributedString alloc] initWithString:@"regex tester"]];
}

- (IBAction)openHelp:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://developer.apple.com/library/IOs/#documentation/Foundation/Reference/NSRegularExpression_Class/Reference/Reference.html"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}

- (void)textViewDidChangeSelection:(NSNotification *)aNotification {
    NSLog(@"goil update");
    
    
    NSString *regularExpressionString = regexTextView.textStorage.string;
    NSString *textString = plainTextView.textStorage.string;
    NSMutableAttributedString *attrString = [plainTextView.attributedString mutableCopy];
    
    NSError *error = NULL;
    regex = [NSRegularExpression regularExpressionWithPattern:regularExpressionString
                                                      options:[self options]
                                                        error:&error];

    [attrString addAttribute:NSForegroundColorAttributeName 
                       value:[NSColor blackColor] 
                       range:NSMakeRange(0, textString.length)];

    
    [regex enumerateMatchesInString:textString options:0 range:NSMakeRange(0, [textString length]) usingBlock:^(NSTextCheckingResult *match, NSMatchingFlags flags, BOOL *stop){
        NSRange matchRange = [match range];
        [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor redColor] range:matchRange];
    }];
    
    [plainTextView.textStorage setAttributedString:attrString];
}


-(NSMatchingOptions)options
{
    NSMatchingOptions options = 0;
    
    if (usesNSRegularExpressionCaseInsensitive)
        options |= NSRegularExpressionCaseInsensitive;
    if (usesNSRegularExpressionAllowCommentsAndWhitespace)
        options |= NSRegularExpressionAllowCommentsAndWhitespace;
    if (usesNSRegularExpressionIgnoreMetacharacters)
        options |= NSRegularExpressionIgnoreMetacharacters;
    if (usesNSRegularExpressionDotMatchesLineSeparators)
        options |= NSRegularExpressionDotMatchesLineSeparators;
    if (usesNSRegularExpressionAnchorsMatchLines)
        options |= NSRegularExpressionAnchorsMatchLines;
    if (usesNSRegularExpressionUseUnixLineSeparators)
        options |= NSRegularExpressionUseUnixLineSeparators;
    if (usesNSRegularExpressionUseUnicodeWordBoundaries)
        options |= NSRegularExpressionUseUnicodeWordBoundaries;
    
    return options;
}

@end
