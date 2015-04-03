//
//  SGRequest.m
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/13.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "SGRequest.h"

@implementation SGRequest

+ (instancetype)request;{
    return [[self alloc] init];
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.operationManager=[AFHTTPRequestOperationManager manager];
    }
    return self;
}

-(void)setMaxOperationsCount:(int)maxOperationsCount{
    _maxOperationsCount=maxOperationsCount;
    self.operationQueue.maxConcurrentOperationCount=maxOperationsCount;
}

- (void)GET:(NSString *)URLString
    success:(void (^)(SGRequest *request, NSString* responseString))success
    failure:(void (^)(SGRequest *request, NSError *error))failure{
    NSLog(@"[SGRequest]: %@",URLString);
    self.operationQueue=self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self.operationManager GET:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSString* responseJson = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
             NSLog(@"[SGRequest]: %@",responseJson);
             success(self,responseJson);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"[SGRequest]: %@",error.localizedDescription);
             if (error.code!=-999) {
                 failure(self,error);
             }
             
         }];
    
}

- (void)POST:(NSString *)URLString
  parameters:(NSDictionary*)parameters
     success:(void (^)(SGRequest *request, NSString* responseString))success
     failure:(void (^)(SGRequest *request, NSError *error))failure{
    
    self.operationQueue=self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self.operationManager POST:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSString* responseJson = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
              NSLog(@"[SGRequest]: %@",responseJson);
              success(self,responseJson);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error){
              NSLog(@"[SGRequest]: %@",error.localizedDescription);
              if (error.code!=-999) {
                  failure(self,error);
              }
          }];
    
}
- (void)cancelAllOperations{
    [self.operationQueue cancelAllOperations];
}

@end
