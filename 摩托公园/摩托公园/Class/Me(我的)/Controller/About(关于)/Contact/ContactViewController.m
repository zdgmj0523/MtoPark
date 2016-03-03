//
//  ContactViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/16.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系摩托公园";
    
    [self createLeftButtonItem];
    [self createTableViewUI];
    
    // Do any additional setup after loading the view.
}
-(void)createLeftButtonItem{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"2.back_arrow"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(12, 0, 20, 21);
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
}
-(void)leftButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createTableViewUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * titleAray = @[@"电话：13901390139",@"邮件：cooperation@motopark.cn"];
    NSArray * imageArray = @[@"icon_calling",@"icon_mailing"];
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = titleAray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    //设置cell右侧图片
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageArray[indexPath.row]]];
    //图片居中显示
    imageView.contentMode =  UIViewContentModeCenter;
    cell.accessoryView = imageView;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        NSURL * telUrl = [NSURL URLWithString:@"tel://13901390139"];
        [[UIApplication sharedApplication]openURL:telUrl];
    }else{
        NSURL * mailUrl = [NSURL URLWithString:@"mailto://cooperation@motopark.cn"];
        [[UIApplication sharedApplication]openURL:mailUrl];
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
