//
//  PublishView.m
//  fmapp
//
//  Created by 李 喻辉 on 14-5-22.
//  Copyright (c) 2014年 yk. All rights reserved.
//

#import "PublishView.h"
#import <UIKit/UIKit.h>
//#import "FMSettings.h"
#import "FontAwesome.h"
#import "NSString+FontAwesome.h"
#import "UIScreen+HUIAddtion.h"
#import "UIDevice+HUIAddtion.h"
#import "UIButton+Bootstrap.h"

#define kPublishViewMargin              4
#define kPublishViewButtonSize          35


#define KPublishExpressHeight           216         //表情键盘高度
#define kCancelButtonItemTag            100
#define kPublishButtonItemTag           101
#define kKeyboardButtonTag              102
#define kExpressButtonTag               103

UIView* GetKeyBoardView()
{
    NSArray *windows = [[UIApplication sharedApplication] windows];
    UIView *keyboardView = nil;
    for(UIView *window in windows){
        NSArray *viewsArray = [window subviews];
        
        for(UIView *view in viewsArray){
            if([[NSString stringWithUTF8String:object_getClassName(view)]
                isEqualToString:HUISystemVersionAboveOrIs(kHUISystemVersion_8_0) ?
                @"UIInputSetContainerView":@"UIPeripheralHostView"])
            {
                //是键盘视图
                keyboardView = view;
                break;
            }
        }
    }
    return keyboardView;
}

@interface PublishView () <ExpressViewDelegate,UITextViewDelegate>

@property (nonatomic,assign)NSInteger        lastRow;
@property (nonatomic , strong)  NSMutableDictionary *contentExpressionDictionary;
/*!
 *@breif 互动_表情数据数组
 */
@property (nonatomic, strong)   NSArray        *expressionNameArray;

/*!
 *@breif 互动_表情数据数组
 */
@property (nonatomic, strong)   NSArray        *expressionNameCodeArray;

@end

