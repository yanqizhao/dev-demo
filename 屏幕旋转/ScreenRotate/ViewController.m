//
//  ViewController.m
//  ScreenRotate
//
//  Created by 赵彦琦 on 28/06/2018.
//  Copyright © 2018 yanqizhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"2233"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(10, 100, 360, 240);
    [self.view addSubview:imageView];
    imageView.userInteractionEnabled = YES;
}

/**
  Returns a Boolean value indicating whether the view controller's contents should auto rotate.
  Returns YES if the content should rotate, otherwise NO. This method returns YES by default.
 */
- (BOOL)shouldAutorotate {
    return YES;
}

/**
 Returns all of the interface orientations that the view controller supports.
 When the user changes the device orientation, the system calls this method on the root view controller or the topmost presented view controller that fills the window. If the view controller supports the new orientation, the window and view controller are rotated to the new orientation. This method is only called if the view controller's shouldAutorotate method returns YES.
 Override this method to report all of the orientations that the view controller supports. The default values for a view controller's supported interface orientations is set to UIInterfaceOrientationMaskAll for the iPad idiom and UIInterfaceOrientationMaskAllButUpsideDown for the iPhone idiom.
 The system intersects the view controller's supported orientations with the app's supported orientations (as determined by the Info.plist file or the app delegate's application:supportedInterfaceOrientationsForWindow: method) and the device's supported orientations to determine whether to rotate. For example, the UIInterfaceOrientationPortraitUpsideDown orientation is not supported on iPhone X.

 A bit mask specifying which orientations are supported. See UIInterfaceOrientationMask for valid bit-mask values. The value returned by this method must not be 0.
 该方法调用的先决条件是shouldAutorate方法返回YES，否则不会调用（胡说）
 这个方法如果返回UIInterfaceOrientationMaskLandscape，那么Portrait下视图也会旋转为横屏的样子
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

/**
 Returns the interface orientation to use when presenting the view controller.
 The system calls this method when presenting the view controller full screen. When your view controller supports two or more orientations but the content appears best in one of those orientations, override this method and return the preferred orientation.
 If your view controller implements this method, your view controller’s view is shown in the preferred orientation (although it can later be rotated to another supported rotation). If you do not implement this method, the system presents the view controller using the current orientation of the status bar.
 Returns The interface orientation with which to present the view controller.
 如果不实现这个方法，则使用status bar的orientation
 */
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end
