//
//  ViewController.m
//  block
//
//  Created by xiaomogu on 2017/12/26.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self tryBlock];
}

- (void)tryBlock {
    for (int i = 0; i < 2; i++) {
        NSString *(^transferBlock)(NSString *) = ^NSString *(NSString *url) {
            [self tryBlock];
            return url;
        };

        NSString *(^block)(NSString *) = ^NSString *(NSString *url) {
            auto unsigned int a = 0;
            if (a != 0) {
                return url;
            }
            a++;
            NSString *transferedUrl = transferBlock(url);
            a--;
            return transferedUrl;
        };

        block(@"http://www.bilibili.com");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
