//
//  NSString+LKAdd.h
//  TrianglePopUpRectangle
//
//  Created by Info on 2019/4/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LKAdd)

/**
 Trim blank characters (space and newline) in head and tail.
 @return the trimmed string.
 */
- (NSString *)stringByTrim;

@end

NS_ASSUME_NONNULL_END
