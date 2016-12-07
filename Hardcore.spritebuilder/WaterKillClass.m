//
//  WaterKillClass.m
//  Hardcore
//
//  Created by Pete Streem on 9/16/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "WaterKillClass.h"

@implementation WaterKillClass





//CCSprite *imageWaves;



-(void) didLoadFromCCB{
    

    self.imageWaves.position = ccp(256, -180.4);
    
    
    NSTimer *initWaterUpTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(runWater) userInfo:nil repeats:NO];
    
    
    CCActionMoveTo *moveWater = [CCActionMoveTo actionWithDuration:8 position:ccp(-256, self._waterHolder.position.y)];
    CCActionMoveTo *moveWaterNull = [CCActionMoveTo actionWithDuration:0 position:ccp(256, self._waterHolder.position.y)];
    CCActionSequence* leftAndRight = [CCActionSequence actions:moveWater, moveWaterNull, nil];

    [self._waterHolder runAction:[CCActionRepeatForever actionWithAction:leftAndRight]];

    
    
}



-(void) update:(CCTime)delta{
    
    
    
}



-(void) runWater {
    
    CCActionMoveTo *moveWaterUp = [CCActionMoveTo actionWithDuration:6 position:ccp(256, self.imageWaves.position.y+260)];
    CCActionMoveTo *moveWaterDown = [CCActionMoveTo actionWithDuration:2 position:ccp(256, -180.4)];
    id delay = [CCActionDelay actionWithDuration: 1];
    CCActionSequence* upAndDown = [CCActionSequence actions:moveWaterUp, moveWaterDown, delay, nil];
    
    [self.imageWaves runAction:[CCActionRepeatForever actionWithAction:upAndDown]];

}


-(void) moveWaterToInitPosition {
    
    
    [self.imageWaves stopAllActions];
    
    
    
    
    CCActionMoveTo *moveWaterDown = [CCActionMoveTo actionWithDuration:2 position:ccp(256, -180.4)];
   
    [self.imageWaves runAction:[CCActionSequence actions:moveWaterDown, [CCActionCallFunc actionWithTarget:self selector:@selector(respawnRustyFromWater)], nil]];
    
    
    
    
}

-(void) respawnRustyFromWater{
    
    NSTimer *initWaterUpTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(runWater) userInfo:nil repeats:NO];
    [self.gameplayParrentDelegate spawnRustyFromWater];
    
}



@end
