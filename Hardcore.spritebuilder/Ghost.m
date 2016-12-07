//
//  Ghost.m
//  Hardcore
//
//  Created by Pete Streem on 9/22/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "Ghost.h"
#import "CCBSequence.h"
//
//@interface Ghost ()
//
//@property CCNode *gogasfaf;
//@property NSInteger countOfEnemies;
//
//@end


@implementation Ghost {

    
    CCNode *ghostObject;
    CGPoint ghostInitialPosition;
    

 
}




//@implementation Ghost {
//
//    CCNode *ghostObject;
//    CGPoint ghostInitialPosition;
//
//
//}

// methods
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        
        ghostObject = [CCNode node];
        ghostObject = [CCBReader load:@"newLevels/level67/ghost3"];
        
//        CCMotionStreak *streak = [CCMotionStreak streakWithFade:0.3 minSeg:1 width:15 color:[CCColor colorWithCcColor3b:ccc3(255, 255, 255)] textureFilename:@"rustyFollowBack.png"];
        
        
        [self addChild:ghostObject];
//        [ghostObject addChild:streak];
        
        
    }
    return self;
}



-(void) toggleVisible:(CGPoint)startPoint{
    
    ghostInitialPosition = startPoint;
//    self.position = startPoint;
    self.position = ccp(0, -500);
    
    
//    self.visible = NO;
//    ghostObject.physicsBody.sleeping = YES;
    
}

-(void) makeGhostDissapear {
    
    
    [self stopAllActions];
//    CCActionMoveTo *moveAction = [CCActionMoveTo actionWithDuration:0.5 position:ccp(ghostInitialPosition.x, ghostInitialPosition.y)];
//    [self runAction:moveAction];
    
    
//    NSLog(@"ghostObject.animationManager.runningSequence.time = %f", ghostObject.animationManager.runningSequence.time);
    
//    if(ghostObject.animationManager.runningSequence.time != 0){
//    }
    
    
    [ghostObject.animationManager jumpToSequenceNamed:@"timeline" time:0.44];
    [ghostObject.animationManager setPlaybackSpeed:-1.0f];
    
    
//
    
    
     [self runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], [CCActionCallFunc actionWithTarget:self selector:@selector(moveGhostOut)], nil]];
    
}


-(void) moveGhostOut{
    self.position = ccp(0, -500);
}


-(void) makeGhostAppear{
    
    [ghostObject.animationManager setPlaybackSpeed:1.0f];

    
    [ghostObject.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
    [ghostObject.animationManager runAnimationsForSequenceNamed:@"timeline"];
    
    self.position = ghostInitialPosition;
    
    
    
    
    
    
    
    [ghostObject.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
        
    

        
//        [self runAction:[CCActionRepeatForever actionWithAction:seq]];
//        [self runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], [CCActionRepeatForever actionWithAction:seq], nil]];
        
        
        
        [ghostObject.animationManager jumpToSequenceNamed:@"timeline" time:0.73];
        
//        NSLog(@"Jumped and time = %f", ghostObject.animationManager.runningSequence.time);
//    [ghostObject.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
    }];
 
    
    [self runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:0.73], [CCActionCallFunc actionWithTarget:self selector:@selector(startGhostAnimation)], nil]];
    
   
    
}


-(void) startGhostAnimation{
    CCActionMoveTo *moveAction = [CCActionMoveTo actionWithDuration:0.49 position:ccp(ghostInitialPosition.x + 75, ghostInitialPosition.y)];
    CCActionMoveTo *moveBackAction = [CCActionMoveTo actionWithDuration:0.49 position:ccp(ghostInitialPosition.x, ghostInitialPosition.y)];
    
    //        id moveWithEase = [CCActionEaseInOut actionWithAction:moveAction rate:2];
    //        id moveWithEaseBack = [CCActionEaseInOut actionWithAction:moveBackAction rate:2];
    
    //        CCActionSequence *seq = [CCActionSequence actions:moveWithEase, moveWithEaseBack, nil];
    
    
    CCActionSequence *seq = [CCActionSequence actions:moveAction, moveBackAction, nil];
    
    [self runAction:[CCActionRepeatForever actionWithAction:seq]];
}

@end
