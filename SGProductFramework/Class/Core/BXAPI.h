//
//  BXAPI.h
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/16.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SERVER_URL @"http://192.168.10.78:8683/"
#define HLJ_URL   @"api/v11/newsInfo/"

//无参数GET
#define GET_DEF_COLUMN @"getDefNewsCol"
//有参数GET
#define GET_NEWS_LIST @"getIndexByOptNew/"
#define GET_NEWS_DETAIL_NEW @"getNewsInfoDetailNew/"
//无请求体POST
#define POST_COMMENT @"comment/"
//有请求体POST
#define POST_REVIEW_IMAGE_2 @"review/uploadReviewImage"

@interface BXAPI : NSObject

+(NSString*)getDefColumn;
+(NSString*)getNewsList:(NSString*)colId city:(NSString*)code  pageNo:(NSString*)pageNo;
+(NSString*)getNewsInfo:(NSString*)objId userId:(NSString*)userId indexType:(NSString*)indexType;
+(NSString*)postComment:(NSDictionary*)jsonDic;
+(NSString*)postReviewImage;


@end
