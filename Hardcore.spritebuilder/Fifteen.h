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


//@property float fifteenPositions[kN+2][kM+2];
//@property float fifteenPositionsShuffled[kN+2][kM+2];

- (void)setActiveNumber:(int)activeNum;
- (void)setActivePuzzleNumber:(int)activeNum;

- (void)moveCell:(int)direction;
- (void)print15;

-(void) updateFifteenData;
-(void) updateSomeData;

- (int)getActiveLevelNumber;
- (int)getActivePuzzleNumber;

-(void) removeLevelFromView;

@property CCSprite *fifteenOriginHolder;
@property CCSprite *fifteenShuffleHolder;
@property CCSprite *fifteenShuffleHolderLittle;



@property NSString *currentDirectionString;



@end
