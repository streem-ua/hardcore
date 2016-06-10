//
//  FifteenCustomTab.m
//  Hardcore
//
//  Created by Pete Streem on 3/18/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "FifteenCustomTab.h"


@implementation FifteenCustomTab{
    CCNode *holder;
    
    CCSprite *lockedImage;
    
    CCSprite *locked;
    CCSprite *lockLeft;
    CCSprite *lockRight;
    CCSprite *unlocked;
    
    CCSprite *star;
    CCSprite *star2;
    CCSprite *star3;
    
    NSNumber *globalAvail;
    
    CCButton *overlayBtn;
    
    
    
    FifteenItem *currentFifteenData;
    int currentId;
}




- (instancetype)init
{
    self = [super init];
    if (self) {
        
        holder = [CCNode node];
        [self addChild:holder];
        
        overlayBtn = [CCButton node];
        
        overlayBtn.name = self.name;
        overlayBtn.anchorPoint = ccp(0.5, 0.5);
        overlayBtn.preferredSize = CGSizeMake(120,100);
        
        
        
        [overlayBtn setTarget:self selector:@selector(selfClicked:)];
        [self addChild:overlayBtn];
        
             
    }
    return self;
}





- (void)initWithId:(int)myId fifteenItem:(FifteenItem *)myFifteen{
    
    currentId = myId;
    
    currentFifteenData = myFifteen;
    
    NSString *unclokedFileName = [NSString stringWithFormat:@"active%d.png", myId];
   
    self.name = [NSString stringWithFormat:@"%i", myId];
    overlayBtn.name = self.name;
    
    holder.opacity = 0;
    [holder runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:3], [CCActionFadeIn actionWithDuration:0.3], nil]];
    
    globalAvail = myFifteen.isFifteenOpened;
//    unlocked
    
    
    
    
    
    if([globalAvail boolValue] != YES){
    
        lockedImage = [[CCSprite alloc] initWithImageNamed:@"locked1.png"];
        lockedImage.scale = 0.25;
        lockedImage.anchorPoint = ccp(0.5, 0.5);
        [holder addChild:lockedImage];
    
        lockLeft = [[CCSprite alloc] initWithImageNamed:@"lock_left.png"];
        lockLeft.scale = 0.25;
        lockLeft.anchorPoint = ccp(0.5, 0.5);
        lockLeft.position = ccp(-14, lockLeft.position.y);
        [holder addChild:lockLeft];
    
        lockRight = [[CCSprite alloc] initWithImageNamed:@"lock_right.png"];
        lockRight.scale = 0.25;
        lockRight.anchorPoint = ccp(0.5, 0.5);
        lockRight.position = ccp(14, lockRight.position.y);
        [holder addChild:lockRight];
    
    
    
        lockLeft.visible = NO;
        lockRight.visible = NO;
    
    
        locked = [[CCSprite alloc] initWithImageNamed:@"fullLock.png"];
        locked.scale = 0.25;
        locked.anchorPoint = ccp(0.5, 0.5);
        [holder addChild:locked];
        
        
    
    }
   
    
    
    unlocked = [[CCSprite alloc] initWithImageNamed:unclokedFileName];
    unlocked.scale = 0.25;
    unlocked.anchorPoint = ccp(0.5, 0.5);
    [holder addChild:unlocked];
    
    if([globalAvail boolValue] != YES){
        
        unlocked.opacity = 0;
        
    } else {
        
        unlocked.opacity = 1;
        
    }
    
    
    star = [[CCSprite alloc] initWithImageNamed:@"activeStar.png"];
    star.scale = 1;
    star.anchorPoint = ccp(0.5, 0.5);
    star.position = ccp(-18, -30);
    star.opacity = 0;
    star.rotation = 45;
    [holder addChild:star];
    
    
