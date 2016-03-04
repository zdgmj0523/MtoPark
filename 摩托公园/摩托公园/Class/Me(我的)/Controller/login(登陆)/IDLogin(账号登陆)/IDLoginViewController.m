//
//  IDLoginViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/28.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "IDLoginViewController.h"


@interface IDLoginViewController ()

@end

@implementation IDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号登陆";
    [self createLeftButtonItem];
    // Do any additional setup after loading the view from its nib.
}
-(void)createLeftButtonItem{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"2.back_arrow"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(12, 0, 20, 21);
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
}
-(void)leftButtonClick:(UIButton *)button{
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

//登陆按钮
- (IBAction)loginButton:(UIButton *)sender {
}
//忘记密码？
- (IBAction)forgetPwButton:(UIButton *)sender {
    ForgetPWViewController * forget = [[ForgetPWViewController alloc]init];
    [self.navigationController pushViewController:forget animated:YES];
}
//qq登陆
- (IBAction)qqLoginButtonClick:(UIButton *)sender {
}
//新浪登陆
- (IBAction)sinaLoginButtonClick:(UIButton *)sender {
}

- (IBAction)userLoginButtonClick:(UIButton *)sender {
}
@end
