//
//  TabBarController.m
//  摩托公园
//
//  Created by Scott on 16/1/26.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "TabBarController.h"
#import "FindCarController.h"
#import "InformationController.h"
#import "MeController.h"
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    InformationController * information = [[InformationController alloc]init];
    [self setUpChildViewController:information title:@"资讯" image:@"icon_main" selectimage:@"icon_main_clicked"];
    
    FindCarController * fCar = [[FindCarController alloc]init];
    [self setUpChildViewController:fCar title:@"找车" image:@"icon_motorcyle" selectimage:@"icon_motorcyle_clicked"];
    
    MeController * me = [[MeController alloc]init];
    [self setUpChildViewController:me title:@"我的" image:@"icon_mine" selectimage:@"icon_mine_clicked"];
    
    // Do any additional setup after loading the view.
}
-(void)setUpChildViewController:(UIViewController *)childView title:(NSString *)title image:(NSString *)imageName selectimage:(NSString *)selectImageName{
    
    childView.tabBarItem.title = title;
    childView.tabBarItem.image = [UIImage imageNamed:imageName];
    childView.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:childView];
    [self addChildViewController:nav];
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