@implementation PublishView
#define kFontWithBigestSize                     [UIFont systemFontOfSize:24]
#define kFontWithBigSize                        [UIFont systemFontOfSize:18]
#define kFontWithDefaultSize                    [UIFont systemFontOfSize:16]
#define kFontWithSmallSize                      [UIFont systemFontOfSize:14]
#define kFontWithSmallestSize                   [UIFont systemFontOfSize:10]
#define KContentTextColor                   [UIColor colorWithRed:65/255.0f green:65/255.0f blue:65/255.0f alpha:1.0f]
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        //初始化表情数据
        self.expressionNameArray = @[
                                     @"微笑",@"撇嘴", @"色",@"发呆",@"得意",@"流泪",
                                     @"害羞",@"闭嘴",@"睡", @"大哭",@"发怒",@"调皮",
                                     @"龇牙", @"惊讶", @"快哭了",@"抓狂",@"吐",
                                     @"偷笑",@"愉快",@"白眼",@"傲慢",@"饥饿",@"困",
                                     @"惊恐",@"流汗",@"憨笑",@"大兵",@"奋斗",@"咒骂",
                                     @"疑问",@"嘘",@"晕",@"疯了",@"衰",@"骷髅",
                                     @"敲打",@"再见", @"擦汗",@"抠鼻",@"鼓掌",
                                     @"糗大了",@"坏笑",@"左哼哼",@"右哼哼",@"哈欠",
                                     @"鄙视",@"委屈",@"奸笑",@"亲亲",@"可怜",
                                     @"菜刀",@"西瓜",@"啤酒",@"足球",@"咖啡",
                                     @"饭", @"猪头",@"玫瑰",@"凋谢",@"嘴唇",
                                     @"爱心",@"心碎",@"蛋糕",@"闪电", @"炸弹",
                                     @"便便",@"月亮",@"太阳",@"抱抱",@"强",
                                     @"弱",@"握手", @"胜利",@"抱拳",@"勾引",
                                     @"拳头",@"差劲",@"爱你",@"沙发",@"药", @"奶瓶",
                                     @"OK",@"NO",@"礼物",@"喝彩",@"彩球",@"打伞",
                                     @"鞭炮",@"灯笼",@"祈祷",@"双喜",@"帅",@"熊猫",
                                     @"青蛙",@"香蕉",@"钻戒",@"灯泡",@"闹钟",@"纸巾",
                                     @"钞票",@"K歌",@"手枪",@"飞机",@"开车"];
        self.expressionNameCodeArray = @[@"f_001",@"f_002",@"f_003",@"f_004",@"f_005",
                                         @"f_006",@"f_007",@"f_008",@"f_009",@"f_010",
                                         @"f_011",@"f_012",@"f_013",@"f_014",@"f_015",
                                         @"f_016",@"f_017",@"f_018",@"f_019",@"f_020",
                                         @"f_021",@"f_022",@"f_023",@"f_024",@"f_025",
                                         @"f_026",@"f_027",@"f_028",@"f_029",@"f_030",
                                         @"f_031",@"f_032",@"f_033",@"f_034",@"f_035",
                                         @"f_036",@"f_037",@"f_038",@"f_039",@"f_040",
                                         @"f_041",@"f_042",@"f_043",@"f_044",@"f_045",
                                         @"f_046",@"f_047",@"f_048",@"f_049",@"f_050",
                                         @"f_051",@"f_052",@"f_053",@"f_054",@"f_055",
                                         @"f_056",@"f_057",@"f_058",@"f_059",@"f_060",
                                         @"f_061",@"f_062",@"f_063",@"f_064",@"f_065",
                                         @"f_066",@"f_067",@"f_068",@"f_069",@"f_070",
                                         @"f_071",@"f_072",@"f_073",@"f_074",@"f_075",
                                         @"f_076",@"f_077",@"f_078",@"f_079",@"f_080",
                                         @"f_081",@"f_082",@"f_083",@"f_084",@"f_085",
                                         @"f_086",@"f_087",@"f_088",@"f_089",@"f_090",
                                         @"f_091",@"f_092",@"f_093",@"f_094",@"f_095",
                                         @"f_096",@"f_097",@"f_098",@"f_099",@"f_100",
                                         @"f_101",@"f_102",@"f_103",@"f_104",];

        self.lastRow = 1;
        ///默认背景色
        self.backgroundColor = [UIColor colorWithRed:1.0f
                                               green:1.0f
                                                blue:1.0f
                                               alpha:1.0];
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOpacity = 0.4f;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowRadius = 2.0f;
        
        //表情或键盘按钮
        UIButton *keyboardOrExpressionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        keyboardOrExpressionButton.tag = kExpressButtonTag;
        keyboardOrExpressionButton.titleLabel.font = [UIFont systemFontOfSize:30.0];
        [keyboardOrExpressionButton simpleButtonWithImageColor:[UIColor colorWithRed:45.0f/255.0f
                                                                               green:188.0f/255.0f
                                                                                blue:150.0f/255.0f
                                                                               alpha:1.0]];
        [keyboardOrExpressionButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [keyboardOrExpressionButton setFrame:CGRectMake(kPublishViewMargin,
                                                        8,
                                                        kPublishViewButtonSize,
                                                        kPublishViewButtonSize)];
        [keyboardOrExpressionButton addAwesomeIcon:FMIconExpression beforeTitle:YES];
        keyboardOrExpressionButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:keyboardOrExpressionButton];
        
        //文本框
        HYBTextView *commentTextView = [[HYBTextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(keyboardOrExpressionButton.frame) + kPublishViewMargin,
                                                                                   kPublishViewMargin,
                                                                                   frame.size.width - kPublishViewButtonSize * 2 - 4 * kPublishViewMargin ,
                                                                                   frame.size.height - 2 * kPublishViewMargin)];
        
        
        /*
         
         
         **/
        commentTextView.font = kFontWithDefaultSize;
        [commentTextView setDelegate:self];
        commentTextView.layer.borderWidth = 0.8;
        commentTextView.layer.borderColor = [[UIColor colorWithRed:45.0f/255.0f
                                                             green:188.0f/255.0f
                                                              blue:150.0f/255.0f
                                                             alpha:1.0] CGColor];
        commentTextView.backgroundColor = [UIColor clearColor];
        commentTextView.textColor = KContentTextColor;
        commentTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        commentTextView.returnKeyType = UIReturnKeySend;
        self.commentView = commentTextView;
        [self addSubview:commentTextView];
        
        //发布按钮
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        publishButton.tag = kPublishButtonItemTag;
        publishButton.titleLabel.font = [UIFont systemFontOfSize:24.0];
        [publishButton simpleButtonWithImageColor:[UIColor colorWithRed:45.0f/255.0f
                                                                  green:188.0f/255.0f
                                                                   blue:150.0f/255.0f
                                                                  alpha:1.0]];
        [publishButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [publishButton setFrame:CGRectMake(frame.size.width - kPublishViewButtonSize - kPublishViewMargin,
                                           8,
                                           kPublishViewButtonSize,
                                           kPublishViewButtonSize)];
        publishButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
//        [publishButton setTitle:@"send" forState:(UIControlStateNormal)];
//        [publishButton addAwesomeIcon:FMIconRadio beforeTitle:YES];
        [self addSubview:publishButton];
        
        self.contentExpressionDictionary = [[NSMutableDictionary alloc]init];
        
    }
    return self;
}




