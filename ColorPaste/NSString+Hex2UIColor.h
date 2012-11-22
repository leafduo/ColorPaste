//
//  NSString+Hex2UIColor.h
//  Color Paste
//
//  Created by leafduo on 11/22/12.
//  Copyright (c) 2012 leafduo.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hex2UIColor)

+ (NSString *)stringOfUIColorFromHexString:(NSString *)hexString;

@end
