//
//  SGRequest.h
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/13.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface SGRequest : NSObject

/**
 *[AFNetWorking]的operationManager对象
 */
@property(nonatomic,strong) AFHTTPRequestOperationManager* operationManager;

/**
 *当前的请求operation队列
 */
@property(nonatomic,strong) NSOperationQueue* operationQueue;

/**
 *同时执行的请求最大数量
 */
@property(nonatomic,assign) int maxOperationsCount;

/**
 *功能: 创建SGRequest的对象方法
 */
+ (instancetype)request;

/**
 *功能：GET请求
 *参数：(1)请求的url: urlString
 *     (2)请求成功调用的Block: success
 *     (3)请求失败调用的Block: failure
 */
- (void)GET:(NSString *)URLString
    success:(void (^)(SGRequest *request, NSString* responseString))success
    failure:(void (^)(SGRequest *request, NSError *error))failure;

/**
 *功能：POST请求
 *参数：(1)请求的url: urlString
 *     (2)POST请求体参数:parameters
 *     (3)请求成功调用的Block: success
 *     (4)请求失败调用的Block: failure
 */
- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
     success:(void (^)(SGRequest *request, NSString* responseString))success
     failure:(void (^)(SGRequest *request, NSError *error))failure;

/**
 *取消当前请求队列的所有请求
 */
- (void)cancelAllOperations;

@end
