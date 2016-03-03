//
//  BaseAIViewController.m
//  摩托公园
//
//  Created by Scott on 16/1/28.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "BaseAIViewController.h"
#import "AllCarController.h"
#import "InformationViewController.h"
#import "MotorInfoViewController.h"

@interface BaseAIViewController ()<returnAllCarIDDelgate>
@property(nonatomic,strong)AllCarController * allContro;
@property(nonatomic,strong)InformationViewController * inforContro;
@end

@implementation BaseAIViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.alpha = 1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createControllers];

    [self createLeftButtonItem];
    [self createRightButtonItem];
    //创建选择按钮
    [self createChooseButtonItem];
    
    // Do any additional setup after loading the view.
}
-(void)createControllers{
    //车款
    _allContro = [[AllCarController alloc]init];
    _allContro.delegate = self;
    [self.view addSubview:_allContro.view];
    
    //详情
    _inforContro = [[InformationViewController alloc]init];
    [self.view addSubview:_inforContro.view];
    _inforContro.view.hidden = YES;
    
}
-(void)createChooseButtonItem{
    NSArray * titleArr = @[@"全部车款",@"品牌详情"];
    for (int i = 0; i< 2; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(72+(60+(self.view.bounds.size.width-(132*2)))*i, 75, 56, 20);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        button.tag = 200 + i;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTintColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1]];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    UIButton * button = (UIButton *)[self.view viewWithTag:200];
    [button setTintColor:[UIColor colorWithRed:211/255.0 green:47/255.0 blue:47/255.0 alpha:1]];

    //创建线条
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(70, 104, 60, 2)];
    view.tag = 250;
    view.backgroundColor = [UIColor colorWithRed:211/255.0 green:47/255.0 blue:47/255.0 alpha:1];
    [self.view addSubview:view];
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
    [rightButton setImage:[UIImage imageNamed:@"2.models_list copy"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(12, 0, 20, 21);
    [rightButton addTarget:self action:@selector(searchButtonClic) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = item;
}
#pragma mark 搜索按钮的点击方法
-(void)searchButtonClic{
    NSLog(@"搜索");
}
-(UILabel *)createTitleLabel{
    UILabel * titlelabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-100)/2, 30, 100, 22.5)];
    //titlelabel.text = _nameStr;
    titlelabel.text = @"阿普利亚";
    titlelabel.font = [UIFont systemFontOfSize:16];
    titlelabel.textAlignment = NSTextAlignmentCenter;
    //titlelabel.backgroundColor = [UIColor redColor];
    return titlelabel;
}
-(void)createButtonItem:(UIButton *)button x:(int)x y:(int)y imageName:(NSString*)imageName{
    button.frame = CGRectMake(x, y, 22, 22);
    [button setImage:[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
}
-(void)backButtonClic:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)backItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 按钮的点击事件
-(void)buttonClick:(UIButton*)button{
    UIView * LineView = (UIView*)[self.view viewWithTag:250];
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    anim.keyPath = @"transform.translation.x";
    anim.duration = 0.2;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    

    if (button.tag == 200) {
        //添加动画
        [LineView.layer addAnimation:anim forKey:nil];
        NSLog(@"左边");
        _inforContro.view.hidden = YES;
        _allContro.view.hidden = NO;
        //[self presentViewController:_allContro animated:YES completion:nil];
        
    }else{
        anim.toValue = @(60+(self.view.bounds.size.width-(132*2)));
        //添加动画
        [LineView.layer addAnimation:anim forKey:nil];
        NSLog(@"右边");
        _inforContro.view.hidden = NO;
        _allContro.view.hidden = YES;
        
        //[self presentViewController:_inforConyto animated:YES completion:nil];
    }
}
#pragma mark 实现代理方法进行页面跳转
-(void)receiveAllCarID:(NSString *)AllCarID{
    MotorInfoViewController * motorInfo = [[MotorInfoViewController alloc]init];
//    [self presentViewController:motorInfo animated:YES completion:nil];
    
    [self.navigationController pushViewController:motorInfo animated:YES];
    
    NSLog(@"%@",AllCarID);
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
