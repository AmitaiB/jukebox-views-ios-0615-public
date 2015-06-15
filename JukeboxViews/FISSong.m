//
//  FISSong.m
//  JukeboxViews
//
//  Created by Josette DiMarcantonio on 6/14/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISSong.h"

@implementation FISSong

-(instancetype) init {
    return [self initWithTitle:@"" artist:@"" album:@"" andFileName:@""];
}

-(instancetype) initWithTitle:(NSString *)title artist:(NSString *)artist album:(NSString *)album andFileName:(NSString *)fileName {
    
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _album = album;
        _fileName = fileName;
    }
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Title: %@ Artist: %@ Album: %@\n", self.title, self.artist, self.album];
}

@end
