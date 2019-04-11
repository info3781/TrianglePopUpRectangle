//
//  LKTrianglePopUpRectangle.h
//  TrianglePopUpRectangle
//
//  Created by Info on 2019/4/11.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LKTriangleDirection) {
    LKTriangleDirectionUp = 0,      // 尖角朝上
    LKTriangleDirectionLeft,        // 尖角朝左
    LKTriangleDirectionBottom,      // 尖角朝下
    LKTriangleDirectionRight        // 尖角朝右
};

NS_ASSUME_NONNULL_BEGIN

@interface LKTrianglePopUpRectangle : UIView

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

@end

NS_ASSUME_NONNULL_END
