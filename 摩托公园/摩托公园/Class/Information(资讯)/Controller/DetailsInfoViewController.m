//
//  DetailsInfoViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/25.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "DetailsInfoViewController.h"

@interface DetailsInfoViewController ()

@end

@implementation DetailsInfoViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLeftButtonItem];
    [self createRightButtonItem];
    // Do any additional setup after loading the view.
}
-(void)createLeftButtonItem{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"2.back_arrow"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(12, 0, 20, 21);
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
}
-(void)leftButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createRightButtonItem{
    UIButton * lrightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lrightButton setImage:[UIImage imageNamed:@"12.jcon_mine_favorite"] forState:UIControlStateNormal];
    lrightButton.frame = CGRectMake(12, 0, 20, 21);
    [lrightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:lrightButton];
    self.navigationItem.rightBarButtonItem = item;
}
//收藏按钮
-(void)rightButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
