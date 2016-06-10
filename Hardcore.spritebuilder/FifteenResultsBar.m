//
//  FifteenResultsBar.m
//  Hardcore
//
//  Created by Pete Streem on 3/29/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "FifteenResultsBar.h"
#import "FifteenItem.h"

@implementation FifteenResultsBar{
    CCNodeColor *_bg;
    
    CCLabelTTF *_fifteenTimeTxt;
    CCLabelTTF *_fifteenDeathTxt;
    CCLabelTTF *_fifteenMovesTxt;

    
    CCSprite *_star1;
    CCSprite *_star2;
    CCSprite *_star3;
    
    CCSprite *_star1_red;
    CCSprite *_star2_red;
    CCSprite *_star3_red;
    
    int totalStars;
    
}

    - (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.fifteenTimeMinutes = 0;
        self.fifteenTimeSeconds = 0;
        self.fifteenDeath = 0;
        self.fifteenMoves = 0;
        

        
        totalStars = 0;
        
    }
    return self;
}



-(void)didLoadFromCCB{

    self.position = ccp(self.position.x, -68);
    
    _fifteenTimeTxt.position = ccp(_fifteenTimeTxt.position.x, _fifteenTimeTxt.position.y-68*2);
    _fifteenDeathTxt.position = ccp(_fifteenDeathTxt.position.x, _fifteenDeathTxt.position.y-68*2);
    _fifteenMovesTxt.position = ccp(_fifteenMovesTxt.position.x, _fifteenMovesTxt.position.y - 68*2);
    
    
    _star1 = [[CCSprite alloc] initWithImageNamed:@"bigstar.png"];
    _star2 = [[CCSprite alloc] initWithImageNamed:@"bigstar.png"];
    _star3 = [[CCSprite alloc] initWithImageNamed:@"bigstar.png"];
    
    _star1_red = [[CCSprite alloc] initWithImageNamed:@"bigredstar.png"];
    _star2_red = [[CCSprite alloc] initWithImageNamed:@"bigredstar.png"];
    _star3_red = [[CCSprite alloc] initWithImageNamed:@"bigredstar.png"];
    
    _star1_red.scale = 0.25;
    _star2_red.scale = 0.25;
    _star3_red.scale = 0.25;
    
    _star1.scale = 0.5;
    _star2.scale = 0.5;
    _star3.scale = 0.5;
    
    _star1.position = ccp([[CCDirector sharedDirector] viewSize].width/2-40, [[CCDirector sharedDirector] viewSize].height/2+90);
    _star2.position = ccp([[CCDirector sharedDirector] viewSize].width/2, [[CCDirector sharedDirector] viewSize].height/2+90);
    _star3.position = ccp([[CCDirector sharedDirector] viewSize].width/2+40, [[CCDirector sharedDirector] viewSize].height/2+90);
    
    _star1_red.position = _star1.position;
    _star2_red.position = _star2.position;
    _star3_red.position = _star3.position;
    
    _star1.opacity = 0;
    _star2.opacity = 0;
    _star3.opacity = 0;
    
    _star1_red.opacity = 0;
    _star2_red.opacity = 0;
    _star3_red.opacity = 0;
    
    _star1.rotation = 45;
    _star2.rotation = 10;
    _star3.rotation = 100;
    
    
    [self addChild:_star1_red];
    [self addChild:_star2_red];
    [self addChild:_star3_red];
    
    
    [self addChild:_star1];
    [self addChild:_star2];
    [self addChild:_star3];
    
    
    
    
}


