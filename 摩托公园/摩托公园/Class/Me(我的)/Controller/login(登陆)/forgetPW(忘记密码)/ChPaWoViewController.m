//
//  ChPaWoViewController.m
//  摩托公园
//
//  Created by Scott on 16/3/2.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "ChPaWoViewController.h"

@interface ChPaWoViewController ()

@end

@implementation ChPaWoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"重置密码";
    
    [self createLeftButtonItem];
    [self createRightButtonItem];
    // Do any additional setup after loading the view from its nib.
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
    [rightButton setTitle:@"确定" forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(12, 0, 48, 23);
    rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)rightButtonClick:(UIButton *)button{
    
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
