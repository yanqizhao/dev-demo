//
//  ViewController.m
//  Category
//
//  Created by Helena on 2017/11/8.
//  Copyright © 2017年 yanqizhao. All rights reserved.
//

#import "ViewController.h"
#import "HeaderRefreshTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    HeaderRefreshTableView *tv = [[HeaderRefreshTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tv];
    [tv yq_addHeaderRefresh];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
