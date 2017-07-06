//
//  PersonCenterViewController.m
//  CopySource
//
//  Created by zhengwenming on 2017/4/9.
//  Copyright © 2017年 zhengwenming. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "SetViewController.h"
#import "MessageViewController.h"

@interface PersonCenterViewController ()

@end

@implementation PersonCenterViewController
-(BOOL)gestureRecognizerShouldBegin{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"setting" highIcon:nil target:self action:@selector(setItemDidAction:)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"message" highIcon:nil target:self action:@selector(messageItemDidAction:)];

}
-(void)setItemDidAction:(UIBarButtonItem *)sender{
    SetViewController *setVC = [SetViewController new];
    setVC.isHideBackItem = NO;
    [self.navigationController pushViewController:setVC animated:YES];
}
-(void)messageItemDidAction:(UIBarButtonItem *)sender{
    [self.navigationController pushViewController:[MessageViewController new] animated:YES];
//    [self presentViewController:[MessageViewController new] animated:YES completion:^{
//        
//    }];

}
-(BOOL)shouldAutorotate{
    return NO;
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
