# JRMFloatingAnimation

[![CI Status](http://img.shields.io/travis/Caroline Harrison/JRMFloatingAnimation.svg?style=flat)](https://travis-ci.org/Caroline Harrison/JRMFloatingAnimation)
[![Version](https://img.shields.io/cocoapods/v/JRMFloatingAnimation.svg?style=flat)](http://cocoapods.org/pods/JRMFloatingAnimation)
[![License](https://img.shields.io/cocoapods/l/JRMFloatingAnimation.svg?style=flat)](http://cocoapods.org/pods/JRMFloatingAnimation)
[![Platform](https://img.shields.io/cocoapods/p/JRMFloatingAnimation.svg?style=flat)](http://cocoapods.org/pods/JRMFloatingAnimation)

## About

JRMFloatingAnimation is an ObjC library used to create floating image views:

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

To create the animation view:

	self.floatingView = [[JRMFloatingAnimationView alloc] initWithStartingPoint:self.view.center];
	[self.floatingView addImage:[UIImage imageName:@"myImage"];
	[self.view addSubview:self.floatingView];

To animate the view:

	[self.floatingView animate];

There are a variety of different settings you can add to your animation view.

* `startingPointWidth` - Varies the x of the starting point, with the starting point y being the middle. default is 0.
* `maxAnimationHeight` - The maximum height that the animation may go. Default is the distance from the top of the frame to the starting point y value.
* `minAnimationHeight` - The minimum height that the animation may go. If this is larger than the maxAnimationHeight, they will swap. Default is 1/3 the maxAnimationHeight .
* `animationWidth` - The maximum "width" of the bezier path's control points fro the object's starting point. Changing this may give you unexpected results. Defaults: 
	* `JRMFloatingShape`: The object's size * 2.
	* `JRMFloatingShapeCurveLeft`: The distance between the starting point x and the let edge of the frame.
	* `JRMFloatingShapeCurveRight`: The distance between the starting point x and the right edge of the frame.
	* `JRMFloatingShapeTriangleUp`: The width of the frame.
* `pop`: Gives the impression of the images "popping" before they are removed from the view. Default NO.
* `maxFloatObjectSize`: The maximum size a floating object can be. Default is 20.
* `minFloatObjectSize`: The minimum size a floating object can be. If the minFloatObjectSize < maxFloatObjectSize, both sizes become the minFloatObjectSize. Default is 10.


## Installation

JRMFloatingAnimation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JRMFloatingAnimation"
```

In your code 

## Author

Caroline Harrison, caroline@jackrabbitmobile.com

## License

JRMFloatingAnimation is available under the MIT license. See the LICENSE file for more info.
