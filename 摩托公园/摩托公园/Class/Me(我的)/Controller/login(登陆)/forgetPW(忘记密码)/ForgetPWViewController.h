//
//  ForgetPWViewController.h
//  摩托公园
//
//  Created by Scott on 16/3/2.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetPWViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *iPhoneNum;
@property (weak, nonatomic) IBOutlet UITextField *testingNum;
- (IBAction)testingButtonClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *testingButton;

@end
