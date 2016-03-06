//
//  BrandTableViewCell.m
//  摩托公园
//
//  Created by Scott on 16/3/5.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "BrandTableViewCell.h"

@implementation BrandTableViewCell
-(void)loadbrandDataFromModel:(BrandModel *)model{
    if (model.thumb != nil) {
        [_imagView setImageWithURL:[NSURL URLWithString:baseUrl(model.thumb)]];
    }
    _titleLabel.text = model.brand_name;
}
- (void)awakeFromNib {
//        self.imagView.contentMode =  UIViewContentModeScaleAspectFit;
//        self.imagView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//        self.imagView.clipsToBounds  = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