//    
//    NSLog(@"myFifteen.fifteenMoves.integerValue = %i", myFifteen.fifteenMoves.integerValue);
//    NSLog(@"myFifteen.fifteenDeath.integerValue = %i", myFifteen.fifteenDeath.integerValue);
//    NSLog(@"myFifteen.fifteenMinutesPassed.integerValue = %i", myFifteen.fifteenMinutesPassed.integerValue);
//    NSLog(@"myFifteen.fifteenSecondsPassed.integerValue = %i", myFifteen.fifteenSecondsPassed.integerValue);
    
    
    if(myFifteen.fifteenMoves.integerValue >= 0 && myFifteen.fifteenMoves.integerValue <= myFifteen.fifteenEtaMoves.integerValue){
        [self firstStarAppear];
    }
    
    
    star2 = [[CCSprite alloc] initWithImageNamed:@"activeStar.png"];
    star2.scale = 1;
    star2.anchorPoint = ccp(0.5, 0.5);
    star2.opacity = 0;
    star2.position = ccp(0, -30);
    star2.rotation = 60;
    [holder addChild:star2];
    
//    NSLog(@"myFifteen.fifteenDeath.intValue = %i", myFifteen.fifteenDeath.intValue);
    
    if(myFifteen.fifteenDeath.integerValue >= 0 && myFifteen.fifteenDeath.integerValue <= myFifteen.fifteenEtaDeath.integerValue){
        [self secondStarAppear];
    } 
    
    
    
    
    star3 = [[CCSprite alloc] initWithImageNamed:@"activeStar.png"];
    star3.scale = 1;
    star3.anchorPoint = ccp(0.5, 0.5);
    star3.opacity = 0;
    star3.position = ccp(18, -30);
    star3.rotation = 90;
    [holder addChild:star3];
    
    
    
    if(myFifteen.fifteenMinutesPassed.integerValue >= 0 && myFifteen.fifteenMinutesPassed.integerValue < myFifteen.fifteenEtaMinutesPassed.integerValue){
        
        
        [self thirdStarAppear];
        
        
      
    } else if(myFifteen.fifteenMinutesPassed.integerValue >= 0 && myFifteen.fifteenMinutesPassed.integerValue == myFifteen.fifteenEtaMinutesPassed.integerValue){
    
        
        
        if(myFifteen.fifteenSecondsPassed.integerValue <= myFifteen.fifteenEtaSecondsPassed.integerValue){
            
            [self thirdStarAppear];
            
        }
    
    }
    
}

-(void) selfClicked:(id)sender{
    
    locked.visible = NO;
    
    lockLeft.visible = YES;
    lockRight.visible = YES;
    
    
    if(globalAvail.intValue != 1){
        
    
    CCActionFadeOut *fadeOutLeft = [CCActionFadeOut actionWithDuration:0.5];
    CCActionMoveTo *moveToLeft = [CCActionMoveTo actionWithDuration:0.5 position:ccp(lockLeft.position.x - 20, lockLeft.position.y-10)];
    CCActionRotateBy *rotateByLeft = [CCActionRotateBy actionWithDuration:0.5 angle:-10];
    CCActionEaseInOut *myEaseMoveLeft = [CCActionEaseInOut actionWithAction:moveToLeft rate:3];
    CCActionEaseInOut *myEaseRotateLeft = [CCActionEaseInOut actionWithAction:rotateByLeft rate:3];
    CCActionSpawn *myLeftSpawn = [CCActionSpawn actions:myEaseMoveLeft, myEaseRotateLeft, fadeOutLeft, nil];
    
    [lockLeft runAction:myLeftSpawn];
    
    
    
    CCActionFadeOut *fadeOutRight = [CCActionFadeOut actionWithDuration:0.5];
    CCActionMoveTo *moveToRight = [CCActionMoveTo actionWithDuration:0.5 position:ccp(lockRight.position.x + 20, lockRight.position.y-10)];
    CCActionRotateBy *rotateByRight = [CCActionRotateBy actionWithDuration:0.5 angle:10];
    CCActionEaseInOut *myEaseMoveRight = [CCActionEaseInOut actionWithAction:moveToRight rate:3];
    CCActionEaseInOut *myEaseRotateRight = [CCActionEaseInOut actionWithAction:rotateByRight rate:3];
    CCActionSpawn *myRightSpawn = [CCActionSpawn actions:myEaseMoveRight, myEaseRotateRight, fadeOutRight, nil];
    
    [lockRight runAction:myRightSpawn];
    
    }
    
//    CCActionFadeIn *fadeIn = [CCActionFadeIn actionWithDuration:0.5];
//    CCActionDelay *myDelay = [CCActionDelay actionWithDuration:0.3];
//    [unlocked runAction:[CCActionSequence actions:myDelay, fadeIn, nil]];

    
    
    
    
    
    
    
    
    
    NSLog(@"Clicked");
    
    
    
    if([globalAvail boolValue] == YES){
        
        
        [self.mainMenuDelegate showStats:currentFifteenData andWithId:currentId];
        
        
        
    } else {
        
//        [self.mainMenuDelegate _fifteenBtn:overlayBtn];
        
    }
    
}

