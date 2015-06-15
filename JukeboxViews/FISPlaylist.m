//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Josette DiMarcantonio on 6/14/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISPlaylist.h"
#import "FISSong.h"

@implementation FISPlaylist

-(instancetype) init {
    return [self initWithSongs:[@[] mutableCopy]];
}

-(instancetype) initWithSongs:(NSMutableArray *)songs {
    self = [super init];
    if(self){
        _songs = songs;
    }
    return self;
}

-(void) sortSongsByTitle {
        NSSortDescriptor *alphabeticalByTitle = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES selector:@selector(localizedStandardCompare:)];
        
        NSSortDescriptor *alphabeticalByArtist = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES selector:@selector(localizedStandardCompare:)];
    
        [self.songs sortUsingDescriptors:@[alphabeticalByTitle, alphabeticalByArtist]];
    
}

-(void)sortSongsByArtist{
    NSSortDescriptor *alphabeticalByArtist = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    NSSortDescriptor *alphabeticalByAlbum = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    NSSortDescriptor *alphabeticalByTitle = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    [self.songs sortUsingDescriptors:@[alphabeticalByArtist, alphabeticalByAlbum, alphabeticalByTitle]];
}

-(void)sortSongsByAlbum{
    NSSortDescriptor *alphabeticalByAlbum = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    NSSortDescriptor *alphabeticalByTitle = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    [self.songs sortUsingDescriptors:@[alphabeticalByAlbum, alphabeticalByTitle]];
}

-(NSString *)description{
    NSMutableString *returnString = [@"" mutableCopy];
    for (NSUInteger i=0; i < self.songs.count; i++) {
        FISSong *individualSong = self.songs[i];
        [returnString appendString:[NSString stringWithFormat:@"%ld. Title: %@ Artist: %@ Album: %@\n\n", i + 1, individualSong.title, individualSong.artist, individualSong.album]];
    }
    return returnString;
}

-(FISSong *)songAtPosition:(NSNumber *)position{
    NSInteger positionNumber = [position integerValue];
    if (positionNumber > [self.songs count] || positionNumber <= 0) {
        return nil;
    } else {
        return self.songs[positionNumber - 1];
    }
}

@end
