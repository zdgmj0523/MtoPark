//
//  BrandViewController.m
//  摩托公园
//
//  Created by Scott on 16/1/26.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "BrandViewController.h"
#import "BaseAIViewController.h"
#import "BrandTableViewCell.h"

@interface BrandViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation BrandViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [NSMutableArray array];
    [self creatTableView];
    [self loadData];
    
    // Do any additional setup after loading the view.
}

-(void)loadData{
    //创建数据源
    for (int i = 'A'; i <= 'Z'; i++) {
        NSMutableArray * arr = [NSMutableArray array];
        for (int j = 0; j < 10; j++) {
            [arr addObject:[NSString stringWithFormat:@"%c%d",i,j]];
        }
        [self.dataArray addObject:arr];
    }
    
}

-(void)creatTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height -64-44) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView setSeparatorColor:[UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1]];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 92, 0, 0);
    
    [self createHeadView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"BrandTableViewCell" bundle:nil] forCellReuseIdentifier:@"BrandId"];
}

#pragma mark cell的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BrandTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BrandId"];
    if (indexPath.row == 0 || indexPath.row == [self.dataArray[indexPath.section] count]-1) {
        cell.titleLabel.frame = CGRectMake(89, 30, 100, 20);
    }
    if (indexPath.row == 0 || indexPath.row == [self.dataArray[indexPath.section] count]-1) {
        cell.imView.frame = CGRectMake(20, 12, 64, 32);
        
    }
    cell.imView.image = [UIImage imageNamed:@"2.models_list copy"];
//    cell.imView.contentMode =  UIViewContentModeCenter;
//    [cell.imView setContentScaleFactor:2];
    
    //cell.labelText.text = _dataArray[indexPath.section] [indexPath.row] ;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseAIViewController * base = [[BaseAIViewController alloc]init];
    base.nameStr = _dataArray[indexPath.section] [indexPath.row];
//    [self presentViewController:base animated:YES completion:nil];
    [self.navigationController pushViewController:base animated:YES];
    
}
//列表的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == [self.dataArray[indexPath.section] count]-1) {
        return 50;
    }else{
        return 44;
    }
}
//段头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
//段尾的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

#pragma mark 自定义表头视图
-(void)createHeadView{
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 126);
    view.backgroundColor = [UIColor whiteColor];
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_hot"]];
    imageView.frame = CGRectMake(20, 16, 12, 15);
    [view addSubview:imageView];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(40, 16, 56, 15)];
    label.text = @"热门品牌";
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    
    NSArray * Array = @[@"哈普利亚",@"哈雷",@"比亚乔",@"哈雷戴维森",@"雅马哈",@"川崎",@"贝纳利",@"光阳"];
    int a = 0;
    for (int i = 0; i < 2; i ++) {
        
        for (int j = 0; j < 4;  j ++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(20 + (AUTOSIZE(72) + AUTOSIZE(8)) * j,43 + 43 * i, AUTOSIZE(72), AUTOSIZE(30));
            [button setTitle:Array[a] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.titleLabel.font = [UIFont systemFontOfSize:12];
            
            button.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:button];
            a ++;
        }
        
    }
    
    _tableView.tableHeaderView = view;
    
}

/**
 *  点击进行页面的跳转
 *
 *  @param button button description
 */
-(void)buttonClick:(UIButton *)button{
    NSLog(@"热门品牌");
}
#pragma mark 索引方法
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    _tableView.sectionIndexColor = [UIColor redColor];
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 'A'; i <= 'Z'; i ++) {
        [arr addObject:[NSString stringWithFormat:@"%c",i]];
    }
    return arr;
}
#pragma mark 修改sectionHeard文字
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //第A段到第Z段
    return [NSString stringWithFormat:@"%c",'A'+section];
}
#pragma mark 自定义sectionHeardView
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString * sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20.1, 1.5, 12, 16.5)];
    label.font = [UIFont systemFontOfSize:12];
    label.text = sectionTitle;
    
    UIView * sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width-20, 20)];
    [sectionView setBackgroundColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1]];
    [sectionView addSubview:label];
    return sectionView;
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
