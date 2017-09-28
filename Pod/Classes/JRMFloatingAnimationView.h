//
//  JRMFloatingAnimationView.h
//  JRMFloatingAnimation
//
//  Created by Caroline Harrison on 2/23/16.
//  Copyright © 2016 Caroline Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JRMFloatingShape) {
    JRMFloatingShapeTriangleUp,
    JRMFloatingShapeStraight,
    JRMFloatingShapeCurveLeft,
    JRMFloatingShapeCurveRight
};

@interface JRMFloatingAnimationView : UIView
/**
 *  Starting point for the floating objects.
 *  MUST be set.
 */
@property CGPoint startingPoint;
/**
 *  Varies the x of the starting point,
 *  with the starting point y being the middle.
 *  Default is 0.
 */
@property CGFloat startingPointWidth;
/**
 * Reverses the floating animation so that objects appear to fall (sink) rather than float.
 * Default is false.
 */
@property BOOL objectsShouldSink;
/**
 *  The MAXIMUM height that the animation may go.
 *  Default is the distance from the top of the frame to the starting point y value.
 */
@property CGFloat maxAnimationHeight;
/**
 *  The minimum height that the animation may go.
 *  If this is larger than the maxAnimationHeight, they will swap.
 *  Default max height * 1/3.
 */
@property CGFloat minAnimationHeight;
/**
 *  The MAXIMUM "width" of the bezier path's control points from the object's starting point.
 *  Changing this may give you unexpected results.
 *  Default for JRMFloatingShape: the objects size * 2.
 *  Default for JRMFloatingShapeCurveLeft: The distance between the starting point x and the left edge of the frame
 *  Default for JRMFloatingShapeCurveRight: The distance between the starting point x and the right edge of the frame
 *  Default for JRMFloatingShapeTriangleUp: The width of the frame.
 */
@property CGFloat animationWidth;
/**
 *  Gives the impression of the images "popping" 
 *  before they are removed from the view.
 *  Default NO.
 */
@property BOOL pop;
/**
 *  The maximum size a floating object can be.
 *  Default is 20.
 */
@property CGFloat maxFloatObjectSize;
/**
 *  The minimum size a floating object can be.
 *  If the minFloatObjectSize < maxFloatObjectSize, both sizes become the minFloatObjectSize.
 *  Default is 10.
 */
@property CGFloat minFloatObjectSize;
/**
 *  The "shape" that the animation can take.
 *  Default is JRMFloatingShapeStraight.
 */
@property JRMFloatingShape floatingShape;
/**
 *  If the floating object's alpha should fade out before disappearing from the view.
 *  Default NO.
 */
@property BOOL fadeOut;
/**
 *  If the floating object's alphas should vary (to give a more randomized look).
 *  Default NO.
 */
@property BOOL varyAlpha;
/**
 *  The speed of the animation.
 *  Default 2.
 */
@property CFTimeInterval animationDuration;
/**
 *  If the floating object should be removed from superview when the animation is finished.
 *  Default YES.
 */
@property BOOL removeOnCompletion;
/**
 *  Completion block that will be called whenever an image's animation completes.
 *
 */
@property (strong, nonatomic) void (^imageViewAnimationCompleted)(UIImageView *);

/**
 *  Must init the animation with a starting point, or you may experience unintended behavior.
 */
- (id)initWithStartingPoint:(CGPoint)startingPoint;
/** 
 *  The images that make up the floating objects.
 *  At least one SQUARE image must be added.
 */
- (void)addImage:(UIImage *)image;
/**
 *  Removes all images.
 */
- (void)removeAllImages;

/**
 *  "Release" a floating object.
 */
- (void)animate;


@end
