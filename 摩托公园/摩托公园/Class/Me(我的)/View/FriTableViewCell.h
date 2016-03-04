//
//  FriTableViewCell.h
//  摩托公园
//
//  Created by Scott on 16/3/3.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userGrade;
@property (weak, nonatomic) IBOutlet UILabel *userAttentionNum;
@property (weak, nonatomic) IBOutlet UILabel *userFansNum;

@end
