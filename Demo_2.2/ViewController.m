//
//  ViewController.m
//  Demo_2.2
//
//  Created by lifg on 15-2-2.
//  Copyright (c) 2015年 sundan. All rights reserved.
//

#import "ViewController.h"
#import "PublishView.h"
#import "DataSource.h"
#import "ExpressionTableCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,PublishViewDelegate>

@property (nonatomic,copy) UITableView *myTableView;
@property (nonatomic,copy) NSMutableArray *dataArray;
///初始化模拟数据
@property (nonatomic , strong)  NSMutableArray      *expressDataSource;
///发布视图
@property (nonatomic,weak)      PublishView         *publishView;
//@property (nonatomic , weak)    UITableView         *tableView;

///初始化模拟数据
- (void)initWithexpressDataSource;
@end
#define  kPublishViewHeight  45
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.expressDataSource = [[NSMutableArray alloc]init];
    _myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    CGRect rc = self.view.bounds;
    //发布文本框
    PublishView* commentView = [[PublishView alloc] initWithFrame:CGRectMake(0.0f,
                                                                             rc.size.height - kPublishViewHeight,
                                                                             rc.size.width,
                                                                             kPublishViewHeight)];
    commentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    
    commentView.delegate = self;
    [self.view addSubview:commentView];
    self.publishView = commentView;
    [self addKeyboardNotification];

}
- (void)addKeyboardNotification{
    //添加键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    //添加键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark -键盘出现时的通知
- (void) keyboardWillAppear:(NSNotification *)notification
{
    
    CGRect keyBoardRect=[notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat deltaY=keyBoardRect.size.height;
    [self.publishView resetButton];
    [self didPublishViewLayoutChanged:deltaY withHeight:self.publishView.frame.size.height];
    
}
//================================发布使用的代码
- (void)didPublishViewLayoutChanged:(CGFloat)bottom withHeight:(CGFloat)height{
    [UIView beginAnimations:@"LayoutView" context:nil];
    [UIView setAnimationDuration:0.3f];
    
    CGRect rc = self.view.bounds;
    
    self.publishView.frame = CGRectMake(0,
                                        rc.size.height - height - bottom,
                                        rc.size.width,
                                        height);
    [UIView commitAnimations];
}
- (void)sendExpressionInfor:(NSString *)contentString{
    ///#里有内容#
    DataSource *dataSource = [DataSource initWithExpresionDataSourceItemWithUnserializedWithString:contentString];
    if (dataSource) {
        [self.self.expressDataSource insertObject:dataSource atIndex:0];
    }
    [_myTableView reloadData];
}
#pragma mark -键盘隐藏时的通知
- (void) keyboardWillDisappear:(NSNotification *) notification
{
    //
    [self didPublishViewLayoutChanged:0.0 withHeight:self.publishView.frame.size.height];
    
}


//#pragma mark - delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.expressDataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"cell";
    ExpressionTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (nil == cell) {
        cell = [[ExpressionTableCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellName];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    ExpressionTableCell *tableViewCell = (ExpressionTableCell *)cell;
    
    
    if (indexPath.row < self.expressDataSource.count) {
        
        DataSource *dataSource = (DataSource *)[self.expressDataSource objectAtIndex:indexPath.row];
        [tableViewCell initExpressionTableCellDataWithDataSource:dataSource];
    }

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 0.0f;
    
    if (indexPath.row < self.expressDataSource.count) {
        
        DataSource *dataSource = (DataSource *)[self.expressDataSource objectAtIndex:indexPath.row];
        ///顶部10个像素，底部10个像素
        rowHeight = 10.0f + dataSource.contentStringHeight + 10.0f;
    }
    return rowHeight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
