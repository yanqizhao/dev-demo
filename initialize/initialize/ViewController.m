//
//  ViewController.m
//  initialize
//
//  Created by 赵彦琦 on 19/04/2018.
//  Copyright © 2018 赵彦琦. All rights reserved.
//

#import "ViewController.h"

@interface SuperClass : NSObject

@end

@implementation SuperClass

+ (void)load {
    NSLog(@"SuperClass load");
}

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       NSLog(@"SuperClass initialize");
    });
}

@end

@interface SuperClass (Category)

@end

@implementation SuperClass (Category)

+ (void)load {
    NSLog(@"SuperClass Category load");
}

@end

@interface SubClass : SuperClass

@end

@implementation SubClass

+ (void)load {
    NSLog(@"SubClass load");
//    [super load];
}

+ (void)initialize {
//    [super initialize];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"SubClass initialize");
    });
}

@end


@interface FinalClass : SubClass

@end

@implementation FinalClass

+ (void)load {
    NSLog(@"FinalClass load");
}

//+ (void)initialize {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSLog(@"FinalClass initialize");
//    });
//}

@end

@interface FinalClass (Category)

@end

@implementation FinalClass (Category)

+ (void)load {
    NSLog(@"FinalClass Category load");
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    FinalClass *final = [FinalClass new];
    [FinalClass self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
