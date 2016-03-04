//
//  IPhoneLoginViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/27.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "IPhoneLoginViewController.h"
#import "IDLoginViewController.h"
@interface IPhoneLoginViewController ()

@end

@implementation IPhoneLoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手机号登陆";
    
    [self createLeftButtonItem];
    [self createTestingButtonStyle];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)createTestingButtonStyle{
    _testingButton.layer.borderWidth = 1.0;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    _testingButton.layer.borderColor = CGColorCreate(colorSpace,(CGFloat[]){ 182/255.0, 182/255.0, 182/255.0, 1 });
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

//验证
- (IBAction)testingButton:(UIButton *)sender {
}
//用户协议
- (IBAction)userButton:(UIButton *)sender {
}
//登陆
- (IBAction)loginButton:(UIButton *)sender {
}
//账号登陆
- (IBAction)idLoginButton:(UIButton *)sender {
    IDLoginViewController * idLogin = [[IDLoginViewController alloc]init];
    [self.navigationController pushViewController:idLogin animated:YES];
}
@end
