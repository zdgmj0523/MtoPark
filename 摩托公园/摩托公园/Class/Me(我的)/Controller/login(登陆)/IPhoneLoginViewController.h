//
//  IPhoneLoginViewController.h
//  摩托公园
//
//  Created by Scott on 16/2/27.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IPhoneLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *testingButton;
@property (weak, nonatomic) IBOutlet UITextField *iPhoneNum;
@property (weak, nonatomic) IBOutlet UITextField *testingNum;
- (IBAction)testingButton:(UIButton *)sender;
- (IBAction)userButton:(UIButton *)sender;
- (IBAction)loginButton:(UIButton *)sender;
- (IBAction)idLoginButton:(UIButton *)sender;

@end
