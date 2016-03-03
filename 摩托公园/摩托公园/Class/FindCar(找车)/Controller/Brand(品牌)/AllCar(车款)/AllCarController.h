//
//  AllCarController.h
//  摩托公园
//
//  Created by Scott on 16/1/27.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol returnAllCarIDDelgate <NSObject>

-(void)receiveAllCarID:(NSString *)AllCarID;

@end

@interface AllCarController : UIViewController
@property(nonatomic,assign)id <returnAllCarIDDelgate>delegate;
@end