-(void) startAnimation:(int)currentFifteenId {
 
    
    NSString *_myStr;
    
    
    _myStr = [NSString stringWithFormat:@"Death: %i", self.fifteenDeath];
    [_fifteenDeathTxt setString:_myStr];
    
    _myStr = [NSString stringWithFormat:@"Portal moves: %i", self.fifteenMoves];
    [_fifteenMovesTxt setString:_myStr];
    
    
    NSData *readItemData = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%d", currentFifteenId]];
    FifteenItem *readItem = [NSKeyedUnarchiver unarchiveObjectWithData:readItemData];
   
    
    if(self.fifteenTimeMinutes < readItem.fifteenEtaMinutesPassed.integerValue){
       
        _fifteenTimeTxt.color = [CCColor colorWithCcColor3b:ccc3(65, 156, 137)];
        totalStars++;
    
    } else if(self.fifteenTimeMinutes == readItem.fifteenEtaMinutesPassed.integerValue){
    
        if(self.fifteenTimeSeconds <= readItem.fifteenEtaSecondsPassed.integerValue){
        
            _fifteenTimeTxt.color = [CCColor colorWithCcColor3b:ccc3(65, 156, 137)];
            totalStars++;
        
        } else {
        
            _fifteenTimeTxt.color = [CCColor colorWithCcColor3b:ccc3(221, 87, 81)];
        
        }
    
    } else {
    
        _fifteenTimeTxt.color = [CCColor colorWithCcColor3b:ccc3(221, 87, 81)];
    
    }
    
    
    
    
    
    
    
    if(self.fifteenDeath <= readItem.fifteenEtaDeath.integerValue){
        //Прошел по смертям
        _fifteenDeathTxt.color = [CCColor colorWithCcColor3b:ccc3(65, 156, 137)];
        totalStars++;
    } else {
        //Не прошел по смертям
        _fifteenDeathTxt.color = [CCColor colorWithCcColor3b:ccc3(221, 87, 81)];
    }
    
    if(self.fifteenMoves <= readItem.fifteenEtaMoves.integerValue){
        //Прошел по ходам
        _fifteenMovesTxt.color = [CCColor colorWithCcColor3b:ccc3(65, 156, 137)];
        
        totalStars++;
    } else {
        //Не прошел по ходам
        _fifteenMovesTxt.color = [CCColor colorWithCcColor3b:ccc3(221, 87, 81)];
        
    }
    
    
    
    CCActionMoveTo *myMoveTo = [CCActionMoveTo actionWithDuration:1 position:ccp(self.position.x, 0)];
    CCActionEaseInOut *myEase = [CCActionEaseInOut actionWithAction:myMoveTo rate:4];
    
    [self runAction:myEase];
    
   
    CCActionDelay *myTimeDelay = [CCActionDelay actionWithDuration:0.1];
    
    CCActionMoveTo *myTimeMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenTimeTxt.position.x, 34)];
    CCActionEaseInOut *myTimeEase = [CCActionEaseInOut actionWithAction:myTimeMove rate:4];
    [_fifteenTimeTxt runAction:[CCActionSequence actions:myTimeDelay, myTimeEase, nil]];
    
    
    
    CCActionDelay *myDeathDelay = [CCActionDelay actionWithDuration:0.2];
    
    CCActionMoveTo *myDeathMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenDeathTxt.position.x, 34)];
    CCActionEaseInOut *myDeathEase = [CCActionEaseInOut actionWithAction:myDeathMove rate:4];
    [_fifteenDeathTxt runAction:[CCActionSequence actions:myDeathDelay, myDeathEase, nil]];
    
    
    CCActionDelay *myMoveDelay = [CCActionDelay actionWithDuration:0.3];
    
    CCActionMoveTo *myMovesMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenMovesTxt.position.x, 34)];
    CCActionEaseInOut *myMoveEase = [CCActionEaseInOut actionWithAction:myMovesMove rate:4];
    [_fifteenMovesTxt runAction:[CCActionSequence actions:myMoveDelay, myMoveEase, nil]];
    
    [self enableStars];
}


-(void) enableStars{
    
    [_star1_red runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:0.1], [CCActionFadeIn actionWithDuration:1], nil]];
    [_star2_red runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:0.2], [CCActionFadeIn actionWithDuration:1], nil]];
    [_star3_red runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:0.3], [CCActionFadeIn actionWithDuration:1], nil]];
    
    
    
    
    if(totalStars>=1){
        CCActionScaleTo *star1Scale = [CCActionScaleTo actionWithDuration:0.4 scale:0.25];
        CCActionEaseInOut *myScale1StarEase = [CCActionEaseIn actionWithAction:star1Scale rate:4];
        CCActionRotateTo *myStar1RotateBy = [CCActionRotateTo actionWithDuration:0.4 angle:0];
        CCActionEaseInOut *myRotateStar1Ease = [CCActionEaseIn actionWithAction:myStar1RotateBy rate:4];
        CCActionSpawn *myStar1Spawn = [CCActionSpawn actions:myScale1StarEase, myRotateStar1Ease, [CCActionFadeIn actionWithDuration:0.4], nil];
        [_star1 runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:0.2], myStar1Spawn, nil]];
        
    }
    
    if(totalStars>=2){
        
        CCActionScaleTo *star2Scale = [CCActionScaleTo actionWithDuration:0.4 scale:0.25];
        CCActionEaseInOut *myScale2StarEase = [CCActionEaseIn actionWithAction:star2Scale rate:4];
        CCActionRotateTo *myStar2RotateBy = [CCActionRotateTo actionWithDuration:0.4 angle:0];
        CCActionEaseInOut *myRotateStar2Ease = [CCActionEaseIn actionWithAction:myStar2RotateBy rate:4];
        CCActionSpawn *myStar2Spawn = [CCActionSpawn actions:myScale2StarEase, myRotateStar2Ease, [CCActionFadeIn actionWithDuration:0.4], nil];
        [_star2 runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:0.3], myStar2Spawn, nil]];
  
    }
    
    if(totalStars>=3){
        
        CCActionScaleTo *star3Scale = [CCActionScaleTo actionWithDuration:0.4 scale:0.25];
        CCActionEaseInOut *myScale3StarEase = [CCActionEaseIn actionWithAction:star3Scale rate:4];
        CCActionRotateTo *myStar3RotateBy = [CCActionRotateTo actionWithDuration:0.4 angle:0];
        CCActionEaseInOut *myRotateStar3Ease = [CCActionEaseIn actionWithAction:myStar3RotateBy rate:4];
        CCActionSpawn *myStar3Spawn = [CCActionSpawn actions:myScale3StarEase, myRotateStar3Ease, [CCActionFadeIn actionWithDuration:0.4], nil];
        [_star3 runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:0.4], myStar3Spawn, nil]];
    
    }
    
}


-(void) updateTime:(int)minutes andSeconds:(int)seconds {
    NSString *_myStr;
    
    _myStr = [NSString stringWithFormat:@"Time: %02i:%02i", minutes, seconds];
    [_fifteenTimeTxt setString:_myStr];
    
}


-(void) doneButton {
    
    [self.fifteenDelegate removeLevelFromView];
    
}


@end
