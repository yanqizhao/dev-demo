//
//  ViewController.m
//  runtime
//
//  Created by xiaomogu on 2017/12/14.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@protocol TestProtocol

- (void)testFunc1:(NSString *)str;
- (void)testFunc2;
- (void)testFunc3:(NSString *)str num:(NSInteger)num;

@optional
- (void)testFunc4;

@end

@interface TestObject : NSObject <TestProtocol>

@end

@implementation TestObject

- (void)testFunc1:(NSString *)str {
    NSLog(@"testFunc1");
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    unsigned int count;
    Method *methods = class_copyMethodList([TestObject class], &count);
    for (unsigned int i = 0; i < count; i++) {
        NSLog(@"%s", sel_getName(method_getName(methods[i])));
    }

    TestObject *obj = [[TestObject alloc] init];
    Protocol * __unsafe_unretained _Nonnull * _Nullable protocols = class_copyProtocolList([obj class], &count);
    for (unsigned int i = 0; i < count; i++) {
        unsigned int count2;
        struct objc_method_description *methodsDesc = protocol_copyMethodDescriptionList(protocols[i], YES, YES, &count2);
        for (unsigned int i = 0; i < count2; i++) {
            //            NSString *name = [NSString stringWithUTF8String:sel_getName(methodsDesc[i].name)];
            //            SEL selector = NSSelectorFromString(name);
            SEL selector = methodsDesc[i].name;
            BOOL res = [obj respondsToSelector:selector];
            NSLog(@"%d", res);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)test {
    NSLog(@"test");
}

@end
