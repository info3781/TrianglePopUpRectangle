//
//  LKTrianglePopUpRectangle.m
//  TrianglePopUpRectangle
//
//  Created by Info on 2019/4/11.
//

#import "LKTrianglePopUpRectangle.h"
#import "UIColor+LKAdd.h"

@interface LKTrianglePopUpRectangle()
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@end

@implementation LKTrianglePopUpRectangle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _isOutward = YES;
        _direction = LKTriangleDirectionUp;
        _fillColor = [UIColor colorWithHexString:@"#F5F5F5"];
        _triangleHeight = 10.f;
        _triangleWidth = 25.f;
        _triangleOriginSpace = 27.f;
        
        _radius = 0.f;
        _corners = UIRectCornerAllCorners;
        
        [self.layer addSublayer:self.shapeLayer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.shapeLayer.path = [self drawTrianglePopUpPath].CGPath;
}

#pragma mark - private methods
- (UIBezierPath *)drawTrianglePopUpPath {
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.bounds);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    switch (self.direction) {
        case LKTriangleDirectionUp:
            NSAssert(self.triangleOriginSpace + self.triangleWidth <= viewWidth, @"should not larger than view width");
            NSAssert(self.radius < viewWidth && self.radius < viewHeight, @"should not larger than view width and height");
            
            if (self.isOutward) {
                if (self.corners & UIRectCornerTopLeft) {
                    CGFloat radius = self.radius < self.triangleOriginSpace ? self.radius : self.triangleOriginSpace;
                    CGPoint startPoint = CGPointMake(0, self.triangleHeight + radius);
                    
                    [path moveToPoint:startPoint];
                    [path addArcWithCenter:CGPointMake(radius, radius + self.triangleHeight) radius:radius startAngle:2 * M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
                } else {
                    [path moveToPoint:CGPointMake(0, self.triangleHeight)];
                }
                
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace, self.triangleHeight)];
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace + self.triangleWidth / 2, 0)];
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace + self.triangleWidth, self.triangleHeight)];
                
                if (self.corners & UIRectCornerTopRight) {
                    CGFloat cornerSpace = viewWidth - self.triangleOriginSpace - self.triangleWidth;
                    CGFloat radius = cornerSpace > self.radius ? self.radius : cornerSpace;
                    [path addArcWithCenter:CGPointMake(viewWidth - radius, radius + self.triangleHeight) radius:radius startAngle:3 * M_PI_2 endAngle:4 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, self.triangleHeight)];
                }
                
                if (self.corners & UIRectCornerBottomRight) {
                    [path addArcWithCenter:CGPointMake(viewWidth - self.radius, viewHeight - self.radius) radius:self.radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
                }
                
                if (self.corners & UIRectCornerBottomLeft) {
                    [path addArcWithCenter:CGPointMake(self.radius, viewHeight - self.radius) radius:self.radius startAngle:M_PI_2 endAngle:2 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(0, viewHeight)];
                }
                
                [path closePath];
            } else {
                if (self.corners & UIRectCornerTopLeft) {
                    CGFloat radius = self.radius < self.triangleOriginSpace ? self.radius : self.triangleOriginSpace;
                    CGPoint startPoint = CGPointMake(0, radius);
                    [path moveToPoint:startPoint];
                    [path addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:2 * M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
                } else {
                    [path moveToPoint:CGPointZero];
                }
                
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace, 0)];
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace + self.triangleWidth / 2, self.triangleHeight)];
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace + self.triangleWidth, 0)];
                
                if (self.corners & UIRectCornerTopRight) {
                    CGFloat cornerSpace = viewWidth - self.triangleOriginSpace - self.triangleWidth;
                    CGFloat radius = cornerSpace > self.radius ? self.radius : cornerSpace;
                    [path addArcWithCenter:CGPointMake(viewWidth - radius, radius) radius:radius startAngle:3 * M_PI_2 endAngle:4 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, 0)];
                }
                
                if (self.corners & UIRectCornerBottomRight) {
                    [path addArcWithCenter:CGPointMake(viewWidth - self.radius, viewHeight - self.radius) radius:self.radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
                }
                
                if (self.corners & UIRectCornerBottomLeft) {
                    [path addArcWithCenter:CGPointMake(self.radius, viewHeight - self.radius) radius:self.radius startAngle:M_PI_2 endAngle:2 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(0, viewHeight)];
                }
                
                [path closePath];
            }
            break;
        case LKTriangleDirectionLeft:
            
            NSAssert(self.triangleOriginSpace + self.triangleWidth <= viewHeight, @"should not larger than view height");
            NSAssert(self.radius < viewWidth && self.radius < viewHeight, @"should not larger than view width and height");
            
            if (self.isOutward) {
                if (self.corners & UIRectCornerTopLeft) {
                    
                    CGFloat radius = self.radius < self.triangleOriginSpace ? self.radius : self.triangleOriginSpace;
                    CGPoint startPoint = CGPointMake(self.triangleHeight, radius);
                    
                    [path moveToPoint:startPoint];
                    [path addArcWithCenter:CGPointMake(self.triangleHeight + radius, radius) radius:radius startAngle:2 * M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
                } else {
                    [path moveToPoint:CGPointMake(self.triangleHeight, 0)];
                }
                
                if (self.corners & UIRectCornerTopRight) {
                    [path addArcWithCenter:CGPointMake(viewWidth - self.radius, self.radius) radius:self.radius startAngle:3 * M_PI_2 endAngle:4 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, 0)];
                }
                
                if (self.corners & UIRectCornerBottomRight) {
                    [path addArcWithCenter:CGPointMake(viewWidth - self.radius, viewHeight - self.radius) radius:self.radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
                }
                
                if (self.corners & UIRectCornerBottomLeft) {
                    CGFloat cornerSpace = viewHeight - self.triangleOriginSpace - self.triangleWidth;
                    CGFloat radius = cornerSpace > self.radius ? self.radius : cornerSpace;
                    [path addArcWithCenter:CGPointMake(radius + self.triangleHeight, viewHeight - radius) radius:radius startAngle:M_PI_2 endAngle:2 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(self.triangleHeight, viewHeight)];
                }
                
                [path addLineToPoint:CGPointMake(self.triangleHeight, self.triangleOriginSpace + self.triangleWidth)];
                [path addLineToPoint:CGPointMake(0, self.triangleOriginSpace + self.triangleWidth / 2)];
                [path addLineToPoint:CGPointMake(self.triangleHeight, self.triangleOriginSpace)];
                
                [path closePath];
                
            } else {
                if (self.corners & UIRectCornerTopLeft) {
                    
                    CGFloat radius = self.radius < self.triangleOriginSpace ? self.radius : self.triangleOriginSpace;
                    CGPoint startPoint = CGPointMake(0, radius);
                    
                    [path moveToPoint:startPoint];
                    [path addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:2 * M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
                } else {
                    [path moveToPoint:CGPointZero];
                }
                
                if (self.corners & UIRectCornerTopRight) {
                    [path addArcWithCenter:CGPointMake(viewWidth - self.radius, self.radius) radius:self.radius startAngle:3 * M_PI_2 endAngle:4 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, 0)];
                }
                
                if (self.corners & UIRectCornerBottomRight) {
                    [path addArcWithCenter:CGPointMake(viewWidth - self.radius, viewHeight - self.radius) radius:self.radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
                }
                
                if (self.corners & UIRectCornerBottomLeft) {
                    CGFloat cornerSpace = viewHeight - self.triangleOriginSpace - self.triangleWidth;
                    CGFloat radius = cornerSpace > self.radius ? self.radius : cornerSpace;
                    
                    [path addArcWithCenter:CGPointMake(radius, viewHeight - radius) radius:radius startAngle:M_PI_2 endAngle:2 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(0, viewHeight)];
                }
                
                [path addLineToPoint:CGPointMake(0, self.triangleOriginSpace + self.triangleWidth)];
                [path addLineToPoint:CGPointMake(self.triangleHeight, self.triangleOriginSpace + self.triangleWidth / 2)];
                [path addLineToPoint:CGPointMake(0, self.triangleOriginSpace)];
                
                [path closePath];
            }
            
            break;
        case LKTriangleDirectionBottom:
            
            NSAssert(self.triangleOriginSpace + self.triangleWidth <= viewWidth, @"should not larger than view width");
            NSAssert(self.radius < viewWidth && self.radius < viewHeight, @"should not larger than view width and height");
            
            if (self.isOutward) {
                if (self.corners & UIRectCornerTopLeft) {
                    [path moveToPoint:CGPointMake(0, self.radius)];
                    [path addArcWithCenter:CGPointMake(self.radius, self.radius) radius:self.radius startAngle:2 * M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
                } else {
                    [path moveToPoint:CGPointMake(0, 0)];
                }
                
                if (self.corners & UIRectCornerTopRight) {
                    [path addArcWithCenter:CGPointMake(viewWidth - self.radius, self.radius) radius:self.radius startAngle:3 * M_PI_2 endAngle:4 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, 0)];
                }
                
                if (self.corners & UIRectCornerBottomRight) {
                    
                    CGFloat cornerSpace = viewWidth - self.triangleOriginSpace - self.triangleWidth;
                    CGFloat radius = cornerSpace > self.radius ? self.radius : cornerSpace;
                    
                    [path addArcWithCenter:CGPointMake(viewWidth - radius, viewHeight - self.triangleHeight - radius) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, viewHeight - self.triangleHeight)];
                }
                
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace + self.triangleWidth, viewHeight - self.triangleHeight)];
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace + self.triangleWidth / 2, viewHeight)];
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace, viewHeight - self.triangleHeight)];
                
                if (self.corners & UIRectCornerBottomLeft) {
                    CGFloat radius = self.triangleOriginSpace > self.radius ? self.radius : self.triangleOriginSpace;
                    
                    [path addArcWithCenter:CGPointMake(radius, viewHeight - self.triangleHeight - radius) radius:radius startAngle:M_PI_2 endAngle:2 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(0, viewHeight - self.triangleHeight)];
                }
                
                [path closePath];
            } else {
                if (self.corners & UIRectCornerTopLeft) {
                    [path moveToPoint:CGPointMake(0, self.radius)];
                    [path addArcWithCenter:CGPointMake(self.radius, self.radius) radius:self.radius startAngle:2 * M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
                } else {
                    [path moveToPoint:CGPointMake(0, 0)];
                }
                
                if (self.corners & UIRectCornerTopRight) {
                    [path addArcWithCenter:CGPointMake(viewWidth - self.radius, self.radius) radius:self.radius startAngle:3 * M_PI_2 endAngle:4 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, 0)];
                }
                
                if (self.corners & UIRectCornerBottomRight) {
                    
                    CGFloat cornerSpace = viewWidth - self.triangleOriginSpace - self.triangleWidth;
                    CGFloat radius = cornerSpace > self.radius ? self.radius : cornerSpace;
                    
                    [path addArcWithCenter:CGPointMake(viewWidth - radius, viewHeight - radius) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
                }
                
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace + self.triangleWidth, viewHeight)];
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace + self.triangleWidth / 2, viewHeight - self.triangleHeight)];
                [path addLineToPoint:CGPointMake(self.triangleOriginSpace, viewHeight)];
                
                if (self.corners & UIRectCornerBottomLeft) {
                    CGFloat radius = self.triangleOriginSpace > self.radius ? self.radius : self.triangleOriginSpace;
                    
                    [path addArcWithCenter:CGPointMake(radius, viewHeight - radius) radius:radius startAngle:M_PI_2 endAngle:2 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(0, viewHeight)];
                }
                
                [path closePath];
            }
            break;
        case LKTriangleDirectionRight:
            
            NSAssert(self.triangleOriginSpace + self.triangleWidth <= viewHeight, @"should not larger than view height");
            NSAssert(self.radius < viewWidth && self.radius < viewHeight, @"should not larger than view width and height");
            
            if (self.isOutward) {
                if (self.corners & UIRectCornerTopLeft) {
                    [path moveToPoint:CGPointMake(0, self.radius)];
                    [path addArcWithCenter:CGPointMake(self.radius, self.radius) radius:self.radius startAngle:2 * M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
                } else {
                    [path moveToPoint:CGPointMake(0, 0)];
                }
                
                if (self.corners & UIRectCornerTopRight) {
                    CGFloat radius = self.triangleOriginSpace > self.radius ? self.radius : self.triangleOriginSpace;
                    
                    [path addArcWithCenter:CGPointMake(viewWidth - radius - self.triangleHeight, radius) radius:radius startAngle:3 * M_PI_2 endAngle:4 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth - self.triangleHeight, 0)];
                }
                
                [path addLineToPoint:CGPointMake(viewWidth - self.triangleHeight, self.triangleOriginSpace)];
                [path addLineToPoint:CGPointMake(viewWidth, self.triangleOriginSpace + self.triangleWidth / 2)];
                [path addLineToPoint:CGPointMake(viewWidth - self.triangleHeight, self.triangleOriginSpace + self.triangleWidth)];
                
                if (self.corners & UIRectCornerBottomRight) {
                    CGFloat cornerSpace = viewHeight - self.triangleOriginSpace - self.triangleWidth;
                    CGFloat radius = cornerSpace > self.radius ? self.radius : cornerSpace;
                    
                    [path addArcWithCenter:CGPointMake(viewWidth - radius - self.triangleHeight, viewHeight - radius) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth - self.triangleHeight, viewHeight)];
                }
                
                if (self.corners & UIRectCornerBottomLeft) {
                    [path addArcWithCenter:CGPointMake(self.radius, viewHeight - self.radius) radius:self.radius startAngle:M_PI_2 endAngle:2 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(0, viewHeight)];
                }
                
                [path closePath];
            } else {
                if (self.corners & UIRectCornerTopLeft) {
                    [path moveToPoint:CGPointMake(0, self.radius)];
                    [path addArcWithCenter:CGPointMake(self.radius, self.radius) radius:self.radius startAngle:2 * M_PI_2 endAngle:3 * M_PI_2 clockwise:YES];
                } else {
                    [path moveToPoint:CGPointMake(0, 0)];
                }
                
                if (self.corners & UIRectCornerTopRight) {
                    CGFloat radius = self.triangleOriginSpace > self.radius ? self.radius : self.triangleOriginSpace;
                    
                    [path addArcWithCenter:CGPointMake(viewWidth - radius, radius) radius:radius startAngle:3 * M_PI_2 endAngle:4 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, 0)];
                }
                
                [path addLineToPoint:CGPointMake(viewWidth, self.triangleOriginSpace)];
                [path addLineToPoint:CGPointMake(viewWidth - self.triangleHeight, self.triangleOriginSpace + self.triangleWidth / 2)];
                [path addLineToPoint:CGPointMake(viewWidth, self.triangleOriginSpace + self.triangleWidth)];
                
                if (self.corners & UIRectCornerBottomRight) {
                    CGFloat cornerSpace = viewHeight - self.triangleOriginSpace - self.triangleWidth;
                    CGFloat radius = cornerSpace > self.radius ? self.radius : cornerSpace;
                    
                    [path addArcWithCenter:CGPointMake(viewWidth - radius, viewHeight - radius) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
                }
                
                if (self.corners & UIRectCornerBottomLeft) {
                    [path addArcWithCenter:CGPointMake(self.radius, viewHeight - self.radius) radius:self.radius startAngle:M_PI_2 endAngle:2 * M_PI_2 clockwise:YES];
                } else {
                    [path addLineToPoint:CGPointMake(0, viewHeight)];
                }
                
                [path closePath];
            }
            break;
    }
    return path;
}

