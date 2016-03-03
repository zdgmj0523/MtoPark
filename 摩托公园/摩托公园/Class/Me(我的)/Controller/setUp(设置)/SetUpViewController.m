//
//  SetUpViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/2.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "SetUpViewController.h"
#import "PrivateViewController.h"
#import "ChangePWViewController.h"

@interface SetUpViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SetUpViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
    
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
-(void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
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
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * array = @[@"省流量模式",@"隐私权限",@"修改密码",@"清理缓存"];
    static NSString * cellID = @"id";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = array[indexPath.row];
    }else{
        
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
            cell.accessoryView = [self crateSwitch];
        }else if (indexPath.row == 1 || indexPath.row == 2) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else{
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 17)];
            label.text = @"123M";
            label.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
            label.textAlignment = NSTextAlignmentRight;
            label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
            cell.accessoryView = label;
        }
    }
    return cell;
}
- (UISwitch *)crateSwitch{
    //创建开关
    UISwitch * swView = [[UISwitch alloc]initWithFrame:CGRectMake(20, 64, 335, 50)];
    
    swView.on = YES;
    swView.onTintColor = [UIColor redColor];
    //添加事件
    [swView addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
    
    return swView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            PrivateViewController * private = [[PrivateViewController alloc]init];
            [self.navigationController pushViewController:private animated:YES];
        }else if (indexPath.row == 2){
            ChangePWViewController * changePW = [[ChangePWViewController alloc]init];
            [self.navigationController pushViewController:changePW animated:YES];
        }
    }
}

-(void)leftButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)switchClick:(UISwitch *)swView{
    
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
