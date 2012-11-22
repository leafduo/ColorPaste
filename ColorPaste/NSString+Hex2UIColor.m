//
//  NSString+Hex2UIColor.m
//  Color Paste
//
//  Created by leafduo on 11/22/12.
//  Copyright (c) 2012 leafduo.com. All rights reserved.
//

#import "NSString+Hex2UIColor.h"

@implementation NSString (Hex2UIColor)

+ (NSString *)stringOfUIColorFromHexString:(NSString *)hexString {
    hexString = [hexString stringByTrimmingCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdefgABCDEFG"] invertedSet]];
    if (hexString.length != 6) {
        return nil;
    }
    NSString *rString = [hexString substringWithRange:NSMakeRange(0, 2)];
    NSString *gString = [hexString substringWithRange:NSMakeRange(2, 2)];
    NSString *bString = [hexString substringWithRange:NSMakeRange(4, 2)];
    
    unsigned r, g, b;
    
    BOOL success =
        [[NSScanner scannerWithString:rString] scanHexInt:&r] &&
        [[NSScanner scannerWithString:gString] scanHexInt:&g] &&
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (!success) {
        return nil;
    }
    
    return [NSString stringWithFormat:@"[UIColor colorWithRed:%f green:%f blue:%f alpha:1.0]", r/255., g/255., b/255.];
}

@end
