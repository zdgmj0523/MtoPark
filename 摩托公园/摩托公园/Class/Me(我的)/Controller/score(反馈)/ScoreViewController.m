//
//  ScoreViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/10.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()<UITextViewDelegate,UITextFieldDelegate>
@property(nonatomic,strong)UITextView * infoTextView;
@property(nonatomic,strong)UITextField * numTextField;
@property(nonatomic,strong)UILabel * label;
@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"反馈评分";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self createLeftButtonItem];
    [self createIofoTextView];
    [self createLabel];
    [self createNumTextField];
    [self createSureButton];
    
    // Do any additional setup after loading the view.
}
-(void)createSureButton{
    UIButton * SureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    SureButton.frame = CGRectMake(_numTextField.frame.origin.x, _numTextField.frame.origin.y+_numTextField.bounds.size.height+24, 320, 42);
    [SureButton setTitle:@"提交" forState:UIControlStateNormal];
    [SureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    SureButton.backgroundColor = [UIColor colorWithRed:211/255.0 green:47/255.0 blue:47/255.0 alpha:1];
    SureButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [SureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:SureButton];
}
-(void)sureButtonClick{
    NSLog(@"提交");
}
-(void)createNumTextField{
    _numTextField = [[UITextField alloc]initWithFrame:CGRectMake(27.5, _label.frame.origin.y+_label.bounds.size.height+4, 320, 42)];
    [_numTextField.layer setCornerRadius:5];
    UIColor * light = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1];
    _numTextField.layer.borderColor = light.CGColor;
    _numTextField.layer.borderWidth = 0.5;
    _numTextField.delegate = self;
    _numTextField.keyboardType = UIKeyboardTypeDefault;
    _numTextField.font = [UIFont systemFontOfSize:15];
    _numTextField.textColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    [self.view addSubview:_numTextField];
}
-(void)createLabel{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(28, _infoTextView.frame.origin.y+_infoTextView.bounds.size.height+12, 56, 20)];
    _label.text = @"联系方式";
    _label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    _label.textColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    [self.view addSubview:_label];
}

-(void)createLeftButtonItem{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"2.back_arrow"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(12, 0, 20, 21);
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
}
-(void)leftButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)createIofoTextView{
    
    _infoTextView = [[UITextView alloc]initWithFrame:CGRectMake(27.5, 64+44, 320, 123)];
    //_infoTextView.scrollEnabled = YES;
//    _infoTextView.backgroundColor = [UIColor yellowColor];
    [_infoTextView.layer setCornerRadius:5];
    UIColor * light = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1];
    _infoTextView.layer.borderColor = light.CGColor;
    _infoTextView.layer.borderWidth = 0.5;
    _infoTextView.delegate = self;
    _infoTextView.text = @"请输入反馈的内容...";
    _infoTextView.textColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1];
    [self.view addSubview:_infoTextView];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
}
-(void)tapClick{
    
    [_infoTextView  resignFirstResponder];
    [_numTextField resignFirstResponder];
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (textView == _infoTextView) {
        textView.textColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    }
    NSLog(@"开始编辑");
    _infoTextView.text = @"";
    _infoTextView.textColor = [UIColor blackColor];
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
