//
//  CCColor+HexString.m
//  SpaceBotAlpha
//
//  Created by Sarah Smith on 19/02/2015.
//  Copyright (c) 2015 Smithsoft. All rights reserved.
//  

#import "CCColor+HexString.h"

@implementation CCColor (HexString)

+ (CCColor *)colorWithHexString:(NSString *)hexString
{
    hexString = [hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSUInteger len = [hexString length];
    CCColor *hexColor = nil;
    if (len > 0)
    {
        // Try first to match hex string with 4 terms
        BOOL tryingThreeTermHexString = NO;
        NSString *hx = @"^#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})";
        for (  ; hexColor == nil;  )
        {
            NSRegularExpression *hexColorString = [NSRegularExpression regularExpressionWithPattern:hx options:0 error:nil];
            NSArray *matches = [hexColorString matchesInString:hexString options:0 range:NSMakeRange(0, [hexString length])];
            if ([matches count] == 1)
            {
                NSUInteger r = 0, g = 0, b = 0, a = 1;
                NSTextCheckingResult *result = [matches objectAtIndex:0];
                NSInteger termCount = [result numberOfRanges] - 1;
                if (termCount == 3 || termCount == 4)
                {
                    r = strtol([[hexString substringWithRange:[result rangeAtIndex:1]] UTF8String], NULL, 16);
                    g = strtol([[hexString substringWithRange:[result rangeAtIndex:2]] UTF8String], NULL, 16);
                    b = strtol([[hexString substringWithRange:[result rangeAtIndex:3]] UTF8String], NULL, 16);
                    if (termCount == 4)
                    {
                        a = strtol([[hexString substringWithRange:[result rangeAtIndex:4]] UTF8String], NULL, 16);
                    }
                    hexColor = [CCColor colorWithGLKVector4:GLKVector4Make(r, g, b, a)];
                }
            }
            if (tryingThreeTermHexString) break;
            hx = @"^#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})";
            tryingThreeTermHexString = YES;
        }
    }
    if (hexColor == nil)
    {
        CCLOGWARN(@"Error: [colorWithHexString:%@] expected \"#rrggbb\" "
                  "or \"#rrggbbaa\"where r, g, b & a are 0-9|a-f|A-F", hexString);
    }
    return hexColor;
}

- (NSString *)hexString
{
    unsigned char r = [self red]   * 255.0f;
    unsigned char g = [self green] * 255.0f;
    unsigned char b = [self blue]  * 255.0f;
    unsigned char a = [self alpha] * 255.0f;
    return [NSString stringWithFormat:@"#%02x%02x%02x%02x", r, g, b, a];
}

@end
