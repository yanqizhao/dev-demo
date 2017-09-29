//
//  Person.h
//  DesignatedInitializer
//
//  Created by xiaomogu on 2017/9/29.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "Animal.h"

@interface Person : Animal

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

@end
