//
//  ViewController.m
//  runtime
//
//  Created by xiaomogu on 2017/12/14.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    unsigned int count;
    Method *methods = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        NSLog(@"%s", sel_getName(method_getName(methods[i])));
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
