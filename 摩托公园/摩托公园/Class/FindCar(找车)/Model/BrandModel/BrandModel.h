//
//  BrandModel.h
//  摩托公园
//
//  Created by Scott on 16/3/5.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandModel : NSObject

@property (nonatomic,copy) NSString * brand_id;

@property (nonatomic,copy) NSString * brand_name;

@property (nonatomic,copy) NSString * first_letter;

@property (nonatomic,copy) NSString * thumb;

@property (nonatomic,copy) NSString * descr;

@property(nonatomic,assign)int * zt;

@property(nonatomic,assign)int * elite;

@end
