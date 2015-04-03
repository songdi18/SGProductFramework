//
//  SubViewController.m
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/16.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "SubViewController.h"
#import "BXAPI.h"
#import "NSDictionary+SNJson.h"
#import "SGUtil.h"
#import "UIImageView+WebCache.h"

@interface SubViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *responseTextView;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)noPGetAction:(id)sender {
    [self.mainRequest cancelAllOperations];
    [self.mainRequest GET:[BXAPI getDefColumn]
                     success:^(SGRequest *request, NSString *responseString) {
                         self.responseTextView.text=responseString;
                     }
                     failure:^(SGRequest *request, NSError *error) {
                         self.responseTextView.text=error.localizedDescription;
                         NSLog(@"%@",error.localizedDescription);
                     }];
    
}
- (IBAction)havePGetAction:(id)sender {
    [self.mainRequest cancelAllOperations];
    [self.mainRequest GET:[BXAPI getNewsList:@"1" city:@"1" pageNo:@"1"]
                     success:^(SGRequest *request, NSString *responseString) {
                         self.responseTextView.text=responseString;
                     }
                     failure:^(SGRequest *request, NSError *error) {
                         self.responseTextView.text=error.localizedDescription;
                     }];
    
}
- (IBAction)noMPost:(id)sender {
//    http://192.168.10.106:8080/hljn-api/api/v11/newsInfo/comment/{"userCity":"","userHeadAttr":"http%3A%2F%2F192.168.10.78%3A9300%2Fuser%2F6%2Fa57d85b9e2724fdb88714b70ba755e99%2F201501211739514904abcd.jpg","userId":6,"content":"Ff%20","moudleId":"1","cDate":"1426485211880","userName":"%E7%94%A8%E6%88%B7465684177","moudle":"4","platform":"hlj","title":"aaa"}
    [self.mainRequest cancelAllOperations];
    NSMutableDictionary* commentDic=[NSMutableDictionary dictionary];
    [commentDic setObject:@"1" forKey:@"moudleId"];
    [commentDic setObject:@"4" forKey:@"moudle"];
    [commentDic setObject:@"6" forKey:@"userId"];
    [commentDic setObject:[SGUtil encodeUrlString:@"kratos0316"] forKey:@"userName"];
    [commentDic setObject:[SGUtil encodeUrlString:@"aaa"] forKey:@"title"];
    [commentDic setObject:[SGUtil encodeUrlString:@"威武霸气有希望"] forKey:@"content"];
    [commentDic setObject:[SGUtil encodeUrlString:@"xxx.jpg"] forKey:@"userHeadAttr"];
    [commentDic setObject:[SGUtil timeIntervalSince1970] forKey:@"cDate"];
    [commentDic setObject:@"li" forKey:@"platform"];
    
    [self.mainRequest POST:[BXAPI postComment:commentDic]
                   parameters:nil
                      success:^(SGRequest *request, NSString *responseString) {
                          self.responseTextView.text=responseString;
                      }
                      failure:^(SGRequest *request, NSError *error) {
                          self.responseTextView.text=error.localizedDescription;
                      }];
    
    
    
}
- (IBAction)haveMPost:(id)sender {
    [self.mainRequest cancelAllOperations];
    [self.mainRequest POST:[BXAPI postReviewImage]
                   parameters:@{@"image":@"dasdasd",@"imageFileName":@"fileName"}
                      success:^(SGRequest *request, NSString *responseString) {
                          self.responseTextView.text=responseString;
                      }
                      failure:^(SGRequest *request, NSError *error) {
                          self.responseTextView.text=error.localizedDescription;
                      }];
}
- (IBAction)cancelAllRequestAction:(id)sender {
    [self.mainRequest cancelAllOperations];
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
