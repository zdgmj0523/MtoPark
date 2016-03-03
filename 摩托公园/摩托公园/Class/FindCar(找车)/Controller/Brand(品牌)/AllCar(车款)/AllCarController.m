//
//  AllCarController.m
//  摩托公园
//
//  Created by Scott on 16/1/27.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "AllCarController.h"
#import "AllCarTableViewCell.h"
#import "MotorInfoViewController.h"

#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
@interface AllCarController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation AllCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray array];
    [self creatrTableView];
    // Do any additional setup after loading the view.
}
-(void)creatrTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 114, WIDTH, HEIGHT -49)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setSeparatorColor:[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1]];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"AllCarTableViewCell" bundle:nil] forCellReuseIdentifier:@"AllCarID"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AllCarTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AllCarID" forIndexPath:indexPath];
    cell.imageView.contentMode =  UIViewContentModeCenter;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate receiveAllCarID:@"123"];
    MotorInfoViewController * motorInfo = [[MotorInfoViewController alloc]init];
//    self.tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:motorInfo animated:YES];
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
