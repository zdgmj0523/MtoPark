//
//  AllCarTableViewCell.h
//  摩托公园
//
//  Created by Scott on 16/1/28.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *gradeNum;
@property (weak, nonatomic) IBOutlet UILabel *rankingNum;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;
@property (weak, nonatomic) IBOutlet UILabel *priceNum;

@end
