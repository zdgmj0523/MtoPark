//
//  ScreenViewController.m
//  摩托公园
//
//  Created by Scott on 16/1/26.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "ScreenViewController.h"
#import "PriceTableViewCell.h"
@interface ScreenViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UITableViewCell * cell;

//@property(nonatomic,strong)TTRangeSlider * rangSlider;
@property(nonatomic,assign)int num;
@property(nonatomic,assign)NSInteger sectionNum;

@property(nonatomic,strong)UIButton * tempButton;
@property(nonatomic,strong)UIButton * tempButton1;
@property(nonatomic,strong)UIButton * tempButton2;
@property(nonatomic,strong)UIButton * tempButton3;
@property(nonatomic,strong)UIButton * tempButton4;
@property(nonatomic,strong)UIButton * tempButton5;

@end

@implementation ScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _num = 0;
    _sectionNum = 0;
    [self createtableView];
    
    // Do any additional setup after loading the view.
}
-(void)hiddenButtonClick:(UIButton *)button{
    _num = !_num;
    if (_num != 0) {
        [button setTitle:@"收起选项" forState:UIControlStateNormal];
    }else{
        [button setTitle:@"展开更多选项" forState:UIControlStateNormal];
    }
    _sectionNum = !_sectionNum;
    [_tableView reloadData];
}
-(void)lookButtonClick:(UIButton *)button{
    
}
-(UIView *)createFooterView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-49-28-16-64, WIDTH, AUTOSIZE(50))];
    view.tag = 60;
    view.backgroundColor = [UIColor whiteColor];
    [_tableView addSubview:view];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"展开更多选项" forState:UIControlStateNormal];
    [button setTintColor:[UIColor redColor]];
    button.frame = CGRectMake(AUTOSIZE(290), 0, AUTOSIZE(80), AUTOSIZE(14));
    button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    [button addTarget:self action:@selector(hiddenButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 50;
    [view addSubview:button];
    UIButton * lookButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [lookButton setTitle:@"查看符合条件的384款车型" forState:UIControlStateNormal];
    [lookButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    lookButton.frame = CGRectMake((WIDTH - AUTOSIZE(200))/2, 20, AUTOSIZE(200), AUTOSIZE(28));
    lookButton.backgroundColor = [UIColor redColor];
    //    lookButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    lookButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [lookButton addTarget:self action:@selector(lookButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:lookButton];
    return view;
}

-(void)createtableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"PriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"priceID"];
    _tableView.tableFooterView = [self createFooterView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_num == 0) {
        return 3;
    }else{
        return 8;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString  * cellID = @"cellID";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (_cell == nil) {
        _cell = [[UITableViewCell alloc]init];
    }
    _cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0){
        _cell = [tableView dequeueReusableCellWithIdentifier:@"priceID" forIndexPath:indexPath];
//        [self createPriceCell];
    }else if (indexPath.section == 1){
        [self createImageCell];
    }else if (indexPath.section == 2){
        NSArray * array = @[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
        [self createInitCell:@"排量" nsarray:array action:@selector(displacementButtonclick:)];
    }else if (indexPath.section == 3){
        NSArray * array = @[@"",@"",@"",@"",@"",@""];
        [self createInitCell:@"气缸数量" nsarray:array action:@selector(numberOfCylindersButtonclick:)];
    }else if (indexPath.section == 4){
        NSArray * array = @[@"",@"",@"",@""];
        [self createInitCell:@"冷却方式" nsarray:array action:@selector(coolingWayButtonclick:)];
    }else if (indexPath.section == 5){
        NSArray * array = @[@"",@"",@""];
        [self createInitCell:@"供油方式" nsarray:array action:@selector(oilSupplyWayButtonclick:)];
    }else if (indexPath.section == 6){
        NSArray * array = @[@"",@"",@"",@"",@"",@"",@"",@"",@""];
        [self createInitCell:@"国别" nsarray:array action:@selector(countryButtonclick:)];
    }else{
        NSArray * array = @[@"",@"",@"",@"",@"",@"",@"",@""];
        [self createInitCell:@"年份" nsarray:array action:@selector(yearButtonclick:)];
    }
    return _cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 123;
    }else if (indexPath.section == 1) {
        return 212;
    }else if (indexPath.section == 2) {
        return 160;
    }else if (indexPath.section == 3) {
        return 116;
    }else if (indexPath.section == 4) {
        return 72;
    }else if (indexPath.section == 5) {
        return 72;
    }else if (indexPath.section == 6) {
        return 116;
    }else {
        return 116;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (_sectionNum == 0) {
        if (section == 2) {
            return 0.1;
        }else{
            return 8;
        }
    }else{
        if (section == 7) {
            return 0.1;
        }else{
            return 8;
        }
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 8)];
    footView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    return footView;
}
#pragma mark 搭建UI见面方法
-(void)createPriceCell{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 16, 28, 20)];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label.text = @"价格";
    [_cell.contentView addSubview:label];
    
