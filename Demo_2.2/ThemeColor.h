//
//  ThemeColor.h
//  ResetTableViewCell
//
//  Created by 张利广 on 14-9-1.
//  Copyright (c) 2014年 sdyk.cn. All rights reserved.
//

#ifndef ResetTableViewCell_ThemeColor_h
#define ResetTableViewCell_ThemeColor_h



#define HUIRGBColor(r, g, b, a)      [UIColor colorWithRed:(r)/255.00 green:(g)/255.00 blue:(b)/255.00 alpha:(a)]

//文字颜色
#define kColorTextColorClay                 [UIColor colorWithRed:127.0/255.0 green:125.0/255.0 blue:127.0/255.0 alpha:1.0]
#define kColorTextColorDarkClay             [UIColor colorWithRed:74.00/255.00 green:54.00/255.00 blue:33.00/255.00 alpha:1.0]

//标题文本颜色
#define KTitleTextColor                     [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0]

//内容文本颜色
#define KContentTextColor                   [UIColor colorWithRed:65/255.0f green:65/255.0f blue:65/255.0f alpha:1.0f]

//互动文本颜色
#define KMessageTextColor                   KContentTextColor
//[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:1.0f]

//禁止文本颜色
#define KDisableTextColor                   [UIColor colorWithRed:172/255.0f green:172/255.0f blue:172/255.0f alpha:1.0f]

//边框颜色设置
#define KBorderColorSetup                   [UIColor colorWithRed:226/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]

//分割线颜色设置
#define KSepLineColorSetup                  [UIColor colorWithRed:226/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]

//按键高亮的显示颜色
#define KButtonBackgroundImageColor         [UIColor colorWithRed:240/255.0f green:239/255.0f blue:240/255.0f alpha:1]

//项目背景色
#define KProjectBackGroundViewColor         [UIColor colorWithRed:231/255.0f green:233/255.0f blue:242/255.0f alpha:1]

///TableViewCell 选中的颜色
#define KTableViewCellSelectedColor         [UIColor colorWithRed:221/255.0f green:223/255.0f blue:232/255.0f alpha:1]

///导航栏右侧头部按键颜色——白色
#define KRightBarButtonItemColor            [UIColor whiteColor]

///TableViewCell的背景颜色
#define KTableViewCellBackGroundColor       [UIColor whiteColor]

///Cell中副标题的颜色内容
#define KSubTitleContentTextColor           [UIColor colorWithRed:129/255.0f green:129/255.0f blue:129/255.0f alpha:1]

////UIImageView的默认背景颜色内容
#define KUIImageViewDefaultColor            [UIColor colorWithRed:158/255.0f green:158/255.0f blue:158/255.0f alpha:0.15f]

////默认的浅灰色字体内容
#define KContentTextLightGrayColor          [UIColor colorWithRed:206/255.0f green:206/255.0f blue:206/255.0f alpha:1.0f]

////蓝色可点击或可编辑内容背景色 即蓝色
#define KContentTextCanEditColor            [UIColor colorWithRed:70.0f/255.0f green:142.0f/255.0f blue:188.0f/255.0f alpha:1.0f]

#define KUINavigationBarColor               [UIColor colorWithRed:35.0f/255.0f green:187.0f/255.0f blue:146.0f/255.0f alpha:1.0f]

#endif
