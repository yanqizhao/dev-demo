//
//  ViewController.m
//  VideoDemo
//
//  Created by zhaoyq on 2017/1/6.
//  Copyright © 2017年 zhaoyq. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface ViewController ()

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     
     1. AVPlayer iOS4- 可封装 AVFoundation库中
     2. MPMoviePlayerController iOS 5-9 已废弃 MediaPlayer库中
     3. MPMoviePlayerViewController iOS 3.2-9 已废弃 MediaPlayer库中
     4. AVPlayerViewController iOS 8- 8以后可使用 AVKit库中
     
    */
    
    [self player];
}

- (AVPlayer *)player {
    if (!_player) {
        NSURL *url = [NSURL URLWithString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        _player = [AVPlayer playerWithPlayerItem:item];
        
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:_player];
        layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view.layer addSublayer:layer];
    }
    return _player;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
