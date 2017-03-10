//
//  AttributedStringHelper.h
//  CoreTextDemo
//
//  Created by MaYiming on 13-11-18.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AttributedStringHelper : NSObject

/**初始化属性内容及需要显示的内容颜色
 
 *@para str 内容
 *@para textColor 内容颜色
 **/
- (NSAttributedString *) getAttributedStringWithNSString:(NSString *) str textColor:(UIColor *)textColor;


/** 显示内容的固定高度
 
 *@para inWidth 需要的宽度限制
 *@See 设置高度需要在特定宽度内设置
 *@waring inWidth 不可为空
 **/
- (CGFloat) heightForString:(NSString *) string withWidth:(CGFloat)inWidth;

/** 是否重新设置字体大小
 
 *@para stringFont 字号大小
 *@para setFontBool 是否设置字号，YES即设置为stringFont字号，NO，表示使用默认字号
 *@See 默认为18号大小
 *@waring 若需要重新设置字号大小，则setFontBool = YES；
 **/
-(void)initStringSystemFontOfSize:(CGFloat )stringFont withSetupFont:(BOOL)setFontBool;

@end
