//
//  MainMenu.h
//  Hardcore
//
//  Created by Pete Streem on 11/26/15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "GamePlay.h"
#import "FifteenItem.h"

@interface MainMenu : CCNode


@property GamePlay *gameplayParrentDelegate;
-(void) _fifteenBtn:(CCButton *)sender;
-(void) showStats:(FifteenItem *)currentFifteenData andWithId:(int)levelId;

-(void) replayBtn:(int)newLevel;

@end
