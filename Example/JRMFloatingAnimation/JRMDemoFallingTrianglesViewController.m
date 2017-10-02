//
//  JRMDemoFallingBalloonViewController.m
//  JRMFloatingAnimation_Example
//
//  Created by Christopher Corea on 9/27/17.
//  Copyright © 2017 Caroline Harrison. All rights reserved.
//

#import "JRMDemoFallingTrianglesViewController.h"
#import "JRMFloatingAnimationView.h"

@interface JRMDemoFallingTrianglesViewController ()

@property (strong, nonatomic) JRMFloatingAnimationView *floatingView;

@end

@implementation JRMDemoFallingTrianglesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createFloatingAnimation];
}

- (void)createFloatingAnimation {
    self.floatingView = [[JRMFloatingAnimationView alloc] initWithStartingPoint:CGPointMake(self.view.frame.size.width / 2, -100)];
    self.floatingView.objectsShouldSink = YES;
    self.floatingView.startingPointWidth = self.view.frame.size.width;
    self.floatingView.animationWidth = 100;
    self.floatingView.maxFloatObjectSize = 20;
    self.floatingView.minFloatObjectSize = 10;
    self.floatingView.animationDuration = 5;
    self.floatingView.maxAnimationHeight = self.view.frame.size.height + 100;
    self.floatingView.minAnimationHeight = self.floatingView.maxAnimationHeight;
    self.floatingView.removeOnCompletion = YES;
    
    [self.floatingView addImage:[UIImage imageNamed:@"redTriangle"]];
    [self.floatingView addImage:[UIImage imageNamed:@"greenTriangle"]];
    [self.floatingView addImage:[UIImage imageNamed:@"blueTriangle"]];
    [self.floatingView addImage:[UIImage imageNamed:@"purpleTriangle"]];
    
    [self.view addSubview:self.floatingView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.35 target:self selector:@selector(animate) userInfo:nil repeats:YES];
}

- (void)animate {
    [self.floatingView animate];
}

@end
