//
//  ViewController.m
//  DesignatedInitializer
//
//  Created by xiaomogu on 2017/9/29.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Student *stu = [Student new];
    Student *stu2 = [[Student alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
