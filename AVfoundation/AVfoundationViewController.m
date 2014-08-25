//
//  AVfoundationViewController.m
//  AVfoundation
//
//  Created by Ogechukwu Nwabuoku on 5/9/13.
//  Copyright (c) 2013 Ogechukwu Nwabuoku. All rights reserved.
//

#import "AVfoundationViewController.h"
//slowrall
@interface AVfoundationViewController ()
{
    SystemSoundID toneSSIDs[2];
}
@end

@implementation AVfoundationViewController
@synthesize playButton;
@synthesize pauseButton;
@synthesize lblStatus;
@synthesize stopButton;
@synthesize player;
@synthesize currentTime;
@synthesize progressMusic;
@synthesize currentTimeUpdater;
@synthesize userIsScrubbing;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    NSString *thisIstheNewFileWeAdded  = @"Just Added";
   // currentTimeUpdater = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateCurrentiPodItemTime) userInfo:NULL repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *hi = [[NSString alloc]init];
    
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"jcole" ofType:@"mp3"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    
    // Init the audio player.
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    // Check out what's wrong in case that the player doesn't init.
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        //  we'll pre-load the audio into the buffer. You may avoid it if you want
        // as it's not always possible to pre-load the audio.
        [player prepareToPlay];
    }
    
   
    
    [player setDelegate:self];
  
   
}

-(IBAction)registerSoundClips:(UIButton *)pressedButton
{
    
    for (int count = 0; count<2; count++)
    {
        NSString *toneFilename = [NSString stringWithFormat:@"%d", count];
        NSURL *toneURLRef =[[NSBundle mainBundle]URLForResource:toneFilename withExtension:@"mp3"];
        SystemSoundID toneSSID;
        AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef) toneURLRef , &toneSSID);
        
        toneSSIDs[count] = toneSSID;
        
    }
}

//-(void)updateProgress
//{
//   
//    if([player play] == nil)
//    {
//        self.currentTime.text = @"00:00";
//    }
//    
//    else{
//        self.currentTime.text = [NSString stringWithFormat: @"%02d:%02d", (int) currentTime / 60, (int) currentTime % 60];
//    }
//}

- (IBAction)jcoleMusic:(UIButton *)sender
{
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"jcole" ofType:@"mp3"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    
    // Init the audio player.
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    // Check out what's wrong in case that the player doesn't init.
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        //  we'll pre-load the audio into the buffer. You may avoid it if you want
        // as it's not always possible to pre-load the audio.
        [player prepareToPlay];
    }
    
    
    
    [player setDelegate:self];
    

}

- (IBAction)otherMusic:(UIButton*)sender
{
    NSString *audioFilePath = [[NSBundle mainBundle] pathForResource:@"other" ofType:@"mp3"];
    NSURL *pathAsURL = [[NSURL alloc] initFileURLWithPath:audioFilePath];
    
    // Init the audio player.
    NSError *error;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathAsURL error:&error];
    
    // Check out what's wrong in case that the player doesn't init.
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        //  we'll pre-load the audio into the buffer. You may avoid it if you want
        // as it's not always possible to pre-load the audio.
        [player prepareToPlay];
    }
    
    
    
    [player setDelegate:self];
    

    
}

- (IBAction)playSound {
    [player play];
    
    [lblStatus setText:@"Now playing..."];
  //  self.currentTime.text = [NSString stringWithFormat: @"%02d:%02d", (int) currentTime / 60, (int) currentTime % 60];
    
}



- (IBAction)pauseSound {
    [player stop];
    
    [lblStatus setText:@"Paused..."];
}


- (IBAction)stopSound {
    [player stop];
    
    [player setCurrentTime:0.0];
    
    [lblStatus setText:@"Playback stopped."];
   
}


-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [lblStatus setText:@"Playback finished."];
}




- (void)viewDidUnload
{
    // Release any retained subviews of the main view.
    [self setPlayButton:nil];
    [self setPauseButton:nil];
    [self setStopButton:nil];
    [self setLblStatus:nil];
    [super viewDidUnload];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
