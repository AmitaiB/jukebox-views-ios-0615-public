//
//  FISViewController.h
//  JukeboxViews
//
//  Created by Josette DiMarcantonio on 6/14/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISPlaylist.h"
#import <AVFoundation/AVFoundation.h>

@interface FISViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textField;

@property (weak, nonatomic) IBOutlet UITextField *songNumber;

@property (strong, nonatomic) FISPlaylist *playlist;


@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


@property (strong, nonatomic) NSString *url;

@end
