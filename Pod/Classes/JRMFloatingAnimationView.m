//
//  JRMFloatingAnimationView.m
//  JRMFloatingAnimation
//
//  Created by Caroline Harrison on 2/23/16.
//  Copyright © 2016 Caroline Harrison. All rights reserved.
//

#import "JRMFloatingAnimationView.h"
#import "JRMFloatingImageView.h"

@interface JRMFloatingAnimationView() <JRMFloatingImageViewDelegate>

@property (strong, nonatomic) NSMutableArray *images;
@property BOOL firstAnimation;
@property BOOL customWidth;

@end

@implementation JRMFloatingAnimationView

- (id)initWithStartingPoint:(CGPoint)startingPoint {
    self = [super init];
    if (self) {
        self.startingPoint = startingPoint;
        self.backgroundColor = [UIColor clearColor];
        self.images = [NSMutableArray new];
        self.floatingShape = JRMFloatingShapeStraight;
        self.objectsShouldSink = NO;
        self.maxFloatObjectSize = 20;
        self.minFloatObjectSize = 10;
        self.animationDuration = 2;
        self.firstAnimation = YES;
        self.customWidth = NO;
        self.maxAnimationHeight = self.startingPoint.y;
        self.minAnimationHeight = fabs(self.startingPoint.y * 1/3);
        self.removeOnCompletion = YES;
    }
    return self;
}

- (void)addImage:(UIImage *)image {
    [self.images addObject:image];
}

- (void)removeImages {
    [self.images removeAllObjects];
}

- (void)animate {
    
    if (self.firstAnimation) {
        if (self.animationWidth) {
            self.customWidth = YES;
        }
    }
    
    if (self.minFloatObjectSize > self.maxFloatObjectSize) {
        self.maxFloatObjectSize = self.minFloatObjectSize;
    }
    
    CGFloat size = [self randomFloatBetween:self.minFloatObjectSize and:self.maxFloatObjectSize];
    
    if (!self.customWidth) {
        switch (self.floatingShape) {
            case JRMFloatingShapeCurveLeft: {
                self.animationWidth = self.startingPoint.x;
            } break;
            case JRMFloatingShapeCurveRight: {

                self.animationWidth = self.superview.frame.size.width - self.startingPoint.x;
            } break;
            case JRMFloatingShapeTriangleUp: {
                self.animationWidth = self.superview.frame.size.width;
            } break;
            case JRMFloatingShapeStraight:
            default: {
                self.animationWidth = size * 2;
            } break;
        }
    }
    
    UIImage *image = [self.images objectAtIndex:[self randomIndex:[self.images count]]];
    
    JRMFloatingImageView *floatingImageView = [[JRMFloatingImageView alloc] initWithImage:image];
    
    if (self.varyAlpha) {
        floatingImageView.alpha = [self randomFloatBetween:.1 and:1];
    }
    
    if (self.startingPointWidth) {
        CGFloat w = [self randomFloatBetween:(self.startingPoint.x - (self.startingPointWidth / 2)) and:(self.startingPoint.x + (self.startingPointWidth / 2))];
        if (self.objectsShouldSink) {
            [floatingImageView setFrame:CGRectMake(w, self.startingPoint.y + (size / 2), size, size)];
        } else {
            [floatingImageView setFrame:CGRectMake(w, self.startingPoint.y - (size / 2), size, size)];
        }
    } else {
        if (self.objectsShouldSink) {
            [floatingImageView setFrame:CGRectMake(self.startingPoint.x, self.startingPoint.y + (size / 2), size, size)];
        } else {
            [floatingImageView setFrame:CGRectMake(self.startingPoint.x, self.startingPoint.y - (size / 2), size, size)];
        }
    }
    
    floatingImageView.delegate = self;
    
    [self addSubview:floatingImageView];
    [floatingImageView start];
    self.firstAnimation = NO;
}

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

- (NSUInteger)randomIndex:(NSUInteger)count {
    return arc4random() % count;
}

@end
