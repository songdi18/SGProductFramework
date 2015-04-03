//
//  NSDictionary+SNJson.m
//  SinoCommonProductTemplate
//
//  Created by xiongDa on 15/2/5.
//  Copyright (c) 2015年 sino. All rights reserved.
//

#import "NSDictionary+SNJson.h"

@implementation NSDictionary (SNJson)

-(NSString *)JSONValue{
    return [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:self
                                                                         options:kNilOptions
                                                                           error:nil]
                                encoding:NSUTF8StringEncoding];
    
    
}

@end
