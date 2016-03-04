//
//  AboutViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/5.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "AboutViewController.h"
#import "ContactViewController.h"

@interface AboutViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation AboutViewController
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"关于";
    [self createLeftButtonItem];
    [self createView];
    
    [self createTableView];
    // Do any additional setup after loading the view.
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
-(void)createView{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64+34, 64, 64)];
    CGPoint center = imageView.center;
    center.x = self.view.bounds.size.width/2;
    imageView.center = center;
    imageView.layer.cornerRadius = 10;
    imageView.image = [UIImage imageNamed:@"icon_app_logo"];
    [self.view addSubview:imageView];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.origin.y+72, 40, 14)];
    label.text = @"版本1.0";
    CGPoint laCenter = label.center;
    laCenter.x = self.view.bounds.size.width/2;
    label.center = laCenter;
    label.textAlignment = UITextAlignmentCenter;
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    label.textColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    [self.view addSubview:label];
}
-(void)createTableView{
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 222,WIDTH , HEIGHT) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    
}
#pragma mark tableView设置
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * titleArray = @[@"欢迎页",@"给摩托公园app打分",@"联系摩托公园",@"推荐给好友"];
    static NSString * cellID = @"id";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = titleArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
    
    }else if (indexPath.row == 2){
        ContactViewController * contact = [[ContactViewController alloc]init];
        [self.navigationController pushViewController:contact animated:YES];
    }else{
    
    }
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
