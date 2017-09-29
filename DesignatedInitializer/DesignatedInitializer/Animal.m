//
//  Animal.m
//  DesignatedInitializer
//
//  Created by xiaomogu on 2017/9/29.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "Animal.h"

@interface Animal ()

@property (nonatomic, strong) id type;

@end

@implementation Animal

- (instancetype)init {
    if (self = [self initWithType:nil]) {
        
    }
    return self;
}

- (instancetype)initWithType:(id)type {
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

@end
