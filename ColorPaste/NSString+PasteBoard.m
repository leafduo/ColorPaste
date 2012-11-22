//
//  NSString+PasteBoard.m
//  Color Paste
//
//  Created by leafduo on 11/23/12.
//  Copyright (c) 2012 leafduo.com. All rights reserved.
//

#import "NSString+PasteBoard.h"

@implementation NSString (PasteBoard)

+ (NSString *)stringFromPasteBoard {
    NSAttributedString *attributedString = [[[NSPasteboard generalPasteboard] readObjectsForClasses:@[[NSAttributedString class]] options:nil] lastObject];
    NSString *string = [attributedString string];
    return string;
}

@end
