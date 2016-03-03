//
//  ForgetPWViewController.m
//  摩托公园
//
//  Created by Scott on 16/3/2.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "ForgetPWViewController.h"
#import "ChPaWoViewController.h"
@interface ForgetPWViewController ()<UITextFieldDelegate>

@end

@implementation ForgetPWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    [self createLeftButtonItem];
    
    [self createRightButtonItem];
    
    [self createTestingButtonStyle];
    
    [self createController];
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
}
-(void)leftButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createRightButtonItem{
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"下一步" forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(12, 0, 48, 23);
    rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)rightButtonClick:(UIButton *)button{
    ChPaWoViewController * change = [[ChPaWoViewController alloc]init];
    [self.navigationController pushViewController:change animated:YES];
}

-(void)createController{
    _iPhoneNum.delegate = self;
    _testingNum.delegate = self;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapGestureRecognizerClick:)];
    //添加手势
    [self.view addGestureRecognizer:singleTap];
}
-(void)TapGestureRecognizerClick:(UITapGestureRecognizer *)tap{
    [_testingNum resignFirstResponder];
    [_iPhoneNum resignFirstResponder];
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

- (IBAction)testingButtonClick:(UIButton *)sender {
}
@end
