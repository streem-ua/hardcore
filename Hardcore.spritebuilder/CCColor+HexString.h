//
//  CCColor+HexString.h
//  SpaceBotAlpha
//
//  Created by Sarah Smith on 19/02/2015.
//  Copyright (c) 2015 Smithsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CCColor.h>

@interface CCColor (HexString)

/**
 * Create a color based on a web-style hex string, that is a string of
 * 3 or 4 hex number terms, prefixed by a '#' symbol.  Valid examples
 * are #1a44ccff or #ccab00.  Thus the string is of the form
 * #rrggbb[aa] where r, g, b & a are 0-9, a-f or A-F
 *
 * @param Hex string to parse for the color value.
 *
 * @return Color value or nil if the color could not be parsed.
 */
+ (CCColor *)colorWithHexString:(NSString *)hexString;

/**
 * Hex string representing this color.
 *
 * @return A hex string representation of the color.
 */
- (NSString *)hexString;

@end
