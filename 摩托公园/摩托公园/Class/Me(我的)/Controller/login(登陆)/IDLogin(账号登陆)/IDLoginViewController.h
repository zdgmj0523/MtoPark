//
//  IDLoginViewController.h
//  摩托公园
//
//  Created by Scott on 16/2/28.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForgetPWViewController.h"
@interface IDLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;
- (IBAction)loginButton:(UIButton *)sender;
- (IBAction)forgetPwButton:(UIButton *)sender;
- (IBAction)qqLoginButtonClick:(UIButton *)sender;
- (IBAction)sinaLoginButtonClick:(UIButton *)sender;
- (IBAction)userLoginButtonClick:(UIButton *)sender;

@end
