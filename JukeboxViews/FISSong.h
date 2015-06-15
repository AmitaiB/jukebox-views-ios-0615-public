//
//  FISSong.h
//  JukeboxViews
//
//  Created by Josette DiMarcantonio on 6/14/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSong : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *album;
@property (strong, nonatomic) NSString *fileName;

-(instancetype) init;
-(instancetype) initWithTitle:(NSString *)title artist:(NSString *)artist album:(NSString *)album andFileName:(NSString *)fileName;
-(NSString *)description;

@end
