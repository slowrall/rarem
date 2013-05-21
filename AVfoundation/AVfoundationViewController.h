//
//  AVfoundationViewController.h
//  AVfoundation
//
//  Created by Ogechukwu Nwabuoku on 5/9/13.
//  Copyright (c) 2013 Ogechukwu Nwabuoku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MediaPlayer/MediaPlayer.h"
#import "AudioToolbox/AudioToolbox.h"


@interface AVfoundationViewController : UIViewController<AVAudioPlayerDelegate>




@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *pauseButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
@property (nonatomic, retain) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UIProgressView *progressMusic;
@property(strong, nonatomic)NSTimer *currentTimeUpdater;
@property(nonatomic) BOOL userIsScrubbing;



@property (nonatomic, retain) AVAudioPlayer *player;



- (IBAction)jcoleMusic:(UIButton *)sender;

- (IBAction)otherMusic:(UIButton *)sender;

- (IBAction)playSound;
- (IBAction)pauseSound;
- (IBAction)stopSound;
@end
