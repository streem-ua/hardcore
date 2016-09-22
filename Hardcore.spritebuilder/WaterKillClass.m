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
    
    
    
    
    self.position = ccp(256, 0);
    self.imageWaves.position = ccp(256, -180.4);
    
    
    NSTimer *initWaterUpTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(runWater) userInfo:nil repeats:NO];
    
    
    CCActionMoveTo *moveWater = [CCActionMoveTo actionWithDuration:10 position:ccp(-256, self.position.y)];
    CCActionMoveTo *moveWaterNull = [CCActionMoveTo actionWithDuration:0 position:ccp(256, self.position.y)];
    CCActionSequence* leftAndRight = [CCActionSequence actions:moveWater, moveWaterNull, nil];
    [self runAction:[CCActionRepeatForever actionWithAction:leftAndRight]];
   
    
    
    
    
    
//    id actionSpaw = [CCActionSpawn actions:
//                     leftAndRight,
//                     upAndDown,
//                     nil];
    
    
    

    [self runAction:[CCActionRepeatForever actionWithAction:leftAndRight]];
    
    
//    [self runAction:[CCActionRepeatForever actionWithAction:moveWaterUp]];
    
    
    
    
    
    
    
}



-(void) runWater {
    
    CCActionMoveTo *moveWaterUp = [CCActionMoveTo actionWithDuration:7 position:ccp(256, self.imageWaves.position.y+200)];
    CCActionMoveTo *moveWaterDown = [CCActionMoveTo actionWithDuration:2 position:ccp(256, -180.4)];
    id delay = [CCActionDelay actionWithDuration: 3];
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
