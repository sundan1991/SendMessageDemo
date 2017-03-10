//
//  DataSource.h
//  Demo_2.2
//
//  Created by lifg on 15-2-2.
//  Copyright (c) 2015年 sundan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataSource : NSObject
/*!
 *@brief 带属性的问题内容
 **/
@property (nonatomic,strong)    NSAttributedString      *attributedContentInfor;

/*!
 *@brief 带属性的问题内容的高度
 **/
@property (nonatomic,assign)    CGFloat                 contentStringHeight;

/** 初始化数据内容
 
 *@See 用于解析当前数据请求下的JSON数据或其他格式的数据
 **/
+(id)initWithExpresionDataSourceItemWithUnserializedWithString:(NSString *)contentString;

@end