//    _rangSlider = [[TTRangeSlider alloc]initWithFrame:CGRectMake(20, 38, WIDTH-20-56, 2)];
//    _rangSlider.delegate = self;
//    _rangSlider.minValue = 0;
//    _rangSlider.maxValue = 25;
//    _rangSlider.selectedMinimum = 0;
//    _rangSlider.selectedMaximum = 25;
//    [_cell.contentView addSubview:_rangSlider];
}
-(void)createImageCell{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, AUTOSIZE(60), AUTOSIZE(20))];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label.text = @"类型";
    [_cell.contentView addSubview:label];
    for (int i = 0; i < 3; i ++) {
        for (int j = 0; j < 4; j ++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(20+((AUTOSIZE(68)+AUTOSIZE(20))*j), 28+(48+14)*i, AUTOSIZE(68), 48);
            [button addTarget:self action:@selector(typeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = [UIColor lightGrayColor];
            [button setBackgroundImage:[UIImage imageNamed:@"12.icon_mine_about"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"12.icon_mine_draft"] forState:UIControlStateSelected];
            [_cell.contentView addSubview:button];
        }
        
    }

}
-(void)createInitCell:(NSString *)title nsarray:(NSArray *)array action:(SEL)action{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, AUTOSIZE(80), AUTOSIZE(20))];
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label.text = title;
    [_cell.contentView addSubview:label];
    
    for (int i = 0; i < array.count; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i<5) {
            button.frame = CGRectMake(20+((AUTOSIZE(60)+AUTOSIZE(8))*i), 28, AUTOSIZE(60), 32);
        }else if (i>=5&&i<10){
            button.frame = CGRectMake(20+((AUTOSIZE(60)+AUTOSIZE(8))*(i-5)), 28+(32+12)*1, AUTOSIZE(60), 32);
        }else{
            button.frame = CGRectMake(20+((AUTOSIZE(60)+AUTOSIZE(8))*(i-10)), 28+(32+12)*2, AUTOSIZE(60), 32);
        }
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor lightGrayColor];
        [button setBackgroundImage:[UIImage imageNamed:@"12.icon_mine_about"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"12.icon_mine_draft"] forState:UIControlStateSelected];
        [_cell.contentView addSubview:button];
    }
}
-(void)typeButtonClick:(UIButton *)button{
    if (_tempButton1 == nil) {
        button.selected = YES;
        _tempButton1 = button;
    }else if (_tempButton1 != button && _tempButton1 != nil){
        _tempButton1.selected = NO;
        button.selected = YES;
        _tempButton1 = button;
    }
}
-(void)displacementButtonclick:(UIButton *)button{
    NSLog(@"123");
    if (_tempButton == nil) {
        button.selected = YES;
        _tempButton = button;
    }else if (_tempButton != button && _tempButton != nil){
        _tempButton.selected = NO;
        button.selected = YES;
        _tempButton = button;
    }

}
-(void)numberOfCylindersButtonclick:(UIButton *)button{
    
    if (_tempButton1 == nil) {
        button.selected = YES;
        _tempButton1 = button;
    }else if (_tempButton1 != button && _tempButton1 != nil){
        _tempButton1.selected = NO;
        button.selected = YES;
        _tempButton1 = button;
    }
}
-(void)coolingWayButtonclick:(UIButton *)button{
    
    if (_tempButton2 == nil) {
        button.selected = YES;
        _tempButton2 = button;
    }else if (_tempButton2 != button && _tempButton2 != nil){
        _tempButton2.selected = NO;
        button.selected = YES;
        _tempButton2 = button;
    }
}
-(void)oilSupplyWayButtonclick:(UIButton *)button{
    
    if (_tempButton3 == nil) {
        button.selected = YES;
        _tempButton3 = button;
    }else if (_tempButton3 != button && _tempButton3 != nil){
        _tempButton3.selected = NO;
        button.selected = YES;
        _tempButton3 = button;
    }
}
-(void)countryButtonclick:(UIButton *)button{
    
    if (_tempButton4 == nil) {
        button.selected = YES;
        _tempButton4 = button;
    }else if (_tempButton4 != button && _tempButton4 != nil){
        _tempButton4.selected = NO;
        button.selected = YES;
        _tempButton4 = button;
    }
}
-(void)yearButtonclick:(UIButton *)button{
    
    if (_tempButton5 == nil) {
        button.selected = YES;
        _tempButton5 = button;
    }else if (_tempButton5 != button && _tempButton5 != nil){
        _tempButton5.selected = NO;
        button.selected = YES;
        _tempButton5 = button;
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
