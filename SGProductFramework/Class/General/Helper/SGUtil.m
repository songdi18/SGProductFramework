//
//  SGUtil.m
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/16.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "SGUtil.h"

@implementation SGUtil

+(NSString*)encodeUrlString:(NSString*)urlString{
    NSString *result = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(nil,
                                                                          (CFStringRef)urlString, nil,
                                                                          (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    
    return result;
}

+(NSString*)timeIntervalSince1970{
    NSDate* nowDate=[[NSDate alloc]init];
    return [NSString stringWithFormat:@"%.0f",[nowDate timeIntervalSince1970]*1000];
}

@end
