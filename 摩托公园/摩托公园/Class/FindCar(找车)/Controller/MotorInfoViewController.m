//
//  MotorInfoViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/25.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "MotorInfoViewController.h"


@interface MotorInfoViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,assign)NSInteger num;

@property (nonatomic,assign)NSInteger kWidth;
@property (nonatomic,assign)NSInteger kHeight;
@property (nonatomic,strong)UIView * backGroundView;
@property (nonatomic,strong)UIView * backView;
@property (nonatomic,strong)UITextView * textView;

@end

@implementation MotorInfoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"阿里普雅";
    //创建导航栏
    [self createLeftButtonItem];
    [self createRightButtonItem];
    
    [self createControllerView];
    
    [self createEvaluateView];
    
    
    
    // Do any additional setup after loading the view.
}

-(void)createLeftButtonItem{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"2.back_arrow"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(12, 0, 20, 21);
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
}
//左侧导航栏按钮点击事件
-(void)leftButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
//右侧导航栏按钮点击事件
-(void)createRightButtonItem{
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"12.jcon_mine_favorite"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(12, 0, 20, 21);
    [rightButton addTarget:self action:@selector(searchButtonClic) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = item;
}
#pragma mark 搜索按钮的点击方法
-(void)searchButtonClic{
    NSLog(@"收藏");
}
//-(UILabel *)createTitleLabel{
//    UILabel * titlelabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-200)/2, 30, 200, 22.5)];
//    titlelabel.text = @"阿普利亚";
//    titlelabel.font = [UIFont systemFontOfSize:16];
//    titlelabel.textAlignment = NSTextAlignmentCenter;
//    return titlelabel;
//}
-(void)createButtonItem:(UIButton *)button x:(int)x y:(int)y imageName:(NSString*)imageName{
    button.frame = CGRectMake(x, y, 22, 22);
    [button setImage:[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
}

-(void)createControllerView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    if (_num == 0) {
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [self createInformationButton];
    }

    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = [self createHeaderView];
    
}
-(UIButton *)createInformationButton{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, WIDTH, 44);
    [button setTitle:@"查看详细参数" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(infoButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    return button;
}
-(void)infoButtonClick:(UIButton *)button{
    NSLog(@"查看详细参数");
}
-(UIView *)createHeaderView{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 387)];
    headView.tag = 70;
    headView.backgroundColor = [UIColor whiteColor];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 250)];
    imageView.image = [UIImage imageNamed:@""];
    imageView.backgroundColor = [UIColor greenColor];
    [headView addSubview:imageView];
    
    UILabel * imageNum = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-10-30, 12, 30, 17)];
    imageNum.text = @"18 图";
    imageNum.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    imageNum.textColor = [UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1];
    [headView addSubview:imageNum];
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 250, WIDTH, 0.5)];
    lineView.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1];
    [headView addSubview:lineView];
    
    UILabel * priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 266, 140, 28)];
    priceLabel.text = [NSString stringWithFormat:@"￥%d",298000];
    priceLabel.font = [UIFont fontWithName:@"DINAlternate-Bold" size:24];
    [headView addSubview:priceLabel];
    
    UIButton * evaluateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    evaluateButton.frame = CGRectMake(WIDTH-80-10, 303, 80, 28);
    [evaluateButton setTitle:@"我要评分" forState:UIControlStateNormal];
    evaluateButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    [evaluateButton setTitleColor:[UIColor colorWithRed:211/255.0 green:47/255.0 blue:47/255.0 alpha:1] forState:UIControlStateNormal];
    [evaluateButton addTarget:self action:@selector(evaluateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    evaluateButton.layer.borderWidth = 1.0;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    evaluateButton.layer.borderColor = CGColorCreate(colorSpace,(CGFloat[]){ 211/255.0, 47/255.0, 47/255.0, 1 });;
    [headView addSubview:evaluateButton];
    
    UILabel * gradeLabel = [[UILabel alloc]initWithFrame:CGRectMake(253, 268, 24, 15)];
    gradeLabel.text = @"3.14";
    gradeLabel.font = [UIFont systemFontOfSize:12];
    [headView addSubview:gradeLabel];
    
    UILabel * graLabel = [[UILabel alloc]initWithFrame:CGRectMake(279, 268, 10, 15)];
    graLabel.text = @"分";
    graLabel.font = [UIFont systemFontOfSize:10];
    graLabel.textColor = [UIColor colorWithRed:114/255.0 green:114/255.0 blue:114/255.0 alpha:1];
    [headView addSubview:graLabel];
    
    for (int i = 0; i < 5; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake((WIDTH-10-68)+(12+2)*i, 270, 12, 12)];
        imageView.image = [UIImage imageNamed:@"12.jcon_mine_favorite"];
        [headView addSubview:imageView];
    }
    
    UIView * linView = [[UIView alloc]initWithFrame:CGRectMake(0, 343, WIDTH, 8)];
    linView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [headView addSubview:linView];
    
    NSArray * buttonTitileArr = @[@"基本参数",@"车友点评"];
    for (NSInteger j=0; j < 2; j++) {
        UIButton * chooseBut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        chooseBut.tag = 300 + j;
        chooseBut.frame = CGRectMake(20+(48+20)*j, 350, 48, 34);
        [chooseBut setTitle:buttonTitileArr[j] forState:UIControlStateNormal];
        [chooseBut setTitleColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1] forState:UIControlStateNormal];
        [chooseBut setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        chooseBut.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        [chooseBut addTarget:self action:@selector(chooseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:chooseBut];
    }
    UIButton * button = (UIButton *)[headView viewWithTag:300];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    UIView * lView = [[UIView alloc]initWithFrame:CGRectMake(0, 386, WIDTH, 0.5)];
    lView.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1];
    [headView addSubview:lView];
    
    
    return headView;
}
-(void)chooseButtonClick:(UIButton *)button{
    if (button.tag == 300) {
        _num = 0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [self createInformationButton];
        
        UIButton * otherButton = (UIButton *)[_tableView viewWithTag:301];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [otherButton setTitleColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1] forState:UIControlStateNormal];
    }else{
        _num = 1;
        _tableView.tableFooterView = nil;
        
        UIButton * otherButton = (UIButton *)[_tableView viewWithTag:300];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [otherButton setTitleColor:[UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1] forState:UIControlStateNormal];
    }
    [_tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_num == 0) {
        return 4;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_num == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        if (indexPath.row%2 == 0) {
            cell.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]init];
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

