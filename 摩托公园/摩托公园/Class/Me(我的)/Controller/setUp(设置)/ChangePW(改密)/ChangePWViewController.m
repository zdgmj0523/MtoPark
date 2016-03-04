//
//  ChangePWViewController.m
//  摩托公园
//
//  Created by Scott on 16/2/4.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "ChangePWViewController.h"

@interface ChangePWViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
@property(nonatomic,strong)UIView * bView;

@end

@implementation ChangePWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createButtonItem];
    
    [self createViewController];
    // Do any additional setup after loading the view from its nib.
}
-(void)createButtonItem{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"2.back_arrow"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(12, 0, 20, 21);
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
    
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"确定" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 32, 23);
    rightButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma mark 导航栏右侧按钮点击事件
-(void)rightButtonClick:(UIButton *)button{
    NSLog(@"点击了右侧按钮");
}
-(void)leftButtonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createViewController{
    _bView = [[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, 145)];
    //_bView.backgroundColor = [UIColor orangeColor];
    [self createPassWordLabel];
    [self createTextFiledView];
    
    [self.view addSubview:_bView];
}

-(void)createPassWordLabel{
    NSArray * pwArray = @[@"旧密码",@"新密码",@"确认新密码"];
    for (int i = 0; i < 3; i ++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(24,14 + 8 + (20 +28.5)*i, 70, 20)];
        NSLog(@"%f",_bView.frame.origin.y);
        label.text = pwArray[i];
        label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        [_bView addSubview:label];
    }
    
    for (int i = 0; i < 2; i ++) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(24, 48+(48+0.5)*i, WIDTH-24, 0.5)];
        view.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
        [_bView addSubview:view];
    }
}

//创建textFile
-(void)createTextFiledView{
    for (int i = 0; i < 3; i ++) {
        UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(119, 18.5+8+(14 + 32)*i, 200, 14)];
        textField.placeholder = @"如不需要修改，此处留空";
        //textFiled.borderStyle = UITextBorderStyleRoundedRect;
        textField.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
        //重新编辑消除文字
        textField.clearsOnBeginEditing = YES;
        //密文格式显示
        textField.secureTextEntry = YES;
        textField.delegate = self;
//        textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //键盘相应
        [textField becomeFirstResponder];
        textField.tag = 1000+i;
        [_bView addSubview:textField];
        //添加手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        [self.view addGestureRecognizer:tap];
        
    }
    //添加手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
}
-(void)tapClick{
    UITextField * textField =  (UITextField*)[self.view viewWithTag:1000];
    UITextField * textField2 = (UITextField*)[self.view viewWithTag:1001];
    UITextField * textField3 = (UITextField*)[self.view viewWithTag:1002];
    [textField  resignFirstResponder];
    [textField2 resignFirstResponder];
    [textField3 resignFirstResponder];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    UITextField * newPw = (UITextField *)[self.view viewWithTag:1001];
    NSLog(@"%@",newPw.text);
    NSLog(@"%ld",textField.tag);
    if (textField.tag == 1002) {
        if (![textField.text isEqualToString:newPw.text]) {
            UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"两次输入的密码不一致" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * leftAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                //在Block中可以做当取消按钮点击时触发的事件
               // NSLog(@"%@",leftAction.title);
            }];
            
            [alertController addAction:leftAction];
            
            UIAlertAction * rightAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                //在Block中可以做当确定按钮点击时触发的事件
               // NSLog(@"%@",rightAction.title);
                textField.text = nil;
                [textField becomeFirstResponder];
            }];
            
            [alertController addAction:rightAction];
            //显示
            [self presentViewController:alertController animated:YES completion:nil];

        }
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
