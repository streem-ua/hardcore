//
//  TopBar.h
//  Hardcore
//
//  Created by Pete Streem on 11/16/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "GamePlay.h"

@interface TopBar : CCNode

@property GamePlay *gameplayParrentDelegate;

-(void) updateTimerData: (NSString *)myStr;
-(void) updateDeath;
-(void) rustyMoveEnabled;

@property CCLabelTTF *_fifteenTime;
@property CCLabelTTF *_totalEnergy;
@property CCLabelTTF *_totalDeath;
@property CCSprite *myEnergyBar;
@property CCSprite *myEnergyBarMask;


@end
