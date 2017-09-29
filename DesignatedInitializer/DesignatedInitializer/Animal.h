//
//  Animal.h
//  DesignatedInitializer
//
//  Created by xiaomogu on 2017/9/29.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithType:(id)type NS_DESIGNATED_INITIALIZER;

@end
