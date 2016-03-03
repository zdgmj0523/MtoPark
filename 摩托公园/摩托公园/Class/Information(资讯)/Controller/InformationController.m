//
//  InfermationController.m
//  摩托公园
//
//  Created by Scott on 16/1/26.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "InformationController.h"
#import "SCNavTabBarController.h"
#import "NewsViewController.h"
#import "VenderViewController.h"
#import "EquipmentViewController.h"
#import "KnowledgeViewController.h"

@interface InformationController ()

@end

@implementation InformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createViewControllers];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)createViewControllers{
    self.navigationController.navigationBarHidden = YES;
    NewsViewController * news = [[NewsViewController alloc]init];
    news.title = @"最新";
    
    VenderViewController * vender = [[VenderViewController alloc]init];
    vender.title = @"厂家";
    
    EquipmentViewController * equip = [[EquipmentViewController alloc]init];
    equip.title = @"装备";
    
    KnowledgeViewController * know = [[KnowledgeViewController alloc]init];
    know.title = @"知识";
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[news, vender, equip, know];
    navTabBarController.navTabBarColor = [UIColor colorWithRed:211 green:47 blue:47 alpha:1];
    navTabBarController.showArrowButton = NO;
    [navTabBarController addParentController:self];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
