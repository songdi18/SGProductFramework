//
//  SGUtil.h
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/16.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGUtil : NSObject
//网络请求时字符串编码
+(NSString*)encodeUrlString:(NSString*)urlString;

//获取当前时间时间戳
+(NSString*)timeIntervalSince1970;


@end