//我要评分按钮点击事件
-(void)evaluateButtonClick:(UIButton *)button{
    NSLog(@"评论");
    [UIView animateWithDuration:0.2 animations:^{
        _backView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    }];
    //键盘的响应
    [_textView becomeFirstResponder];
    self.navigationController.navigationBar.alpha = 0.5;
}
#pragma mark 创建点评视图
-(void)createEvaluateView{
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT, WIDTH, HEIGHT)];
    _backView.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.5];
    
    [self.view addSubview:_backView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getKeyBoardRect:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    //监听键盘收起通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ketBoardWillHideNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    _backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0,HEIGHT-264-_kHeight,WIDTH, 264)];
    _backGroundView.backgroundColor = [UIColor whiteColor];
    
    [self createHeadButtonLabel];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(24, 174,WIDTH-24-24, 66)];
    UIColor * light = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1];
    _textView.layer.borderColor = light.CGColor;
    _textView.layer.borderWidth = 0.5;
    _textView.delegate = self;
    
    _textView.keyboardType = UIKeyboardTypeDefault;
    _textView.font = [UIFont systemFontOfSize:15];
    _textView.textColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    [_backGroundView addSubview:_textView];
    [_backView addSubview:_backGroundView];
}
//获取键盘的高度
-(void)getKeyBoardRect:(NSNotification *)aNotification{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    _kHeight = keyboardRect.size.height;
    _kWidth = keyboardRect.size.width;
    _backGroundView.frame = CGRectMake(0,HEIGHT-264-_kHeight,self.view.bounds.size.width, 264);
}
//监听键盘收起
-(void)ketBoardWillHideNotification:(NSNotification *)noti{
    [UIView animateWithDuration:0.2 animations:^{
        _backGroundView.frame = CGRectMake(0, HEIGHT-264, WIDTH, HEIGHT);
    }];
}
-(void)createHeadButtonLabel{
    //取消按钮
    UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(24, 16, 28, 20);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
//    cancelButton.backgroundColor = [UIColor redColor];
    [cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_backGroundView addSubview:cancelButton];
    
    //点评label
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 32, 23)];
    CGPoint center = _backView.center;
    CGPoint labelcen = label.center;
    CGFloat x = center.x;
    labelcen.x = x;
    label.center = labelcen;
    label.text = @"评价";
    label.font = [UIFont boldSystemFontOfSize:16];
    [_backGroundView addSubview:label];
    
    UIButton * sendlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sendlButton.frame = CGRectMake(WIDTH-24-28, 16, 28, 20);
    [sendlButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendlButton setTitleColor:[UIColor colorWithRed:211/255.0 green:47/255.0 blue:47/255.0 alpha:1] forState:UIControlStateNormal];
    sendlButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    //    cancelButton.backgroundColor = [UIColor redColor];
    [sendlButton addTarget:self action:@selector(sendlButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_backGroundView addSubview:sendlButton];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    //添加手势
    [_backView addGestureRecognizer:singleTap];
}
-(void)cancelButtonClick:(UIButton *)button{
    [UIView animateWithDuration:0.2 animations:^{
        _backView.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    }];
    _textView.text = nil;
    //收回键盘
    [_textView resignFirstResponder];
    self.navigationController.navigationBar.alpha = 1;
}
-(void)sendlButtonClick:(UIButton *)button{
    NSLog(@"发送");
    [UIView animateWithDuration:0.2 animations:^{
        _backView.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    }];
    _textView.text = nil;
    [_textView resignFirstResponder];
    self.navigationController.navigationBar.alpha = 1;
}
//手势的方法
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer

{
    [UIView animateWithDuration:0.2 animations:^{
        _backView.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
    }];
    _textView.text = nil;
    [_textView resignFirstResponder];
    self.navigationController.navigationBar.alpha = 1;
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
