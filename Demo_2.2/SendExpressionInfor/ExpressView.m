//
//  ExpressView.m
//  fmapp
//
//  Created by 张利广 on 15/1/28.
//  Copyright (c) 2015年 sdyk.cn. All rights reserved.
//

#import "ExpressView.h"

#define kExpressionScrollViewTag        1008        //表情scrollview

@interface ExpressView()<UIScrollViewDelegate>
@property (nonatomic,weak) UIScrollView             *expressionScrollView;      //表情翻页视图
@property (nonatomic,weak) UIPageControl            *expressionPageControl;     //表情翻页控件
@end


@implementation ExpressView
#define KProjectScreenWidth          [UIScreen mainScreen].bounds.size.width
#define KProjectScreenHeight         [UIScreen mainScreen].bounds.size.height
- (id)initWithFrame:(CGRect)frame
{
    
//    CGFloat width=(CGFloat)KProjectScreenWidth/320;
//    CGFloat height=(CGFloat)KProjectScreenHeight/568;

    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //表情滚动视图
        UIScrollView *expressionScrollView = [[UIScrollView alloc] init];
        expressionScrollView.tag = kExpressionScrollViewTag;
        expressionScrollView.pagingEnabled = YES;
        expressionScrollView.delegate = self;
        expressionScrollView.showsHorizontalScrollIndicator = NO;
        expressionScrollView.showsVerticalScrollIndicator = NO;
        
        expressionScrollView.backgroundColor = [UIColor colorWithRed:219/255.0f
                                                               green:223/255.0f
                                                                blue:226/255.0f
                                                               alpha:1];
        
        
        
        //23距左 13
        //22距上 20内部
        
        
        //距左12 12
        //居上18 内部16 居下22
        
        //32 * 32
        
       CGFloat kWidth=(KProjectScreenWidth-32*7)/8;
        
        
        //第一页
        for (int i = 0; i < 4; i++) {
            UIView *pageView = [[UIView alloc] initWithFrame:CGRectMake(i * frame.size.width,
                                                                        0,
                                                                        frame.size.width,
                                                                        frame.size.height)];
            
            for (int j = i * 27; j < i * 27 + 27; j++) {
                @autoreleasepool {
                    UIButton *expressionButton = [UIButton buttonWithType:UIButtonTypeCustom];
                    
                    NSInteger row = (j - i * 27) / 7;//行
                    NSInteger column = (j - i * 27)  % 7;//列
                    
                    //表情按钮
                    NSString *imageName = [NSString stringWithFormat:@"f_%03d.png",j + 1];
                    [expressionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
                    expressionButton.titleLabel.text = [NSString stringWithFormat:@"%d",j + 1];
                    [expressionButton addTarget:self action:@selector(expressionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                    [expressionButton setFrame:CGRectMake(kWidth + 32 * column + kWidth * column, 18 + row * 32 + 16 * row , 32, 32)];
                    [pageView addSubview:expressionButton];
                }
            }
            
            //删除按钮
            UIButton *backSpaceExpressionButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [backSpaceExpressionButton setImage:[UIImage imageNamed:@"Backspace.png"] forState:UIControlStateNormal];
            backSpaceExpressionButton.titleLabel.text = @"删除";
            [backSpaceExpressionButton addTarget:self action:@selector(expressionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [backSpaceExpressionButton setFrame:CGRectMake(kWidth + 32 * 6 + kWidth * 6, 18 + 3 * 32 + 16 * 3 , 32, 32)];
            [pageView addSubview:backSpaceExpressionButton];
            
            [expressionScrollView addSubview:pageView];
        }
        
        expressionScrollView.contentSize = CGSizeMake(frame.size.width * 4, frame.size.height);
        expressionScrollView.frame = CGRectMake(0, 0 , frame.size.width, frame.size.height);
        expressionScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        [self addSubview:expressionScrollView];
        self.expressionScrollView = expressionScrollView;
        
        //页码显示
        UIPageControl *expressionPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(110,
                                                                                               frame.size.height - 10,
                                                                                               100,
                                                                                               10)];
        expressionPageControl.numberOfPages = 4;
        expressionPageControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin;
        [expressionPageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:expressionPageControl];
        self.expressionPageControl = expressionPageControl;
    }
    return self;
}

#pragma mark -表情键盘点击时
- (void) expressionButtonClicked:(id) sender
{
    
    UIButton *expressionButton = (UIButton *)sender;
    if (![expressionButton.titleLabel.text isEqualToString:@"删除"]) {//不是删除按钮
        NSInteger buttonTag = [expressionButton.titleLabel.text intValue];
        if (self.delegate) {
            [self.delegate didExpressViewSelected:buttonTag isDelete:NO];
        }

    }else{//是删除按钮
        [self.delegate didExpressViewSelected:0 isDelete:YES];
    }
}

#pragma mark -UIScrollViewDelegate
- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == kExpressionScrollViewTag) {
        NSInteger pageIndex =  scrollView.contentOffset.x/320;
        self.expressionPageControl.currentPage = pageIndex;
    }
    
}
#pragma mark -ExpressPageControl
- (void)changePage:(id)sender {
    int page = self.expressionPageControl.currentPage;                          //获取当前pagecontroll的值
    [self.expressionScrollView setContentOffset:CGPointMake(320 * page, 0)];    //根据pagecontroll的值来改变scrollview的滚动位置，以此切换到指定的页面
}
@end
