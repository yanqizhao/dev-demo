//
//  Person.m
//  DesignatedInitializer
//
//  Created by xiaomogu on 2017/9/29.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (nonatomic, strong) NSString *name;

@end

@implementation Person

- (instancetype)initWithType:(id)type {
    if (self = [self initWithName:nil]) {
        
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    if (self = [super initWithType:nil]) {
        _name = name;
    }
    return self;
}

@end
