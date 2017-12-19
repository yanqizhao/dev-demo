//
//  ViewController.m
//  NSProxy
//
//  Created by xiaomogu on 2017/12/18.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "ViewController.h"

@implementation Proxy

- (instancetype)init {
    return self;
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Proxy *proxy = [Proxy alloc];
    NSLog(@"%@", proxy);
    proxy = [proxy init];
    NSLog(@"%@", proxy);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
