//
//  ThemeSize.h
//  ResetTableViewCell
//
//  Created by 张利广 on 14-9-1.
//  Copyright (c) 2014年 sdyk.cn. All rights reserved.
//

#ifndef ResetTableViewCell_ThemeSize_h
#define ResetTableViewCell_ThemeSize_h

/*
 *  Metro
 */
#define TILE_MARGIN                             8.0                         //Metro Tile 边距


#define kNavButtonRect                          CGRectMake(0, 0, 55, 44)    //左右侧导航栏按钮大小

/*
 * 字体
 */

#define kFontThinName                           @"STHeitiSC-Light"              //细字体
#define kTableBarFontSize                       [UIFont fontWithName:kFontThinName size:10.0]

#define kFontWithBigestSize                     [UIFont systemFontOfSize:24]
#define kFontWithBigSize                        [UIFont systemFontOfSize:18]
#define kFontWithDefaultSize                    [UIFont systemFontOfSize:16]
#define kFontWithSmallSize                      [UIFont systemFontOfSize:14]
#define kFontWithSmallestSize                   [UIFont systemFontOfSize:10]

#define kSizeLoadMoreCellHeight                 30.0

#define KContentLeftTitleFontOfSize             [UIFont systemFontOfSize:18.0f]     //标题文本的字体大小


#define kTableBarItemSize                       24
#define HUIIsIPAD()                     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//System version
#define HUISystemVersionIs(v)           ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] \
== NSOrderedSame)
#define HUISystemVersionAbove(v)        ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] \
== NSOrderedDescending)
#define HUISystemVersionAboveOrIs(v)    ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] \
!= NSOrderedAscending)
#define HUISystemVersionBelow(v)        ([[[UIDevice currentDevice] systemVersion] compare:(v) options:NSNumericSearch] \
== NSOrderedAscending)
#define HUISystemVersionBelowOrIs(v)    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] \
!= NSOrderedDescending)
#define kHUISystemVersion_4_3           @"4.3"
#define kHUISystemVersion_5_0           @"5.0"
#define kHUISystemVersion_5_1           @"5.1"
#define kHUISystemVersion_6_0           @"6.0"
#define kHUISystemVersion_6_1           @"6.1"
#define kHUISystemVersion_7_0           @"7.0"
#define kHUISystemVersion_7_1           @"7.1"
#define kHUISystemVersion_8_0           @"8.0"
#define kHUISystemVersion_8_1           @"8.1"

#endif


///这种参数定义的好处。。便于管理，便于查找。按模块划分容易处理；
///同时可以有效形成树形目录结构，便于管理；
