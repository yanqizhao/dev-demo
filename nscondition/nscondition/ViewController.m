//
//  ViewController.m
//  nscondition
//
//  Created by xiaomogu on 2017/11/14.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static int _products;

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];	
//	NSCondition *condition = [[NSCondition alloc] init];
//	dispatch_async(dispatch_get_global_queue(0, 0), ^{
//		[condition lock];
//		NSLog(@"1%@", [NSThread currentThread]);
//		while (_products == 0) {
//			NSLog(@"wait for products");
//			[condition wait];
//		}
//		_products -= 1;
//		NSLog(@"consume a product");
//		[condition unlock];
//	});
//	dispatch_async(dispatch_get_global_queue(0, 0), ^{
//		[condition lock];
//		NSLog(@"2%@", [NSThread currentThread]);
//		_products += 1;
//		NSLog(@"produce a product");
//		[condition signal];
//		[condition unlock];
//	});
	
	NSCondition *condition = [[NSCondition alloc] init];
	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		[condition lock];
		NSLog(@"1%@", [NSThread currentThread]);
		NSLog(@"wait for products");
		[condition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
		if (_products > 0) {
			_products -= 1;
			NSLog(@"consume a product");
		}
		else {
			NSLog(@"timeout");
		}
		[condition unlock];
	});

	dispatch_async(dispatch_get_global_queue(0, 0), ^{
		NSLog(@"2%@", [NSThread currentThread]);
		[NSThread sleepForTimeInterval:3];
		[condition lock];
		_products += 1;
		NSLog(@"produce a product");
		[condition signal];
		[condition unlock];
	});
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
