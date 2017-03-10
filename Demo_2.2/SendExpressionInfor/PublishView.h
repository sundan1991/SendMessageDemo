//
//  PublishView.h
//  fmapp
//
//  Created by 李 喻辉 on 14-5-22.
//  Copyright (c) 2014年 yk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpressView.h"
#import "HYBTextView.h"

extern UIView* GetKeyBoardView();

@protocol PublishViewDelegate <NSObject>
- (void)didPublishViewLayoutChanged:(CGFloat)bottom withHeight:(CGFloat)height;

///测试使用的发送协议
- (void)sendExpressionInfor:(NSString *)contentString;
@end

@interface PublishView : UIView
@property (nonatomic,weak)HYBTextView        *commentView;
@property (nonatomic,weak)ExpressView       *expressView;
@property (nonatomic,copy)NSString          *replyQuestionId;   //回复问题ID
@property (nonatomic,assign)NSInteger       is_publicInfor;
@property (nonatomic,copy)NSString          *replyPostId;
@property (nonatomic,copy)NSString          *replyPostNameStr;

@property (weak, nonatomic) id<PublishViewDelegate> delegate;

- (void)resetButton;

@end
