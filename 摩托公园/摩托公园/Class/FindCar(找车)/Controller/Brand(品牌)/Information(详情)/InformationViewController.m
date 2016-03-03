//
//  InformationViewController.m
//  摩托公园
//
//  Created by Scott on 16/1/28.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    
    [self createUI];
    // Do any additional setup after loading the view.
}
-(void)createUI{
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 114 ,self.view.bounds.size.width , 8)];
    lineView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    [self.view addSubview:lineView];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, lineView.frame.origin.y+20, 90, 60)];
    imageView.backgroundColor = [UIColor blueColor];
    imageView.image = [UIImage imageNamed:@"icon_hot"];
    imageView.contentMode =  UIViewContentModeCenter;
    [self.view addSubview:imageView];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, lineView.frame.origin.y+40, 200, 20)];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.text = @"阿普利亚/Aprilia";
    titleLabel.textColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    [self.view addSubview:titleLabel];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(130, titleLabel.frame.origin.y+20, 100, 14)];
    label.font = [UIFont systemFontOfSize:10];
    label.text = @"意大利";
    label.textColor = [UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1];
    [self.view addSubview:label];
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(4, imageView.frame.origin.y+60+12 ,self.view.bounds.size.width-4, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1];
    [self.view addSubview:line];
    
    UIView * redView = [[UIView alloc]initWithFrame:CGRectMake(0, line.frame.origin.y+0.5, 4, 42)];
    redView.backgroundColor = [UIColor colorWithRed:211/255.0 green:47/255.0 blue:47/255.0 alpha:1];
    [self.view addSubview:redView];
    
    UILabel * introLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, line.frame.origin.y+0.5+11, 28, 20)];
    introLabel.text = @"简介";
    introLabel.font = [UIFont systemFontOfSize:14];
    introLabel.textColor = [UIColor colorWithRed:158/255.0 green:158/255.0 blue:158/255.0 alpha:1];
    [self.view addSubview:introLabel];
    
    UILabel * infoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    infoLabel.numberOfLines = 0;
    NSString * str = @"Aprilia（阿普里亚） 是世界知名的意大利摩托车品牌，1962年诞生于的意大利威尼斯。诞生之初已生产自行车起步，于1975年正始开始生产摩托车，2000年意大利两家著名摩托车厂Laverda和Moto Guzzi加盟Aprilia，4年后Aprilia阿普里亚并入欧洲最大摩托车集团Piaggio。 ABS 系统保障轮胎在刹车踩到底与地面湿滑的情况下都能防止轮胎锁死。轮胎上的位置侦测系统（sistemi di rilevamento posti）”能立即测量轮胎的速度。当系统侦测到其中一个轮胎接近锁死的时候，系统就会启动。电子中控制会传信号给另一中控器，透过一个输液阀以增强或降低输液管线的压力，以期使轮胎恢复抓地力，也籍此防止轮胎锁死。这个方式可以使刹车在各种不同粗细的泊油路面上都能发挥最好的效果，使车辆稳定，驾驶人安全。";
    infoLabel.text = str;
    infoLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
    //infoLabel.backgroundColor = [UIColor lightGrayColor];
    infoLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    //关键语句
    CGRect labelRect = [str boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Light" size:14]} context:nil];
    infoLabel.frame = CGRectMake(20, line.frame.origin.y+42, self.view.bounds.size.width - 30, labelRect.size.height);
    infoLabel.textColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    [self.view addSubview:infoLabel];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
