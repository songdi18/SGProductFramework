//
//  SGLabel.h
//  UITextKitDemo
//
//  Created by 宋迪 on 15/3/18.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "SGTextKitMarco.h"

#import <UIKit/UIKit.h>

@interface SGLabel : UILabel

/**
 *富文本属性（传入含表情替换符的string）
 */
@property(nonatomic,strong)NSString* richText;
/**
 *功能：改变部分文字内容的颜色
 *参数： (1)改变的颜色: color
 *      (2)改变的文字内容: content
 */
-(void)changeColor:(UIColor*)color withContent:(NSString*)content;
/**
 *功能：改变固定区域的颜色
 *参数： (1)改变的颜色: color
 *      (2)改变的文字区域: range
 */
-(void)changeColor:(UIColor*)color withRange:(NSRange)range;

@end
