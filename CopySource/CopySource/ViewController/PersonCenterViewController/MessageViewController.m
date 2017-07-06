//
//  MessageViewController.m
//  AIHealth
//
//  Created by 郑文明 on 17/1/25.
//  Copyright © 2017年 郑文明. All rights reserved.
//

#import "MessageViewController.h"
#import "LoginViewController.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSString *applicantId;
}
@property(nonatomic,strong)UITableView *messageTableView;
@property(nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation MessageViewController
/**
 懒加载数据源dataSource
 
 @return dataSource
 */
-(NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return  _dataSource;
}
/**
 懒加载tableView
 
 @return myGroupTableView
 */
-(UITableView *)messageTableView{
    if (_messageTableView==nil) {
        _messageTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavbarHeight, kScreenWidth, kScreenHeight-kNavbarHeight) style:UITableViewStylePlain];
        _messageTableView.delegate = self;
        _messageTableView.dataSource = self;
        _messageTableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_messageTableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:@"UITableViewCell"];
        _messageTableView.rowHeight = 50;
    }
    return _messageTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的消息";
    for (NSUInteger index = 0; index<20; index++) {
        [self.dataSource addObject:@(index)];
    }
    [self.view addSubview:self.messageTableView];
}

//支不支持删除
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//滑动删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return UITableViewCellEditingStyleDelete;
}
-(NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return@"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self.dataSource removeObjectAtIndex:indexPath.row];

        
        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationBottom];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =  (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataSource[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    return;
    LoginViewController *loginVC =[LoginViewController new];
    BaseNavigationController *baseNav = [[BaseNavigationController alloc]initWithRootViewController:loginVC];
    [self presentViewController:baseNav animated:YES completion:nil];
}
//- (BOOL)shouldAutorotate{
//    //是否允许转屏
//    return YES;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    //viewController所支持的全部旋转方向
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    //viewController初始显示的方向
//    return UIDeviceOrientationLandscapeRight;
//}

- (void)dealloc
{
    WMLog(@"%s dealloc",object_getClassName(self));
}

@end
