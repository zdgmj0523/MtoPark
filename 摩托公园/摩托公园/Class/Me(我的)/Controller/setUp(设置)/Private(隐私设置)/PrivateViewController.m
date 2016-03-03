//
//  PrivateViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/3.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "PrivateViewController.h"

@interface PrivateViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PrivateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"隐私设置";
    
    [self createLeftButtonItem];
    
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
}
-(void)leftButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createTableView{
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else{
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * titleArray = @[@[@"仅注册用户可见",@"好友可见",@"保密",@"公开"],@[@"全部接收",@"好友可见"]];
    static NSString * cellID = @"id";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = titleArray[indexPath.section][indexPath.row];
    }else{
        cell.textLabel.text = titleArray[indexPath.section][indexPath.row];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 48;
    }else{
        return 30;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"好友列表权限设置";
    }else{
        return @"消息设置";
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
