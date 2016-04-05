//
//  ViewController.m
//  SNCircleView
//
//  Created by bfec on 16/4/5.
//  Copyright © 2016年 LMC. All rights reserved.
//

#import "ViewController.h"
#import "SNCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //第三个参数 scale : 比例 0----1之间
    SNCircleView *circleView = [[SNCircleView alloc] initWithFrame:CGRectMake(100, 100, 200, 200) andScale:0.9 radius:100 withFillColor:[UIColor blueColor]];
    [self.view addSubview:circleView];
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
