//
//  SNCircleView.m
//  TestBySunny
//
//  Created by bfec on 16/4/1.
//  Copyright © 2016年 LMC. All rights reserved.
//

#import "SNCircleView.h"

@implementation SNCircleView

- (id)initWithFrame:(CGRect)frame andScale:(CGFloat)scale radius:(CGFloat)radius withFillColor:(UIColor *)fillColor
{
    if (self = [super initWithFrame:frame])
    {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = radius;
        [self commitInitWithandScale:scale radius:radius withFillColor:fillColor];
    }
    return self;
}

- (void)commitInitWithandScale:(CGFloat)scale radius:(CGFloat)radius withFillColor:(UIColor *)fillColor
{
    //半圆
    UIBezierPath *_bezierpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.origin.x + self.bounds.size.width * 0.5,
                                                                                  self.bounds.origin.y + self.bounds.size.height * 0.5)
                                                             radius:radius
                                                         startAngle:0
                                                           endAngle:2 * M_PI * 0.5
                                                          clockwise:NO];
    [_bezierpath closePath];
    
    CAShapeLayer *_shapeLayer = [CAShapeLayer layer];
    _shapeLayer.strokeColor = [UIColor darkGrayColor].CGColor;
    _shapeLayer.fillColor=[UIColor whiteColor].CGColor;
    _shapeLayer.path = _bezierpath.CGPath;
    [self.layer addSublayer:_shapeLayer];
    
    
    //填充
    UIBezierPath *_bezierpath1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.origin.x + self.bounds.size.width * 0.5,
                                                                                   self.bounds.origin.y + self.bounds.size.height * 0.5)
                                                                radius:radius
                                                            startAngle:M_PI
                                                              endAngle:M_PI + scale * M_PI
                                                             clockwise:YES];
//    [_bezierpath1 addLineToPoint:CGPointMake(self.bounds.origin.x + self.bounds.size.width * 0.5,
//                                             self.bounds.origin.y + self.bounds.size.height * 0.5)];
//    [_bezierpath1 closePath];
    
    CAShapeLayer *_shapeLayer1 = [CAShapeLayer layer];
    _shapeLayer1.lineWidth = radius * 4;
    _shapeLayer1.strokeColor = [UIColor blueColor].CGColor;
    _shapeLayer1.fillColor = [UIColor whiteColor].CGColor;
    _shapeLayer1.path = _bezierpath1.CGPath;
    
    
    
    //添加动画
    CABasicAnimation * fillAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    fillAnimation.duration = 2.0;
    fillAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    fillAnimation.fillMode = kCAFillModeForwards;
    fillAnimation.removedOnCompletion = NO;
    fillAnimation.fromValue = @(0.f);
    fillAnimation.toValue = @(1.0f);
    [_shapeLayer1 addAnimation:fillAnimation forKey:@""];
    
    
    
    [self.layer addSublayer:_shapeLayer1];
    
    
    
    //添加遮罩
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height * 0.5, self.bounds.size.width, self.bounds.size.height * 0.5)];
    maskView.backgroundColor = [UIColor whiteColor];
    [self addSubview:maskView];
    
    
    
    
    
    
    
    
}










@end
