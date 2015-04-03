//
//  SGTextView.m
//  UITextKitDemo
//
//  Created by 宋迪 on 15/3/20.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "SGTextView.h"
#import "SGTextAttachment.h"
@interface SGTextView ()<UITextViewDelegate>

@property(nonatomic,strong) NSDictionary* emojiNameDic;
@property(nonatomic,strong) NSMutableAttributedString* attributedRichText;
@property(nonatomic,strong) NSMutableArray* faceImageArray;

@end

@implementation SGTextView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self loadLocalEmojiFilePlist];
    }
    return self;
}
-(instancetype)init{
    self=[super init];
    if (self) {
        [self loadLocalEmojiFilePlist];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self loadLocalEmojiFilePlist];
}

-(void)loadLocalEmojiFilePlist{
    NSString *emojiFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:EmojiFileName];
    self.emojiNameDic = [[NSDictionary alloc] initWithContentsOfFile:emojiFilePath];
    self.delegate=self;
    self.editable=NO;
}

-(void)setRichText:(NSString *)richText{
    _richText=richText;
    self.attributedRichText=[[NSMutableAttributedString alloc]initWithString:self.richText attributes:nil];
    self.attributedText=[self stringConvertEmojiText:self.attributedRichText];
    
    CGSize textSize=[self.richText boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:self.font}
                                                context:nil].size;
    CGRect changeFrame = self.frame;
    changeFrame.size=textSize;
    self.frame=changeFrame;
    [self sizeToFit];
}

#pragma mark - 富文本识别转化
-(NSMutableAttributedString*)stringConvertEmojiText:(NSMutableAttributedString *) attributeRichText{
    NSString* richTextString=attributeRichText.string;
    self.faceImageArray=[NSMutableArray array];
    NSRegularExpression * emojiRegular = [NSRegularExpression regularExpressionWithPattern:EMOJI_PATTERN options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *emojiResultArray = [emojiRegular matchesInString:richTextString options:0 range:NSMakeRange(0, richTextString.length)];
    
    NSRegularExpression * urlRegular = [NSRegularExpression regularExpressionWithPattern:URL_PATTERN options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *urlResultArray = [urlRegular matchesInString:richTextString options:0 range:NSMakeRange(0, richTextString.length)];
    
    
    for(NSTextCheckingResult *match in emojiResultArray) {
        
        NSRange range = [match range];
        NSString *subStr = [richTextString substringWithRange:range];
        if ([UIImage imageNamed:self.emojiNameDic[subStr]]) {
            SGTextAttachment *textAttachment = [[SGTextAttachment alloc] init];
            textAttachment.image = [UIImage imageNamed:self.emojiNameDic[subStr]];
            NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
            
            NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
            [imageDic setObject:imageStr forKey:@"image"];
            [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
            
            
            [self.faceImageArray addObject:imageDic];
        }
    }
    
    for (NSTextCheckingResult *match in urlResultArray) {
        NSRange range = [match range];
        [attributeRichText addAttribute:NSLinkAttributeName value:[NSURL URLWithString:[richTextString substringWithRange:range]] range:range];
        
    }
    
    for (long i = self.faceImageArray.count -1; i >= 0; i--)
    {
        NSRange range;
        [self.faceImageArray[i][@"range"] getValue:&range];
        [attributeRichText replaceCharactersInRange:range withAttributedString:self.faceImageArray[i][@"image"]];
        
    }
    
    return attributeRichText;
}

#pragma mark - 设置颜色
-(void)changeColor:(UIColor*)color withContent:(NSString*)content{
    NSString* selfString = self.attributedText.string;
    if ([selfString rangeOfString:content].length>0) {
        [self.attributedRichText addAttributes:@{NSForegroundColorAttributeName:color,NSTextEffectAttributeName:NSTextEffectLetterpressStyle} range:[selfString rangeOfString:content]];
    }
    self.attributedText=self.attributedRichText;
}
-(void)changeColor:(UIColor*)color withRange:(NSRange)range{
    if (self.attributedText.length>=range.location+range.length) {
        [self.attributedRichText addAttributes:@{NSForegroundColorAttributeName:color} range:range];
        self.attributedText=self.attributedRichText;
    }
}


#pragma mark - UITextViewDelegate
-(BOOL)canBecomeFirstResponder{
    return NO;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    [self.sgTextViewDelegate SGTextView:self didClickedUrlAction:[URL absoluteString] urlRange:characterRange];
    
    
    return NO;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange{
    
    return NO;
}

@end
