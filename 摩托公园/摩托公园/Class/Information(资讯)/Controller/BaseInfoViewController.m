//
//  BaseInfoViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/25.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "BaseInfoViewController.h"
#import "DetailsInfoViewController.h"
#import "BaseInfoTableViewCell.h"
@interface BaseInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)NSMutableArray * advArray;
@property(nonatomic,strong)UIScrollView * advScrollView;
@end

@implementation BaseInfoViewController

//回到主页面隐藏导航栏
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    [self createTableView];
    
    [self createRecommView];
}
#pragma mark 创建广告滚动视图
- (void)createRecommView{
    NSArray * array = @[@"icon_login_qq_darker"];
    _advScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, AUTOSIZE(158))];
    _advScrollView.bounces = NO;
    _advScrollView.pagingEnabled = YES;
    _advScrollView.showsHorizontalScrollIndicator = NO;
    _advScrollView.showsVerticalScrollIndicator = NO;
    //所能显示的大小
    _advScrollView.contentSize = CGSizeMake(array.count * WIDTH, 158);
    _tableView.tableHeaderView=_advScrollView;
    //广告页面视图显示
    for (int i = 0; i < array.count; i++) {
        //依次找到每页的数据源
        
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH * i, 0, WIDTH, AUTOSIZE(158))];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",array[i]]];
        
        [_advScrollView addSubview:imageView];
        
        //开始用户交互
        imageView.userInteractionEnabled = YES;
        //给予图片单击手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDown:)];
        
        [imageView addGestureRecognizer:tap];
        
        //为图片视图设置Tag值
        imageView.tag = 100 + i;
    }

}
- (void)tapDown:(UITapGestureRecognizer*)tap{
    //怎么获取点击的是哪个图片？
    UIImageView * tapImageView = (UIImageView*)tap.view;
    NSLog(@"%@",tapImageView);
}


#pragma mark 创建列表
- (void)createTableView{
//    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,WIDTH, HEIGHT-49) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"BaseInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"BaseInfoID"];
}
#pragma mark 列表的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    if (self.dataArray.count <= 0) {
//        return 0;
//    }
    return 20;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BaseInfoID" forIndexPath:indexPath];
    //防止程序崩溃 判断 如果数据源不存在/为空 不进行界面的搭建
//    if (self.dataArray.count <= 0) {
//        return cell;
//    }
        
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.dataArray.count <= 0) {
//        return 0.0;
//    }
    return 95.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //去除选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //找出对应行的数据模型
    
    //跳转详情界面
    DetailsInfoViewController * info = [[DetailsInfoViewController alloc]init];
    
    //将当前点击行所具有的id传递
//    info.idStr = model.idStr;
    
    //去除标签栏控制器
    info.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:info animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