#pragma mark - getter & setter
- (void)setDirection:(LKTriangleDirection)direction {
    _direction = direction;
    [self setNeedsLayout];
}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    self.shapeLayer.fillColor = fillColor.CGColor;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    self.shapeLayer.strokeColor = strokeColor.CGColor;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    self.shapeLayer.lineWidth = lineWidth;
}

- (void)setTriangleHeight:(CGFloat)triangleHeight {
    _triangleHeight = triangleHeight;
    [self setNeedsLayout];
}

- (void)setTriangleWidth:(CGFloat)triangleWidth {
    _triangleWidth = triangleWidth;
    [self setNeedsLayout];
}

- (void)setTriangleOriginSpace:(CGFloat)triangleOriginSpace {
    _triangleOriginSpace = triangleOriginSpace;
    [self setNeedsLayout];
}

- (void)setIsOutward:(BOOL)isOutward {
    _isOutward = isOutward;
    [self setNeedsLayout];
}

- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = self.fillColor.CGColor;
        _shapeLayer.lineJoin = kCALineJoinRound;
        _shapeLayer.lineCap = kCALineCapRound;
    }
    return _shapeLayer;
}

- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    [self setNeedsLayout];
}

- (void)setCorners:(UIRectCorner)corners {
    _corners = corners;
    [self setNeedsLayout];
}

@end
