//
//  ExpressView.h
//  fmapp
//
//  Created by 张利广 on 15/1/28.
//  Copyright (c) 2015年 sdyk.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExpressViewDelegate <NSObject>
- (void)didExpressViewSelected:(NSInteger)tag isDelete:(BOOL)bDelete;
@end

@interface ExpressView : UIView

@property (weak, nonatomic) id<ExpressViewDelegate> delegate;

@end