#pragma mark -按钮点击时
- (void) buttonClicked:(id) sender
{
    UIButton *button = (UIButton *)sender;
    
    UIView* superView = [self superview];
    CGRect rc = superView.bounds;
    
    if (button.tag == kPublishButtonItemTag) {//发布
//        if ([[CurrentUserInformation sharedCurrentUserInfo] userLoginState] == 0) {//未登录
//            
//            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"请先登录" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//            [alertView show];
//            //内容文本框
//            [self.commentView resignFirstResponder];
//            
//        }else{
            [self publishComment];//发布回复
//        }
    }else if(button.tag == kCancelButtonItemTag){//取消
        [self.commentView resignFirstResponder];
    }else if(button.tag == kExpressButtonTag || button.tag == kKeyboardButtonTag){//表情或键盘按钮
        
        if (![self.commentView isFirstResponder]) {
            [self.commentView becomeFirstResponder];
            return;
        }
        
        //获取键盘视图
        UIView *keyboardView = GetKeyBoardView();
        
        CGFloat keyboardHeight = 0;//键盘高度
        NSInteger buttonImageName;
        if(button.tag == kExpressButtonTag){//显示表情
            
            //创建表情键盘
            if (self.expressView == nil) {
                ExpressView* expressView = [[ExpressView alloc] initWithFrame:CGRectMake(0,
                                                                                         rc.size.height,
                                                                                         rc.size.width,
                                                                                         KPublishExpressHeight)];
                expressView.delegate = self;
                [superView addSubview:expressView];
                self.expressView = expressView;
            }
            [superView bringSubviewToFront:self.expressView];
            [UIView beginAnimations:@"HiddenKeyboard" context:nil];
            [UIView setAnimationDuration:0.3f];
            
            //            //隐藏键盘
            CGRect keyboardFrame = keyboardView.frame;
            keyboardFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
            keyboardView.frame = keyboardFrame;
            
            //            [self.commentView resignFirstResponder];
            
            
            //显示表情
            self.expressView.frame = CGRectMake(0,
                                                rc.size.height - KPublishExpressHeight,
                                                rc.size.width,
                                                KPublishExpressHeight);
            [UIView commitAnimations];
            
            keyboardHeight = KPublishExpressHeight;
            button.tag = kKeyboardButtonTag;
            buttonImageName = FMIconKeyboard;
            
            if ([self.delegate respondsToSelector:@selector(didPublishViewLayoutChanged:withHeight:)]) {
                [self.delegate didPublishViewLayoutChanged:keyboardHeight withHeight:self.frame.size.height];
            }
            
        }
        
        else{//显示键盘
            
            
            [UIView beginAnimations:@"ShowKeyboard" context:nil];
            [UIView setAnimationDuration:0.3f];
            //隐藏表情
            if(self.expressView){
                self.expressView.frame = CGRectMake(0, rc.size.height, rc.size.width, KPublishExpressHeight);
            }
            
            //显示键盘
            if (keyboardView) {
                CGRect keyboardFrame = keyboardView.frame;
                keyboardFrame.origin.y = [UIScreen mainScreen].bounds.size.height - keyboardView.frame.size.height;
                keyboardView.frame = keyboardFrame;
                keyboardHeight = keyboardFrame.size.height;
                if (HUISystemVersionAboveOrIs(kHUISystemVersion_8_0)) {
                    keyboardHeight = keyboardHeight > 400? 252: keyboardHeight;
                }
            }
            
            [UIView commitAnimations];
            
            if (keyboardView) {
                if ([self.delegate respondsToSelector:@selector(didPublishViewLayoutChanged:withHeight:)]) {
                    [self.delegate didPublishViewLayoutChanged:keyboardHeight withHeight:self.frame.size.height];
                }
            }
            button.tag = kExpressButtonTag;
            buttonImageName = FMIconExpression;
            
        }
        
        [button setAwesomeIcon:buttonImageName];
    }
    
//    FMShareSetting.e
}
#pragma mark - ExpressViewDelegate
- (void)didExpressViewSelected:(NSInteger)tag isDelete:(BOOL)bDelete
{
    if (!bDelete) {//不是删除按钮
        
        NSString *expressionName = [self.expressionNameArray objectAtIndex:tag-1];
        NSString *contentText = [[NSString alloc] initWithFormat:@"%@[%@]",self.commentView.text,
                                 expressionName];
        self.commentView.text = contentText;
        
            if (![self.contentExpressionDictionary.allKeys containsObject:expressionName]) {
                
                [self.contentExpressionDictionary setObject:[self.expressionNameCodeArray objectAtIndex:tag-1] forKey:expressionName];
            }
        
        [self textView:self.commentView shouldChangeTextInRange:NSMakeRange(0,0) replacementText:@""];
        
    }else{//是删除按钮
        if (self.commentView.text.length > 0) {
            if ([[self.commentView.text substringFromIndex:self.commentView.text.length - 1] isEqualToString:@"]"]) {
                //正则表达式
                NSRegularExpression *textRegex = [NSRegularExpression regularExpressionWithPattern:@"\\[\\w*\\]" options:NSRegularExpressionCaseInsensitive error:nil];
                ////符合正则表达式的结果
                NSArray *textArrayOfAllMatches = [textRegex matchesInString:self.commentView.text options:0 range:NSMakeRange(0, [self.commentView.text length])];
                
                if (textArrayOfAllMatches.count > 0) {
                    NSTextCheckingResult *checkingResult = textArrayOfAllMatches.lastObject;
                    self.commentView.text = [self.commentView.text substringWithRange:NSMakeRange(0,checkingResult.range.location)];
                }
            }else{
                self.commentView.text = [self.commentView.text substringWithRange:NSMakeRange(0, self.commentView.text.length - 1)];
            }
        }
    }
}
- (void) resetComment
{
    self.commentView.text = nil;
    self.lastRow = 1;
    if ([self.delegate respondsToSelector:@selector(didPublishViewLayoutChanged:withHeight:)]) {
        [self.delegate didPublishViewLayoutChanged:self.superview.bounds.size.height - CGRectGetMaxY(self.frame) withHeight:45.0];
    }
}
- (void) resetButton
{
    //隐藏表情
    if(self.expressView){
        
        UIView *keyboardView = GetKeyBoardView();
        CGFloat keyboardHeight = 0;//键盘高度
        
        if (keyboardView) {
            CGRect keyboardFrame = keyboardView.frame;
            keyboardFrame.origin.y = [UIScreen mainScreen].bounds.size.height - keyboardView.frame.size.height;
            keyboardView.frame = keyboardFrame;
            keyboardHeight = keyboardFrame.size.height;
            if (HUISystemVersionAboveOrIs(kHUISystemVersion_8_0)) {
                keyboardHeight = keyboardHeight > 400? 252: keyboardHeight;
            }
        }
        
        [UIView beginAnimations:@"HideExpressBorad" context:nil];
        [UIView setAnimationDuration:0.3f];
        UIView* superView = [self superview];
        CGRect rc = superView.bounds;
        self.expressView.frame = CGRectMake(0, rc.size.height, rc.size.width, KPublishExpressHeight);
        [UIView commitAnimations];
    }
    
    UIButton *keyboardOrExpressionButton  = (UIButton* )[self viewWithTag:kKeyboardButtonTag];
    if (keyboardOrExpressionButton) {
        keyboardOrExpressionButton.tag = kExpressButtonTag;
        [keyboardOrExpressionButton setAwesomeIcon:FMIconExpression];
    }
}
#pragma mark -发布评论
- (void) publishComment
{

    
    UITextView *commentTextView = self.commentView;
    NSString *commentContentStr = [NSString stringWithFormat:@"%@",commentTextView.text];
    
    for(NSString *name in self.contentExpressionDictionary.allKeys){
        NSString *expreCode = [NSString stringWithFormat:@"%@",[self.contentExpressionDictionary objectForKey:name]];
        commentContentStr = [commentContentStr stringByReplacingOccurrencesOfString:name withString:expreCode];
    }
    [self.contentExpressionDictionary removeAllObjects];
    /////////////////////
    //与服务器进行发送设置
    ////////////////////
    
    
    [self resetComment];
    [self.commentView resignFirstResponder];
    
    
    
    
    
    /////测试代码开始begin;
    
    
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(sendExpressionInfor:)]) {
            [self.delegate sendExpressionInfor:commentContentStr];
        }
    }
    
    
    /////测试代码结束end;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [self publishComment];
        return NO;
    }
    int rows = 1;
    if ([self.commentView.text length] >0) {
        CGSize size = [self.commentView.text sizeWithFont:[self.commentView font]];
        rows  = self.commentView.contentSize.height/size.height;
    }
    if (rows != self.lastRow) {
        CGFloat h;
        if (rows == 1) {
            h = 45.0;
        }else if (rows == 2) {
            h = 60.0;
        }else {
            h = 70.0;
        }
        if ([self.delegate respondsToSelector:@selector(didPublishViewLayoutChanged:withHeight:)]) {
            [self.delegate didPublishViewLayoutChanged:self.superview.bounds.size.height - CGRectGetMaxY(self.frame) withHeight:h];
        }
    }
    self.lastRow = rows;
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [self resetButton];
    [self resetComment];
    return YES;
}


@end
