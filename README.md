# TrianglePopUpRectangle

[![CI Status](https://img.shields.io/travis/info3781@gmail.com/TrianglePopUpRectangle.svg?style=flat)](https://travis-ci.org/info3781@gmail.com/TrianglePopUpRectangle)
[![Version](https://img.shields.io/cocoapods/v/TrianglePopUpRectangle.svg?style=flat)](https://cocoapods.org/pods/TrianglePopUpRectangle)
[![License](https://img.shields.io/cocoapods/l/TrianglePopUpRectangle.svg?style=flat)](https://cocoapods.org/pods/TrianglePopUpRectangle)
[![Platform](https://img.shields.io/cocoapods/p/TrianglePopUpRectangle.svg?style=flat)](https://cocoapods.org/pods/TrianglePopUpRectangle)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TrianglePopUpRectangle is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TrianglePopUpRectangle'
```

## Function Declaration
TrianglePopUpRectangle 实现了矩形尖角样式，类似回复
![eg](https://github.com/info3781/TrianglePopUpRectangle/blob/master/trianglepopup.png?raw=true)

调用方式如下
```
LKTrianglePopUpRectangle *trianglePopUpRectangleView = [[LKTrianglePopUpRectangle alloc] initWithFrame:CGRectMake(15, 100, [UIScreen mainScreen].bounds.size.width - 30, 10)];
[self.view addSubview:trianglePopUpRectangleView];

开放的属性如下
@property (nonatomic, assign) BOOL isOutward;                   // true:尖角朝外，false:尖角朝内 默认true

@property (nonatomic, assign) LKTriangleDirection direction;    // 尖角朝向-默认LKTriangleDirectionUp
@property (nonatomic, strong) UIColor *fillColor;               // 填充色-默认#F5F5F5
@property (nonatomic, strong) UIColor *strokeColor;             // 绘制颜色-默认不设置
@property (nonatomic, assign) CGFloat lineWidth;                // 线条宽度-默认不设置

@property (nonatomic, assign) CGFloat triangleHeight;           // 尖角高度-默认10
@property (nonatomic, assign) CGFloat triangleWidth;            // 尖角宽度-默认25
@property (nonatomic, assign) CGFloat triangleOriginSpace;      // 尖角起始点距离绘制源点的距离-默认27

@property (nonatomic, assign) CGFloat radius;                   // Rectangle's radius default 0 UIRectCornerAllCorners's radius is equal
@property (nonatomic, assign) UIRectCorner corners;             // default UIRectCornerAllCorners
```

## Author

info3781@gmail.com

## License

TrianglePopUpRectangle is available under the MIT license. See the LICENSE file for more info.
