//
//  MeController.m
//  摩托公园
//
//  Created by Scott on 16/1/26.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "MeController.h"
#import "SetUpViewController.h"
#import "AboutViewController.h"
#import "MessageViewController.h"
#import "ScoreViewController.h"
#import "PublishmentViewController.h"
#import "InformViewController.h"

@interface MeController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIView * userView;
@end

@implementation MeController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
////    self.navigationController.navigationBarHidden = YES;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
//隐藏导航栏分割线
    self.navigationController.navigationBar.clipsToBounds = YES;
    
    self.tabBarController.tabBar.hidden = NO;
    
}
//实体将要消失时调用的方法
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //显示导航栏分割线
    self.navigationController.navigationBar.clipsToBounds = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView * navigateImageView = [self ]
    
    [self createUserLoginView];
    [self createRightButtonItem];
    [self createTableView];
    
}
-(void)createRightButtonItem{
//    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftButton setImage:[UIImage imageNamed:@"2.back_arrow"] forState:UIControlStateNormal];
//    leftButton.frame = CGRectMake(12, 0, 20, 21);
//    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(rightBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)rightBarButtonItemClick{
    SetUpViewController * setUp = [[SetUpViewController alloc]init];
    [self.navigationController pushViewController:setUp animated:NO];
}
-(void)createUserLoginView{
//    if ([UIScreen mainScreen].bounds.size.width == 414) {
//        _userView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 222*(414/375))];
//    }
//    if ([UIScreen mainScreen].bounds.size.width == 375) {
//        _userView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 222)];
//    }
    _userView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AUTOSIZE(WIDTH), AUTOSIZE(222))];
    _userView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    
    [self createUserShowImageAndInfo];
    
    [self.view addSubview:_userView];
}
-(void)createUserShowImageAndInfo{
    
//    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 98, 98)];
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, AUTOSIZE(98), AUTOSIZE(98))];
    CGPoint center = backView.center;
    center.x = self.view.bounds.size.width/2;
    backView.center = center;
    [_userView addSubview:backView];
    
    UIImageView * imageView = [[UIImageView alloc]init];
//    if ([UIScreen mainScreen].bounds.size.width == 414) {
//        imageView.frame = CGRectMake(0, 0, 64*(414/375), 64*(414/375));
//    }
//    if ([UIScreen mainScreen].bounds.size.width == 375) {
//        imageView.frame = CGRectMake(0, 0, 64, 64);
//    }
    imageView.frame = CGRectMake(0, 0, AUTOSIZE(64), AUTOSIZE(64));
    
    CGPoint imagePoint = imageView.center;
    imagePoint.x = backView.bounds.size.width/2;
    imageView.center = imagePoint;
    imageView.layer.cornerRadius = AUTOSIZE(64)/2;
    imageView.image = [UIImage imageNamed:@"icon_app_logo"];
    [backView addSubview:imageView];
    
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 68, backView.bounds.size.width, 20)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"泰山宋晓健";
    nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    [backView addSubview:nameLabel];
    
//    添加手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    //注意添加方法
    [backView addGestureRecognizer:tap];
    
    NSArray * array = @[@"关注",@"粉丝",@"好友"];
    for (int i = 0; i < 3; i ++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(44+((self.view.bounds.size.width - 88)/3+19.5)*i, 192, 28, 20);
        [button setTintColor:[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1]];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(infoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        [_userView addSubview:button];
        
        
        UILabel * numLabel = [[UILabel alloc]initWithFrame:CGRectMake(44+32+((self.view.bounds.size.width - 88)/3+19.5)*i, 193.5, 15.5, 17)];
        numLabel.textColor = [UIColor colorWithRed:211/255.0 green:47/255.0 blue:47/255.0 alpha:1];
        numLabel.text = @"14";
        numLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        [_userView addSubview:numLabel];
    }
}
#pragma mark 手势点击效果
-(void)tapClick{
    NSLog(@"登陆");
    IPhoneLoginViewController * iPhoneView = [[IPhoneLoginViewController alloc]init];
    [self.navigationController pushViewController:iPhoneView animated:YES];
}
-(void)infoButtonClick:(UIButton *)button{
    if ([button.titleLabel.text isEqualToString:@"关注"]) {
        NSLog(@"%@",button.titleLabel.text);
    }else if ([button.titleLabel.text isEqualToString:@"粉丝"]){
        NSLog(@"%@",button.titleLabel.text);
    }else{
        NSLog(@"%@",button.titleLabel.text);
    }
}
//-(void)buttonClick:(UIButton *)button{
//    SetUpViewController * setUp = [[SetUpViewController alloc]init];
//    [self.navigationController pushViewController:setUp animated:NO];
//}
-(void)createTableView{
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 222, self.view.bounds.size.width, self.view.bounds.size.height - 222-49) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * nameArray = @[@[@"通知",@"消息",@"收藏",@"草稿",@"已发布"],@[@"反馈",@"关于"]];
    NSArray * imageArray = @[@[@"12.icon_mine_notification",@"12.icon_mine_msg",@"12.jcon_mine_favorite",@"12.icon_mine_draft",@"12.icon_mine_published"],@[@"12.icon_mine_feedback",@"12.icon_mine_about"]];
    static NSString * cellID = @"id";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.section][indexPath.row]];
    cell.textLabel.text = nameArray[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            InformViewController * inform = [[InformViewController alloc]init];
            [self.navigationController pushViewController:inform animated:YES];
        }else if (indexPath.row == 1){
            MessageViewController * mess = [[MessageViewController alloc]init];
            [self.navigationController pushViewController:mess animated:YES];
            
        }else if (indexPath.row == 2){
        
        }else if (indexPath.row == 3){
        
        }else{
            PublishmentViewController * publishment = [[PublishmentViewController alloc]init];
            [self.navigationController pushViewController:publishment animated:YES];
        }
    }else{
        if (indexPath.row == 0) {
            ScoreViewController * score = [[ScoreViewController alloc]init];
            [self.navigationController pushViewController:score animated:YES];
//            [self presentViewController:score animated:YES completion:nil];
        }else{
            AboutViewController * aboutView = [[AboutViewController alloc]init];
            [self.navigationController pushViewController:aboutView animated:YES];
        }
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
