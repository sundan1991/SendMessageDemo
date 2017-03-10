//
//  DataSource.m
//  Demo_2.2
//
//  Created by lifg on 15-2-2.
//  Copyright (c) 2015年 sundan. All rights reserved.
//

#import "DataSource.h"
#import "AttributedStringHelper.h"
#import "ThemeSize.h"
#import "ThemeColor.h"
#import "NSAttributedString+Height.h"


@implementation DataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
+(id)initWithExpresionDataSourceItemWithUnserializedWithString:(NSString *)contentString{
    DataSource *itemData = [[DataSource alloc]init];
    
    
    ///合法性验证
    if (itemData == nil) {
        return itemData;
    }
    
    ///数据验证
    if ([contentString length] < 1 ) {
        return nil;
    }
    
    AttributedStringHelper *attributedStringHelper = [[AttributedStringHelper alloc] init];
    itemData.attributedContentInfor=[attributedStringHelper getAttributedStringWithNSString:contentString textColor:KMessageTextColor];
    
    ///
    [attributedStringHelper initStringSystemFontOfSize:19 withSetupFont:YES];
    
    ///左侧10个像素，右侧10个像素
    [itemData setContentStringHeight:[itemData.attributedContentInfor boundingHeightForWidth:[UIScreen mainScreen].bounds.size.width-10-10]];
    
    return itemData;

}
@end
