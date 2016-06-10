//
//  FifteenCustomTab.h
//  Hardcore
//
//  Created by Pete Streem on 3/18/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "GamePlay.h"
#import "MainMenu.h"
#import "FifteenItem.h"


@interface FifteenCustomTab : CCButton


@property GamePlay *gameplayParrentDelegate;
@property MainMenu *mainMenuDelegate;

- (void)initWithId:(int)myId fifteenItem:(FifteenItem *)myFifteen;

@end
