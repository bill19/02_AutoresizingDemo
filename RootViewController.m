//
//  RootViewController.m
//  uiscreenSize
//
//  Created by sunhao on 15-7-18.
//  Copyright (c) 2015年 SH. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    UIView * _viewRed;
    UIView * _viewBlue;//superView
    UIView * _viewOrigin;
    
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _viewRed = [[UIView alloc]init];
    _viewRed.frame = CGRectMake(20, 20,self.view.bounds.size.width - 40, 30);
    _viewRed.backgroundColor = [UIColor redColor];
    [self.view addSubview:_viewRed];
    _viewRed.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    _viewBlue = [[UIView alloc]init];
    _viewBlue.frame = CGRectMake(20, 80, self.view.bounds.size.width * 0.5 - 40, self.view.bounds.size.height - 180);
    _viewBlue.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_viewBlue];
//    _viewBlue.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    
    _viewOrigin = [[UIView alloc]init];
    _viewOrigin.frame = CGRectMake(20, 20, 100, 100);
    _viewOrigin.backgroundColor = [UIColor orangeColor];
    [_viewBlue addSubview:_viewOrigin];
    
    _viewOrigin.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(barBtnClicked)];
    self.navigationItem.rightBarButtonItem = barBtn;
    
    UIButton * textBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    textBtn.frame = CGRectMake(20, 300, 300, 30);
    [textBtn setTitle:@"蓝色View大小" forState:UIControlStateNormal];
    [textBtn addTarget:self action:@selector(testBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:textBtn];
    
    
}


-(void)testBtnClick{

    CGRect frameBlue = _viewBlue.frame;
    frameBlue.size.width += 5;
    frameBlue.size.height += 5;
    _viewBlue.frame = frameBlue;
    NSLog(@"%@",NSStringFromCGRect(_viewBlue.frame));
    
}

-(void)barBtnClicked{

    UIDevice * device = [UIDevice currentDevice];
    NSLog(@"设备方向 %tu",device.orientation);
    UIScreen * screen = [UIScreen mainScreen];
    NSLog(@"screen.bounds ++++  %@",NSStringFromCGRect(screen.bounds));
    
    
    NSLog(@"navigationBar.frame ---- %@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
    
    NSLog(@"navigationBar.bounds ---- %@",NSStringFromCGRect(self.navigationController.navigationBar.bounds));
    
    NSLog(@"blueSuper %@",NSStringFromCGRect(_viewBlue.frame));
    
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
