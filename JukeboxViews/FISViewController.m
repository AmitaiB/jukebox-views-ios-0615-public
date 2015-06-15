//
//  FISViewController.m
//  JukeboxViews
//
//  Created by Josette DiMarcantonio on 6/14/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISViewController.h"


@interface FISViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *albumArt;

@end

@implementation FISViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *songs = [[NSMutableArray alloc] initWithObjects: [[FISSong alloc] initWithTitle:@"Hold on be Strong" artist:@"2Pac" album:@"R U Still Down?" andFileName:@"hold_on_be_strong"],
                      [[FISSong alloc] initWithTitle:@"Higher Love" artist:@"Steve Winwood" album:@"Back in the High Life" andFileName:@"higher_love"],
                      [[FISSong alloc] initWithTitle:@"Mo Money Mo Problems" artist:@"The Notorious BIG" album:@"Life After Death" andFileName:@"mo_money_mo_problems"],
                      [[FISSong alloc] initWithTitle:@"Old Thing Back" artist:@"The Notorious BIG" album:@"Duets: The Final Chapter" andFileName:@"old_thing_back"],
                      [[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love" artist:@"Snoop Dogg vs. Leona Lewis" album:@"Whatever" andFileName:@"gangsta_bleeding_love"],
                      [[FISSong alloc] initWithTitle:@"Bailando" artist:@"Enrique Iglesias" album:@"Sex and Love" andFileName:@"bailando"], nil];
    
    self.playlist = [[FISPlaylist alloc] initWithSongs:songs];

    self.textField.text = [self.playlist description];
    self.textField.backgroundColor = [UIColor clearColor];
    self.textField.editable = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Play:(id)sender {
    [self Stop:(id)sender];
    NSLog(@"%@", [self.playlist songAtPosition:@([self.songNumber.text integerValue])]);
    
    FISSong *songToPlay = [self.playlist songAtPosition:@([self.songNumber.text integerValue])];
    NSString *titleOfSongToPlay = songToPlay.fileName;
    
    self.url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                       pathForResource:songToPlay.fileName
                                       ofType:@"mp3"]];
    
    [self setupAVAudioPlayWithFileName:titleOfSongToPlay];
    [self.audioPlayer play];
    
}
     
- (IBAction)Stop:(id)sender {
    NSLog(@"Stopped playing that thun thun thun");
    [self.audioPlayer stop];
}

- (IBAction)sortByTitle:(id)sender {
    [self.playlist sortSongsByTitle];
    self.textField.text = [self.playlist description];
}

- (IBAction)sortByArtist:(id)sender {
    [self.playlist sortSongsByArtist];
    self.textField.text = [self.playlist description];
}

- (IBAction)sortByAlbum:(id)sender {
    [self.playlist sortSongsByAlbum];
    self.textField.text = [self.playlist description];
}


//- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
//{
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
//                                         pathForResource:fileName
//                                         ofType:@"mp3"]];
//    NSError *error;
//    self.audioPlayer = [[AVAudioPlayer alloc]
//                        initWithContentsOfURL:url
//                        error:&error];
//    if (error)
//    {
//        NSLog(@"Error in audioPlayer: %@",
//              [error localizedDescription]);
//    } else {
//        [self.audioPlayer prepareToPlay];
//    }
//}






- (void)setupAVAudioPlayWithFileName:(NSString *)fileName{

    NSError *error;
    
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:self.url
                        error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
    
    AVAsset *asset = [AVAsset assetWithURL:self.url];
    for (AVMetadataItem *metadataItem in asset.commonMetadata) {
        //NSLog(@"%@",metadataItem.commonKey);
        if ([metadataItem.commonKey isEqualToString:@"artwork"]){
            NSLog(@"found an image");
            self.albumArt.image = [UIImage imageWithData:(NSData *)metadataItem.value];
        }
    }
}




@end
