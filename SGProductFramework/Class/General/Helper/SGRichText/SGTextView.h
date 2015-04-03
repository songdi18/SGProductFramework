//
//  SGTextView.h
//  UITextKitDemo
//
//  Created by 宋迪 on 15/3/20.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGTextKitMarco.h"
@class SGTextView;
@protocol SGTextViewDelegate <NSObject>
/**
 *功能：点击url之后执行的委托方法
 *参数： (1)SGTextView类: sgTextView
 *      (2)url内容: urlString
 *      (3)url的Range: urlRange
 */
-(void)SGTextView:(SGTextView*)sgTextView didClickedUrlAction:(NSString*)urlString urlRange:(NSRange)urlRange;

@end

@interface SGTextView : UITextView
/**
 *富文本属性（传入含表情替换符的string）
 */
@property(nonatomic,strong)NSString* richText;

/**
 *委托对象
 */
@property(nonatomic,weak) id<SGTextViewDelegate> sgTextViewDelegate;

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
