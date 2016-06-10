//
//  Rusty.h
//  Untitled
//
//  Created by Admin on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "GamePlay.h"


@interface Fifteen : CCNode

@property GamePlay *gameplayParrentDelegate;
@property CCSprite *_bg;


- (void)setActiveNumber:(int)activeNum;
- (void)moveCell:(int)direction;
- (void)print15;
@end
