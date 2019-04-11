//
//  LKViewController.m
//  TrianglePopUpRectangle
//
//  Created by info3781@gmail.com on 04/11/2019.
//  Copyright (c) 2019 info3781@gmail.com. All rights reserved.
//

#import "LKViewController.h"
#import "TrianglePopUpRectangle.h"

@interface LKViewController ()

@end

@implementation LKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *attArr = @[
                        @{@"desc":@"三角朝上，尖角朝外,originspace大于radius",
                          @"direction":@(LKTriangleDirectionUp),
                          @"outward":@1,
                          @"space":@30,
                          @"radius":@5
                          },
                        @{@"desc":@"三角朝右，尖角朝外,originspace大于radius",
                          @"direction":@(LKTriangleDirectionRight),
                          @"outward":@1,
                          @"space":@10,
                          @"radius":@20
                          },
                        @{@"desc":@"三角朝下，尖角朝内",
                          @"direction":@(LKTriangleDirectionBottom),
                          @"outward":@0
                          },
                        @{@"desc":@"三角朝左，尖角朝外",
                          @"direction":@(LKTriangleDirectionLeft),
                          @"outward":@1,
                          },
                        ];
    
    for (int i = 0; i < attArr.count; i++) {
        @autoreleasepool {
            
            NSDictionary *att = attArr[i];
            
            CGRect titleRect = CGRectMake(15, 30 + (100 + 20 + 5) * i, 300, 20);
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleRect];
            titleLabel.font = [UIFont systemFontOfSize:12];
            titleLabel.text = att[@"desc"];
            [self.view addSubview:titleLabel];
            
            
            CGRect rectangleRect = CGRectMake(15, CGRectGetMaxY(titleRect) + 5, [UIScreen mainScreen].bounds.size.width - 30, 100);
            LKTrianglePopUpRectangle *trianglePopUpRectangleView = [[LKTrianglePopUpRectangle alloc] initWithFrame:rectangleRect];
            trianglePopUpRectangleView.direction = [att[@"direction"] intValue];
            trianglePopUpRectangleView.isOutward = [att[@"outward"] boolValue];
            if (att[@"radius"]) {
                trianglePopUpRectangleView.radius = [att[@"radius"] floatValue];
            }
            if (att[@"space"]) {
                trianglePopUpRectangleView.triangleOriginSpace = [att[@"space"] floatValue];
            }
            trianglePopUpRectangleView.corners = UIRectCornerTopLeft | UIRectCornerBottomRight | UIRectCornerTopRight | UIRectCornerBottomLeft;
            ;
            
            [self.view addSubview:trianglePopUpRectangleView];
        }
    }
}

@end
