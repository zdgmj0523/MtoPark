//
//  BrandTableViewCell.h
//  摩托公园
//
//  Created by Scott on 16/3/5.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrandModel.h"
@interface BrandTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
-(void)loadbrandDataFromModel:(BrandModel *)model;
@end
