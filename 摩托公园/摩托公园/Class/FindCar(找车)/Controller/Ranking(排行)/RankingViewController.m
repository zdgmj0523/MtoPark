//
//  RankingViewController.m
//  摩托公园
//
//  Created by Scott on 16/1/26.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "RankingViewController.h"
#import "RankingTableViewCell.h"
#import "MotorInfoViewController.h"

@interface RankingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation RankingViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray array];
    [self createTableViewController];
    // Do any additional setup after loading the view.
}
-(void)createTableViewController{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height- 64-20) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setSeparatorColor:[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1]];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"RankingTableViewCell" bundle:nil] forCellReuseIdentifier:@"RankingID"];
}
#pragma mark tableView的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RankingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"RankingID" forIndexPath:indexPath];
    //cell.titlelabel.text = @"日";
    if (indexPath.row == 0 ||indexPath.row == 1 ||indexPath.row ==2) {
        cell.rankingNum.textColor = [UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MotorInfoViewController * motor = [[MotorInfoViewController alloc]init];
    [self.navigationController pushViewController:motor animated:YES];
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
