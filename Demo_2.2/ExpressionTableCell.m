//
//  ExpressionTableCell.m
//  ResetTableViewCell
//
//  Created by 张利广 on 15/1/28.
//  Copyright (c) 2015年 sdyk.cn. All rights reserved.
//

#import "ExpressionTableCell.h"
#import "RichTextLabel.h"
#import "AttributedStringHelper.h"

@interface ExpressionTableCell ()
///数据内容
@property (nonatomic , strong)  DataSource     *contentDataSource;
///数据内容视图
@property (nonatomic , weak)    RichTextLabel           *contentTextLabel;
@end
@implementation ExpressionTableCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //内容详情
        RichTextLabel* richLable = [[RichTextLabel alloc] initWithFrame:self.bounds];
        richLable.lineBreakMode = NSLineBreakByCharWrapping;
        richLable.textColor = [UIColor colorWithRed:172/255.0f green:172/255.0f blue:172/255.0f alpha:1.0f];
        richLable.highlightedTextColor = [UIColor whiteColor];
        richLable.numberOfLines = 0;
        richLable.opaque = NO; // 选中Opaque表示视图后面的任何内容都不应该绘制
        richLable.backgroundColor = [UIColor clearColor];
        [self addSubview:richLable];
        self.contentTextLabel = richLable;
    }
    
    return self;
}

- (void)clearDataInfor{
    ///清空原有数据
    AttributedStringHelper *attributedStringHelper = [[AttributedStringHelper alloc] init];
    NSAttributedString* attributedContentInfor=[attributedStringHelper getAttributedStringWithNSString:@"" textColor:[UIColor colorWithRed:65/255.0f green:65/255.0f blue:65/255.0f alpha:1.0f]];
    [self.contentTextLabel setAttString:attributedContentInfor];
    [self.contentTextLabel setFrame:CGRectZero];
}

- (void)initExpressionTableCellDataWithDataSource:(DataSource *)dataSourceItem{
    
    ///保留实体类
    self.contentDataSource = dataSourceItem;
    
    ///清空数据
    [self clearDataInfor];
    
    ///加载内容
    [self.contentTextLabel setAttString:dataSourceItem.attributedContentInfor];
    
    [self.contentTextLabel setFrame:CGRectMake(10 ,10, [UIScreen mainScreen].bounds.size.width-10-10,self.contentDataSource.contentStringHeight)];
}

@end
