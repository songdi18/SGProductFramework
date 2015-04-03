//
//  SGTextAttachment.m
//  UITextKitDemo
//
//  Created by 宋迪 on 15/3/18.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "SGTextAttachment.h"

@implementation SGTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex NS_AVAILABLE_IOS(7_0)
{
    return CGRectMake( 0 , -8 ,lineFrag.size.height+10, lineFrag.size.height+10);
}


@end
