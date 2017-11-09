//
//  ViewController.m
//  thread
//
//  Created by xiaomogu on 2017/11/7.
//  Copyright © 2017年 xiaomogu. All rights reserved.
//

#import "ViewController.h"

// 保证执行顺序的含义不是当前任务一定要先执行才是保证顺序，而是无论哪个任务先执行，整体的顺序都不会变化

// 同步
// 1. 不具备开启新线程的能力
// 2. 立即执行
// 3. 无法从主线程切到其他线程
// 4. 其他线程可以通过获取主队列切到主线程
// 5. 其他线程无法切到非主线程以外的线程

// 异步
// 1. 具备开启新线程的能力
// 2. 执行时间不确定

// 串行
// 1. 在串行队列中，同步获取自己就会造成死循环

// 1. 主线程同步获取全局队列
//    无法实现，同步意味着不具备开启新线程的能力，而主线程只能在主队列中工作，无法切换到其他队列上
// 2. 主线程同步获取主队列
//    无法实现，会造成死循环，这里的重点在于获取主队列，如果只是在主线程里同步执行任务，按顺序依次执行就好，但是想要获取主队列进行任务执行，就出现了死循环，这里一旦获取了主队列，就意味着将主线程整个放在了主队列上执行，要等待主线程的任务全部完成，主队列才会空闲，但同时主队列又在等待主线程任务的完成才能空闲，因此造成了死循环
// 3. 主线程同步获取自定义串行队列
//    同1
// 4. 主线程同步获取自定义并发队列
//    同1

// 5. 主线程异步获取全局队列
// 6. 主线程异步获取主队列
// 7. 主线程异步获取自定义串行队列
//    异步意味着具备开启新线程的能力，串行意味着按照顺序执行，所以这里开启了一个新线程，任务顺序执行
// 8. 主线程异步获取自定义并发队列

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	/*
	// 1. 主线程同步获取全局队列
	dispatch_sync(dispatch_get_global_queue(0, 0), ^{
		NSLog(@"22222%@", [NSThread currentThread]);
	});
	NSLog(@"44444%@", [NSThread currentThread]);
	
	// 2. 主线程同步获取主队列
	dispatch_sync(dispatch_get_main_queue(), ^{
		NSLog(@"22222%@", [NSThread currentThread]);
	});
	NSLog(@"44444%@", [NSThread currentThread]);

	// 3. 主线程同步获取自定义串行队列
	dispatch_queue_t q = dispatch_queue_create("custom1", DISPATCH_QUEUE_SERIAL);
	dispatch_sync(q, ^{
		NSLog(@"22222%@", [NSThread currentThread]);
	});
	NSLog(@"44444%@", [NSThread currentThread]);
	
	// 4. 主线程同步获取自定义并发队列
	dispatch_queue_t q2 = dispatch_queue_create("custom2", DISPATCH_QUEUE_CONCURRENT);
	dispatch_sync(q2, ^{
		NSLog(@"22222%@", [NSThread currentThread]);
	});
	NSLog(@"44444%@", [NSThread currentThread]);
	*/
	
	NSLog(@"----------------------");
	
//	// 5. 主线程异步获取全局队列
//	//    每次开启一个线程，执行顺序不确定
//	dispatch_async(dispatch_get_global_queue(0, 0), ^{
//		NSLog(@"主线程异步获取全局队列11111%@", [NSThread currentThread]);
//	});
//	dispatch_async(dispatch_get_global_queue(0, 0), ^{
//		NSLog(@"主线程异步获取全局队列22222%@", [NSThread currentThread]);
//	});
//	dispatch_async(dispatch_get_global_queue(0, 0), ^{
//		NSLog(@"主线程异步获取全局队列33333%@", [NSThread currentThread]);
//	});
//	NSLog(@"主线程异步获取全局队列44444%@", [NSThread currentThread]);
	
//	// 6. 主线程异步获取主队列
//	//    异步不会立即执行，但因为是串行队列，仍然可以保证执行顺序 4123 main
//	dispatch_async(dispatch_get_main_queue(), ^{
//		NSLog(@"主线程异步获取主队列11111%@", [NSThread currentThread]);
//	});
//	dispatch_async(dispatch_get_main_queue(), ^{
//		[NSThread sleepForTimeInterval:3];
//		NSLog(@"主线程异步获取主队列22222%@", [NSThread currentThread]);
//	});
//	dispatch_async(dispatch_get_main_queue(), ^{
//		NSLog(@"主线程异步获取主队列33333%@", [NSThread currentThread]);
//	});
//	NSLog(@"主线程异步获取主队列44444%@", [NSThread currentThread]);

//	// 7. 主线程异步获取自定义串行队列
//	//    异步意味着具备开启新线程的能力，但是串行队列里只能按顺序执行，所以只能新开一条线程
//	//    获取主队列时，无论同步还是异步，都只会切到主线程，区别只在执行顺序
//	//    获取全局队列时，同步不会切线程，异步会切线程
//	//    在串行队列中，同步获取自己就会造成死循环
//	dispatch_queue_t q3 = dispatch_queue_create("custom3", DISPATCH_QUEUE_SERIAL);
//	dispatch_async(q3, ^{
//		NSLog(@"主线程异步获取自定义串行队列22222%@", [NSThread currentThread]);
//	});
//	dispatch_async(q3, ^{
//		NSLog(@"主线程异步获取自定义串行队列33333%@", [NSThread currentThread]);
//	});
//	dispatch_async(q3, ^{
//		NSLog(@"主线程异步获取自定义串行队列44444%@", [NSThread currentThread]);
//		dispatch_sync(dispatch_get_main_queue(), ^{
//			dispatch_async(dispatch_get_global_queue(0, 0), ^{
//				NSLog(@"主线程异步获取自定义串行队列55555%@", [NSThread currentThread]);
//			});
//			NSLog(@"主线程异步获取自定义串行队列66666%@", [NSThread currentThread]);
//		});
//		NSLog(@"主线程异步获取自定义串行队列77777%@", [NSThread currentThread]);
////		dispatch_sync(q3, ^{
////			NSLog(@"主线程异步获取自定义串行队列88888%@", [NSThread currentThread]);
////		});
//	});

	// 8. 主线程异步获取自定义并发队列
	// 每次开启一个线程，执行顺序不确定
//	dispatch_queue_t q4 = dispatch_queue_create("custom4", DISPATCH_QUEUE_CONCURRENT);
//	dispatch_async(q4, ^{
//		[NSThread sleepForTimeInterval:3];
//		NSLog(@"主线程异步获取自定义并发队列11111%@", [NSThread currentThread]);
//	});
//	dispatch_async(q4, ^{
//		NSLog(@"主线程异步获取自定义并发队列22222%@", [NSThread currentThread]);
//	});
//	dispatch_async(q4, ^{
//		NSLog(@"主线程异步获取自定义并发队列33333%@", [NSThread currentThread]);
//		dispatch_sync(q4, ^{
//			NSLog(@"主线程异步获取自定义并发队列44444%@", [NSThread currentThread]);
//		});
//		dispatch_async(dispatch_get_global_queue(0, 0), ^{
//			NSLog(@"主线程异步获取自定义并发队列55555%@", [NSThread currentThread]);
//		});
//	});
//	NSLog(@"主线程异步获取自定义并发队列66666%@", [NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