-(void) startDisolve {
    
}

-(void) firstStarAppear {
    CCActionScaleTo *starScale = [CCActionScaleTo actionWithDuration:0.4 scale:0.25];
    CCActionEaseInOut *myScaleStarEase = [CCActionEaseIn actionWithAction:starScale rate:3];
    CCActionRotateTo *myStarRotateBy = [CCActionRotateTo actionWithDuration:0.4 angle:0];
    CCActionEaseInOut *myRotateStarEase = [CCActionEaseIn actionWithAction:myStarRotateBy rate:3];
    CCActionDelay *myStarDelay = [CCActionDelay actionWithDuration:0.5];
    CCActionSpawn *myStarSpawn = [CCActionSpawn actions:myScaleStarEase, myRotateStarEase, [CCActionFadeIn actionWithDuration:0.4], nil];
    [star runAction:[CCActionSequence actions:myStarDelay, myStarSpawn, nil]];
}



-(void) secondStarAppear {
    CCActionScaleTo *star2Scale = [CCActionScaleTo actionWithDuration:0.4 scale:0.25];
    CCActionEaseInOut *myScale2StarEase = [CCActionEaseIn actionWithAction:star2Scale rate:3];
    CCActionRotateTo *myStar2RotateBy = [CCActionRotateTo actionWithDuration:0.4 angle:0];
    CCActionEaseInOut *myRotateStar2Ease = [CCActionEaseIn actionWithAction:myStar2RotateBy rate:3];
    CCActionDelay *myStar2Delay = [CCActionDelay actionWithDuration:0.6];
    CCActionSpawn *myStar2Spawn = [CCActionSpawn actions:myScale2StarEase, myRotateStar2Ease, [CCActionFadeIn actionWithDuration:0.4], nil];
    [star2 runAction:[CCActionSequence actions:myStar2Delay, myStar2Spawn, nil]];
}



-(void) thirdStarAppear {
    CCActionScaleTo *star3Scale = [CCActionScaleTo actionWithDuration:0.4 scale:0.25];
    CCActionEaseInOut *myScale3StarEase = [CCActionEaseIn actionWithAction:star3Scale rate:3];
    CCActionRotateTo *myStar3RotateBy = [CCActionRotateTo actionWithDuration:0.4 angle:0];
    CCActionEaseInOut *myRotateStar3Ease = [CCActionEaseIn actionWithAction:myStar3RotateBy rate:3];
    CCActionDelay *myStar3Delay = [CCActionDelay actionWithDuration:0.7];
    CCActionSpawn *myStar3Spawn = [CCActionSpawn actions:myScale3StarEase, myRotateStar3Ease, [CCActionFadeIn actionWithDuration:0.4], nil];
    [star3 runAction:[CCActionSequence actions:myStar3Delay, myStar3Spawn, nil]];

}


-(void) _fifteenBtn:(CCButton *)sender{
    
    
    if([globalAvail boolValue] == YES){
    
        
        //show down popup
        
        
        
    } else {
        
        [self.mainMenuDelegate _fifteenBtn:sender];

    }
    
    
    
}


@end
