//
//  JRMFloatingImageView.h
//  JRMFloatingAnimation
//
//  Created by Caroline Harrison on 2/23/16.
//  Copyright © 2016 Caroline Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRMFloatingAnimationView.h"

@protocol JRMFloatingImageViewDelegate;

@interface JRMFloatingImageView : UIImageView <CAAnimationDelegate>

@property (nonatomic, weak) JRMFloatingAnimationView *delegate;

- (void)start;

@end

@protocol JRMFloatingImageViewDelegate <NSObject>

@end
