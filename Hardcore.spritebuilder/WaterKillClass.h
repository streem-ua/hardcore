//
//  WaterKillClass.h
//  Hardcore
//
//  Created by Pete Streem on 9/16/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "GamePlay.h"

@interface WaterKillClass : CCNode

@property GamePlay *gameplayParrentDelegate;
-(void) moveWaterToInitPosition;

@property CCNode *imageWaves;
@property CCNode *_waterHolder;


@end
