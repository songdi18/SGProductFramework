//
//  BXAPI.m
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/16.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "BXAPI.h"
#import "NSDictionary+SNJson.h"

@implementation BXAPI

+(NSString*)getDefColumn{
    return [NSString stringWithFormat:@"%@%@%@",SERVER_URL,HLJ_URL,GET_DEF_COLUMN];
}

+(NSString*)getNewsList:(NSString*)colId city:(NSString*)code  pageNo:(NSString*)pageNo{
    return [NSString stringWithFormat:@"%@%@%@%@/%@/%@",SERVER_URL,HLJ_URL,GET_NEWS_LIST,colId,code,pageNo];
}

+(NSString*)getNewsInfo:(NSString*)objId userId:(NSString*)userId indexType:(NSString *)indexType{
    return [NSString stringWithFormat:@"%@%@%@%@/%@",SERVER_URL,HLJ_URL,GET_NEWS_DETAIL_NEW,objId,userId];
}

+(NSString*)postComment:(NSDictionary*)jsonDic{
    NSString* jsonData=[jsonDic JSONValue];
    return [NSString stringWithFormat:@"%@%@%@%@",SERVER_URL,HLJ_URL,POST_COMMENT,jsonData];
}

+(NSString*)postReviewImage{
    return [NSString stringWithFormat:@"%@%@%@",SERVER_URL,HLJ_URL,POST_REVIEW_IMAGE_2];
}

@end
