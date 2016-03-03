//
//  FindCarController.m
//  摩托公园
//
//  Created by Scott on 16/1/26.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "FindCarController.h"
#import "BrandViewController.h"
#import "ScreenViewController.h"
#import "CollectViewController.h"
#import "RankingViewController.h"
#import "SCNavTabBarController.h"

@interface FindCarController ()<UIScrollViewDelegate>
//@property(nonatomic,strong)UIScrollView * mainView;
//@property(nonatomic,strong)NSArray * subViewControllers;
@end

@implementation FindCarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createViewControllers];
}
-(void)createViewControllers{
    self.navigationController.navigationBarHidden = YES;
    BrandViewController * brand = [[BrandViewController alloc]init];
    brand.title = @"品牌";
    
    ScreenViewController * screen = [[ScreenViewController alloc]init];
    screen.title = @"筛选";
    
    CollectViewController * collect = [[CollectViewController alloc]init];
    collect.title = @"收藏";
    
    RankingViewController * ranking = [[RankingViewController alloc]init];
    ranking.title = @"排行";
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[brand, screen, collect, ranking];
    navTabBarController.navTabBarColor = [UIColor colorWithRed:211 green:47 blue:47 alpha:1];
    navTabBarController.showArrowButton = YES;
    [navTabBarController addParentController:self];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
