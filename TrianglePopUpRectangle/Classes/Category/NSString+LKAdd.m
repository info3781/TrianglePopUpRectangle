//
//  NSString+LKAdd.m
//  TrianglePopUpRectangle
//
//  Created by Info on 2019/4/11.
//

#import "NSString+LKAdd.h"

@implementation NSString (LKAdd)

- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

@end
