//
//  NSString+SNJson.m
//  SinoCommonProductTemplate
//
//  Created by xiongDa on 15/2/5.
//  Copyright (c) 2015年 sino. All rights reserved.
//

#import "NSString+SNJson.h"

@implementation NSString (SNJson)

-(id)JSONValue{
    return [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                           options:kNilOptions
                                             error:nil];
}

@end
