//
//  ViewController.m
//  NSURLRequest
//
//  Created by xiaomogu on 2017/10/18.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableURLRequest *aReq;
@property (nonatomic, copy) NSMutableURLRequest *bReq;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableURLRequest *cReq = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"www.baidu.com"]];
    self.aReq = cReq;
    self.bReq = cReq;
    NSLog(@"%@", [self.aReq class]);
    NSLog(@"%@", [self.bReq class]);
    NSLog(@"%@", [self.aReq URL]);
    NSLog(@"%@",  [self.bReq URL]);
    cReq.URL = [NSURL URLWithString:@"www.google.com"];
    NSLog(@"%@", [self.aReq URL]);
    NSLog(@"%@",  [self.bReq URL]);
    self.bReq.URL = [NSURL URLWithString:@"www.google.com"];
    NSLog(@"%@",  [self.bReq URL]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
