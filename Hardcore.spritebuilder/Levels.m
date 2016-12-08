//
//  Levels.m
//  Hardcore
//
//  Created by Admin on 26/01/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Levels.h"
#import "FallPlatform.h"
#import "TypewriteTxt.h"
#import "FifteenItem.h"
#import "MyBoss.h"
#import "CCBSequence.h"
#import "MovingPlatform.h"
#import "UIDeviceHardware.h"

@implementation Levels {
    
    UIDeviceHardware *uiDeviceHardware;
    
    CGFloat rustyX;
    CGFloat rustyY;
    
    CCNode *_gun;
    
    CCNode *_bullet;
    
    //    CCSprite *_rightPortal;
    //    CCSprite *_leftPortal;
    //    CCSprite *_upPortal;
    //    CCSprite *_downPortal;
    
    CCNode *_freezeNodes;
    
    CCNode *_background;
    CCNode *_background1;
    
    CCNode *movedown;
    CCNode *moveup;
    CCNode *moveleft;
    CCNode *moveright;
    
    CCNode *crystalExplode;
    
    BOOL moveReached;
    
    CCNode *platformCatch;
    CCNode *platformReverse;
    
    CCNode *_test;
    
    
    FallPlatform *invisibleFall;
    
    BOOL platformCatchStarted;
    BOOL platformReverseStarted;
    
    BOOL portalUpAnimating;
    BOOL portalDownAnimating;
    BOOL portalLeftAnimating;
    BOOL portalRightAnimating;
    
    
    BOOL downPortalReached;
    BOOL afterReachedTrigger;
    
    
    BOOL invisibleFallActivated;
    CGPoint invisibleFallInitPos;
    
    CCNode *_speedIndicator;
    CCNode *_ghostAppear;
    
    
    CCNode *_govnoContainer1;
    CCNode *_govnoContainer2;
    CCNode *_govnoContainer3;
    CCNode *_govnoContainer4;
    CCNode *_govnoContainer5;

    BOOL showFirstMovingPlatform;
    BOOL showSecondMovingPlatform;
    BOOL showThirdMovingPlatform;
    BOOL showFourthMovingPlatform;
    BOOL showFifthMovingPlatform;

    BOOL _changeGravity;
    BOOL _defaultGravity;
    
    CCNode *_portalIdle;
    CCNode *_portalIdle2;
    CCNode *_portalIdle3;
    CCNode *_portalIdle4;
    CCNode *_portalIdle5;
    CCNode *_portalIdle6;
    CCNode *_portalIdle7;
    CCNode *_portalIdle8;
    CCNode *_portalIdle9;
    CCNode *_portalIdle10;
    CCNode *_portalIdle11;
    CCNode *_portalIdle12;
    CCNode *_portalIdle13;
    
    
    CCNode *_portalStart;
    CCNode *_portalIdleStart;
    
    CCNode *_portalFinish;
    CCNode *_portalFinish2;
    CCNode *_portalFinish3;
    CCNode *_portalFinish4;
    CCNode *_portalFinish5;
    CCNode *_portalFinish6;
    CCNode *_portalFinish7;
    CCNode *_portalFinish8;
    CCNode *_portalFinish9;
    CCNode *_portalFinish10;
    CCNode *_portalFinish11;
    CCNode *_portalFinish12;
    CCNode *_portalFinish13;
    
    int currentActivePortal;
    
    
    
    CCNode *lineHolder;
    BOOL portalEnabled;
    
    
    CCSprite *_blendingMask;
    
    
    NSTimer *rustyMovingTimer;
    
    CCNode *tmpNode;
    MyBoss *_boss;
    CCNode *_bossCustom;
    
    
    
    /* TUTORIAL */
    
    
    
    TypewriteTxt *_txt1;
    TypewriteTxt *_txt2;
    TypewriteTxt *_txt3;
    TypewriteTxt *_txt4;
    TypewriteTxt *_txt5;
    TypewriteTxt *_txt6;
    TypewriteTxt *_txt7;
    TypewriteTxt *_txt8;
    TypewriteTxt *_txt81;
    TypewriteTxt *_txt9;
    TypewriteTxt *_txt10;
    
    
    TypewriteTxt *_txt21;
    TypewriteTxt *_txt22;
    TypewriteTxt *_txt23;
    
    TypewriteTxt *_txt31;
    TypewriteTxt *_txt32;
    TypewriteTxt *_txt33;
    
    TypewriteTxt *_txt51;
    TypewriteTxt *_txt52;
    
    TypewriteTxt *_txt34;
    
    TypewriteTxt *_txt41;
    TypewriteTxt *_txt42;
    
    BOOL levelFinishedLoading;
    BOOL bossDefeated;
    
    BOOL _speedContainer1Catched;
    BOOL _speedContainer2Catched;
    BOOL _speedContainer3Catched;
    BOOL _speedContainer4Catched;
    BOOL _speedContainer5Catched;
    
    CCNode *_movingPlatform;
    
    
    float stoppedAnimationTime;
    BOOL freezeEnabled;
    BOOL freezeTimelineReturned;
    
    CCNode *_speedContainer1;
    CCNode *_speedContainer2;
    CCNode *_speedContainer3;
    CCNode *_speedContainer4;
    CCNode *_speedContainer5;
    
    CCNode *_ghostContainer;
    CCNode *_ghostContainer1;
    CCNode *_ghostContainer2;
    CCNode *_ghostContainer3;
    
    CCNode *_ghost;
    CCNode *_ghost1;
    CCNode *_ghost2;
    
//    CCNode *_lastContainer;
//    CCNode *_lastContainer2;
    CCNode *_naebuteb9;
    
    BOOL _lastContainerCathed;
    BOOL _lastContainerCathed2;
    BOOL _lastContainerCathed3;
    BOOL _lastContainerCathed4;
    BOOL _lastContainerCathed5;
    
//    CCNode *_speedIndicator;
    
    CCNode *_finishLevel;
    BOOL levelFinished;
    
    
    BOOL _ghost1Enabled;
    BOOL _ghost2Enabled;
    
    CCNode *_countdownTexture;
    CCNode *_countdownButton;
    CCLabelTTF *_countdownTimer;
    NSTimer *countDowntimer;
    int currMinute;
    int currSeconds;
    
    CCNode *_boom;
    CCNode *_tnt;
    CCNode *_tntRestart;
    
    CCNode *_finalPlatform;
    
    CCNode *_gravityLight;
    CCNode *_gravityLight2;
    CCNode *_door;
    CCNode *_door2;
    CCNode *_leverArm;
    CCNode *_leverArm2;
    CCNode *_leverArm3;
    
    
    CCNode *_flash;
    CCNode *_finish;
    
    BOOL _flashCatched;
    
    BOOL tntCatched;

    
    CCNode *_bossFlash;
    CCNode *_bossFinish;
    
    BOOL _bossFlashCatched;
    BOOL _bossFinishCatched;
    
    
    
    }


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _bossFlashCatched = NO;
        _bossFinishCatched = NO;
        
        levelFinishedLoading = NO;
         _speedContainer1Catched = NO;
         _speedContainer2Catched = NO;
         _speedContainer3Catched = NO;
         _speedContainer4Catched = NO;
        
        _lastContainerCathed = NO;
        _lastContainerCathed2 = NO;
        _lastContainerCathed3 = NO;
        _lastContainerCathed4 = NO;
        _lastContainerCathed5 = NO;
        
        uiDeviceHardware = [[UIDeviceHardware alloc] init];
        
        showFirstMovingPlatform = NO;
        showSecondMovingPlatform = NO;
        showThirdMovingPlatform = NO;
        showFourthMovingPlatform = NO;
        showFifthMovingPlatform = NO;
        
        _changeGravity = NO;
        _defaultGravity = NO;
        _flashCatched = NO;
        
        tntCatched = NO;
        
        levelFinished = NO;
    }
    return self;
}



-(void) switchOffLightningEffect {
    
    for(CCSprite *mySprite in [self children]) {
        
        
        if([mySprite isKindOfClass:[CCSprite class]]){
            //            if(mySprite.normalMapSpriteFrame){
            mySprite.effect = NULL;
            mySprite.effect = nil;
            
            //            }
        }
        
    }
    
}


- (void)didLoadFromCCB {
    


    
    
    
    
//
    
    _bossFinish.visible = NO;
    _bossFinish.scale = 0.5;
    
    _tnt.visible = NO;
    _countdownButton.visible = NO;
    _finalPlatform.visible = YES;

//    [_finalPlatform stopAllActions];
    
    _background.scale = 1.05;
    _background.anchorPoint = ccp(0, 0);
    _background.position = ccp(0, 0);
    _background1.scale = 1.05;
    _background1.anchorPoint = ccp(0, 0);
    _background1.position = ccp(0, 0);
    
    CCActionFadeTo *fade1 = [CCActionFadeTo actionWithDuration:1.5 opacity:0.33];
    CCActionDelay *delay = [CCActionDelay actionWithDuration:1.5];
    CCActionFadeTo *fade2 = [CCActionFadeTo actionWithDuration:1 opacity:1];
    NSLog(@"RABOTAEMDALWE");
    CCActionSequence *mysequence = [CCActionSequence actions:fade1, delay, fade2, delay, nil];
    [_background runAction:[CCActionRepeatForever actionWithAction:mysequence]];
//
    
    
//    CCEffectPixellate *pix = [CCEffectPixellate effectWithBlockSize:2];
//    CCSprite *pix1 = _background1.children[0];
//    _background1.effect = pix;
    
    currMinute=0;
    currSeconds=35;
    if(_tnt){
      countDowntimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countdowntimerFired) userInfo:nil repeats:YES];
    }

//    _countdownTimer.fontColor = [CCColor colorWithCcColor3b:ccc3(215, 215, 0)];
    _countdownTimer.shadowColor = [CCColor colorWithCcColor3b:ccc3(255, 255, 160)];
    _countdownTimer.shadowBlurRadius = 2;
    
   // NSLog(@"-----000000 THE GREAT LEVELS DIDLOAD");
    
    [_tntRestart.animationManager runAnimationsForSequenceNamed:@"timeline"];
    CCActionDelay *tntDelay = [CCActionDelay actionWithDuration:5];
    id done2 = [CCActionCallBlock actionWithBlock:^{
        _tntRestart.visible = NO;
        _tnt.visible = YES;
        _countdownButton.visible = YES;
        
        
    }];
    
    [_tnt runAction:[CCActionSequence actions:tntDelay, done2, nil]];

    
    
    stoppedAnimationTime = 0;
    freezeEnabled = NO;
    freezeTimelineReturned = YES;
    //[self.gameplayParrentDelegate testFunc];
    
    bossDefeated = NO;
    
    _finalPlatform.position = ccp(1488.0, 400.0);

    
    if(currMinute>-1){
        
        CCActionDelay *tntDelay3 = [CCActionDelay actionWithDuration:0.5];
        _countdownTimer.visible = YES;
        
        id done2 = [CCActionCallBlock actionWithBlock:^{
            
            _countdownTimer.visible = NO;
            
            
        }];
        [_tnt runAction:[CCActionSequence actions:tntDelay3, done2, nil]];
        
        [_countdownTimer setString:[NSString stringWithFormat:@"%d:%d", currMinute, currSeconds]];
        
    }

    
    
    if(_countdownTexture){
        CCActionMoveTo *moveaction = [CCActionMoveTo actionWithDuration:35 position:ccp(455.3, 407.6)];
        [_countdownTexture runAction:moveaction];
        
        
        CCActionDelay *tntDelay3 = [CCActionDelay actionWithDuration:0.1];
        
//        _countdownTimer.visible = NO;
        
        
        id done2 = [CCActionCallBlock actionWithBlock:^{
            
//            CCActionFadeIn *_countdownTimerFadein = [CCActionFadeIn actionWithDuration:0];
//            CCActionFadeOut *_countdownTimerFadeOut = [CCActionFadeOut actionWithDuration:0];
//            CCActionDelay *tntDelay2 = [CCActionDelay actionWithDuration:1];
//            CCActionSequence *_countdownTimerS = [CCActionSequence actions:_countdownTimerFadein, tntDelay2, _countdownTimerFadeOut,  nil];
            
//            NSLog(@"asdasd");
            
//            [_countdownTimer runAction:[CCActionRepeatForever actionWithAction: _countdownTimerS]];
//            [_countdownTimer runAction:_countdownTimerS];
            
            
//            
//            CCActionBlink *blink = [CCActionBlink actionWithDuration:30 blinks:30];
//            [_countdownTimer runAction:blink];
            
        }];
        [_tnt runAction:[CCActionSequence actions:tntDelay3, done2, nil]];
        
        

        
    } else {
        NSLog(@"not found");
    }
    
    if(_countdownButton){
        CCActionDelay *delayaction = [CCActionDelay actionWithDuration:34];
        CCActionMoveTo *moveaction = [CCActionMoveTo actionWithDuration:1 position:ccp(441.2, 240.7)];
        
        [_countdownButton runAction:[CCActionSequence actions:delayaction, moveaction, nil]];
    } else {
        NSLog(@"not found");
    }

    _boom.visible = NO;
//    _tntRestart.visible = NO;
    
    
    
    self.leftFirstPressed = NO;
    self.rightFirstPressed = NO;
    self.firstDoubleJump = NO;
    
    self.arrow1.visible = NO;
    
    self.allowRustyMoveTutorial = YES;
    
    //    movedown.physicsBody
    
    //    movedown.physicsBody.type = CCPhysicsBodyTypeStatic
    
    for (CCNode* child in movedown.children)
    {
        if (child.physicsBody.type == CCPhysicsBodyTypeStatic)
        {
            
            //            NSLog(@"CCPhysicsBodyTypeStatic FOUND");
            //            child.physicsBody.sensor = YES;
            
        }
    }
    
   // CGFloat intensity = 1;
    
    //    _playerLight.visible = NO;
    
   // _playerLight.intensity = intensity;
    //_playerLight.specularIntensity = intensity / 2;  //Karamelnost
//    _playerLight.specularIntensity = 0.05;
//    _playerLight.depth = 50;
//    
//    _playerLight.ambientIntensity = 0.15;
//    
//    _playerLight.halfRadius = 0.7;
//    _playerLight.cutoffRadius = 130.4;
//    
    currentActivePortal = 0;
    
    //_playerLight.position = ccp(50, 100);
    
    
    
    //    CCActionMoveBy* actionMoveF = [CCActionMoveTo actionWithDuration:4.0f position: ccp(256,145)];
    //    CCActionMoveBy* actionMoveR = [CCActionMoveTo actionWithDuration:4.0f position: ccp(317,145)];
    //    CCActionSequence *seq = [CCActionSequence actionWithArray: @[actionMoveF, actionMoveR]];
    //    [_movingPlatform runAction:[CCActionRepeatForever actionWithAction: seq]];
    //
    
    //    _bullet = [CCBReader load:@"levels/spikes/bullet"];
    //    _bullet.position = ccp(487, 105);
    //    [self addChild:_bullet];
    
    portalUpAnimating = false;
    portalDownAnimating = false;
    portalLeftAnimating = false;
    portalRightAnimating = false;
    
    downPortalReached = NO;
    
    
    [movedown.animationManager setPaused:YES];
    [moveup.animationManager setPaused:YES];
    [moveright.animationManager setPaused:YES];
    [moveleft.animationManager setPaused:YES];
    
    
    [platformCatch.animationManager setPaused:YES];
    [platformReverse.animationManager setPaused:YES];
    
    
    platformCatchStarted = NO;
    platformReverseStarted = NO;
    invisibleFallActivated = NO;
    invisibleFall.physicsBody.sensor = YES;
    
    
    
    
    invisibleFall.opacity = 0;
    invisibleFallInitPos = invisibleFall.position;
    
    
    portalEnabled = NO;
    
    
    lineHolder = [[CCNode alloc] init];
    [self addChild:lineHolder];
    
    
    
    //_portalIdle.visible = NO;
    _portalFinish.visible = NO;
    _portalFinish2.visible = NO;
    _portalFinish3.visible = NO;
    _portalFinish4.visible = NO;
    _portalFinish5.visible = NO;
    _portalFinish6.visible = NO;
    _portalFinish7.visible = NO;
    _portalFinish8.visible = NO;
    _portalFinish9.visible = NO;
    _portalFinish10.visible = NO;
    _portalFinish11.visible = NO;
    _portalFinish12.visible = NO;
    _portalFinish13.visible = NO;

    [self hideAllPortals];
    
    _portalStart.visible = NO;
    _portalIdleStart.visible = NO;
    
    afterReachedTrigger = NO;
        
    //[_leftPortal.animationManager stop]
    
    _ghost.visible = NO;
    _ghost1.visible = NO;
    _ghost2.visible = NO;

    
    
    _blendingMask.opacity = 1;
    self._rustyMask.opacity = 0.90;
    //self._rustyMask.position = _rustyPosition.position;
    
    
    
    self._rustyMask.blendMode = [CCBlendMode premultipliedAlphaMode];
    _blendingMask.blendMode = [CCBlendMode premultipliedAlphaMode];
    
    
    
    rustyX = _rustyPosition.position.x;
    rustyY = _rustyPosition.position.y;
    
    
   
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveRustyMask) userInfo:nil repeats:YES];
    
    
    crystalExplode = [CCBReader load:@"newLevels/crystal/crystal_action"];
    [self addChild:crystalExplode];
    
    crystalExplode.visible = NO;
    self.fifteenEnabled = NO;
    
    
    
    
    
    self.portalFirstReached = NO;
    
    //_txt1.visible = NO;
    _txt1.levelDelegate = self;
    _txt2.levelDelegate = self;
    _txt3.levelDelegate = self;
    _txt4.levelDelegate = self;
    _txt5.levelDelegate = self;
    _txt6.levelDelegate = self;
    _txt7.levelDelegate = self;
    _txt8.levelDelegate = self;
    _txt81.levelDelegate = self;
    _txt9.levelDelegate = self;
    _txt10.levelDelegate = self;
    
    _txt21.levelDelegate = self;
    _txt22.levelDelegate = self;
    _txt23.levelDelegate = self;
    
   
    _txt31.levelDelegate = self;
    _txt32.levelDelegate = self;
    _txt33.levelDelegate = self;
    
    
    _txt51.levelDelegate = self;
    _txt52.levelDelegate = self;
    _txt41.levelDelegate = self;
    _txt42.levelDelegate = self;
    
    
    //[self.gameplayParrentDelegate spawnRusty:self.getRustyPos];
    
    _rustyPosition.visible = NO;
    
    _ghost.visible = NO;
    _ghost1.visible = NO;
    _ghost2.visible = NO;
    
    _finish.visible = NO;
    
    if (self.gameplayParrentDelegate.globalLevelNumber == 52) {
        CCSprite *test1 = _test.children[0];
        test1.visible = NO;
        NSLog(@"NORMALMAPSUKAPIDAR");
    }
    
  
    //    self.position = ccp(20, 20);
    
}



-(void)setRustyPosition:(CGPoint) newPosition{
    _rustyPosition.position = newPosition;
    
}


-(CGPoint)getRustyPosition{
    return _rustyPosition.position;
    
}

-(void) hideAllPortals{
    _portalIdle3.visible = NO;
    _portalIdle4.visible = NO;
    _portalIdle5.visible = NO;
    _portalIdle6.visible = NO;
    _portalIdle7.visible = NO;
    _portalIdle8.visible = NO;
    _portalIdle9.visible = NO;
    _portalIdle10.visible = NO;
    _portalIdle11.visible = NO;
    _portalIdle12.visible = NO;
    _portalIdle13.visible = NO;
}

-(void) moveRustyMask{
    
    
    if(!self.fifteenEnabled && !self.gameplayParrentDelegate.rustyIsDead && self.gameplayParrentDelegate.rusty.visible && !self.gameplayParrentDelegate.newLevelLoading){
        
        CCActionMoveTo *moveTo;
        
        
        
        if(self.levelFlipped){
            moveTo = [CCActionMoveTo actionWithDuration:0.2 position:ccp(512-rustyX, rustyY)];
        } else {
            moveTo = [CCActionMoveTo actionWithDuration:0.2 position:ccp(rustyX, rustyY)];
        }
        
        
        
        //        CCActionMoveTo *moveBack = [CCActionMoveTo actionWithDuration:0.5 position:ccp(_rustyMask.position.x - 30, _rustyMask.position.y - 20)];
        
        id ease1 = [CCActionEaseInOut actionWithAction:moveTo rate:2];
        //        id ease2 = [CCActionEaseBackInOut actionWithAction:moveBack];
        //
        //        CCActionSequence *pulseSequence = [CCActionSequence actionOne:ease1 two:ease2];
        //
        //        CCActionRepeatForever *repeat = [CCActionRepeatForever actionWithAction:pulseSequence];
        
        [self._rustyMask runAction:ease1];
    } else {
        //NSLog(@"GOT IT");
        //self._rustyMask.position = _rustyPosition.position;
    }
    
   
    
}


-(CGPoint)getRustyPos{
    _rustyPosition.visible = NO;
    return _rustyPosition.position;
    
}


-(void) animateCatchPlatform {
    
    [platformCatch.animationManager runAnimationsForSequenceNamed:@"timeline"];
    
    
    [platformCatch.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
        CCAnimationManager *animationManager = sender;
        if ([animationManager.lastCompletedSequenceName isEqualToString:@"timeline"]) {
            platformCatchStarted = NO;
        }
    }];
    
}


-(void) animateReversePlatform {
    [platformReverse.animationManager runAnimationsForSequenceNamed:@"timeline"];
    
    [platformReverse.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
        CCAnimationManager *animationManager = sender;
        if([animationManager.lastCompletedSequenceName isEqualToString:@"timeline"]){
            platformReverseStarted = NO;
        }
    }];
    
}

-(void) makePortalExplode:(id)object withSelector:(SEL)selector {
    
    if(portalDownAnimating){
        //        [movedownAction.animationManager runAnimationsForSequenceNamed:@"timeline"];
        //        [movedownAction.animationManager jumpToSequenceNamed:@"timeline" time:1.0];
        //
        //        movedown.visible = NO;
        //        movedownAction.visible = YES;
        //
        //        [movedownAction.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
        //            CCAnimationManager *animationManager = sender;
        //            if ([animationManager.lastCompletedSequenceName isEqualToString:@"timeline"]) {
        //
        //                [object performSelector:selector withObject:object];
        //
        //
        //                movedown.visible = YES;
        //                movedownAction.visible = NO;
        //
        //            }
        //        }];
        
    }
    
    
    if(!portalUpAnimating){
        
    }
    
    if(!portalLeftAnimating){
        
    }
    
    
    if(!portalRightAnimating){
        
    }
    
}

-(void) animatePortal:(int)portalId{
    
    
    
    switch (portalId) {
        case 1:
            if(!portalDownAnimating){
                
                if(!downPortalReached){
                    [movedown.animationManager runAnimationsForSequenceNamed:@"timeline"];
                    portalDownAnimating = YES;
                } else {
                    
                    //                    [movedown.animationManager runAnimationsForSequenceNamed:@"timeline"];
                    
                    [movedown.animationManager setPaused:YES];
                    
                }
                
                
                
                //                [movedownAction.animationManager runAnimationsForSequenceNamed:@"timeline"];
                //                movedown.visible = NO;
                //                movedownAction.visible = YES;
                
                
            }
            
            break;
            
        case 2:
            if(!portalUpAnimating){
                [moveup.animationManager runAnimationsForSequenceNamed:@"timeline"];
                portalUpAnimating = YES;
            }
            break;
            
        case 3:
            if(!portalLeftAnimating){
                [moveleft.animationManager runAnimationsForSequenceNamed:@"timeline"];
                portalLeftAnimating = YES;
            }
            
            break;
            
        case 4:
            if(!portalRightAnimating){
                [moveright.animationManager runAnimationsForSequenceNamed:@"timeline"];
                portalRightAnimating = YES;
            }
            
            break;
            
            
            
        default:
            break;
    }
    
    if(portalDownAnimating){
        [movedown.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
            CCAnimationManager *animationManager = sender;
            if ([animationManager.lastCompletedSequenceName isEqualToString:@"timeline"]) {
                portalDownAnimating = NO;
            }
        }];
    }
    
    
    if(portalUpAnimating){
        [moveup.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
            CCAnimationManager *animationManager = sender;
            if ([animationManager.lastCompletedSequenceName isEqualToString:@"timeline"]) {
                portalUpAnimating = NO;
            }
        }];
    }
    
    if(portalLeftAnimating){
        [moveleft.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
            CCAnimationManager *animationManager = sender;
            if ([animationManager.lastCompletedSequenceName isEqualToString:@"timeline"]) {
                portalLeftAnimating = NO;
            }
        }];
    }
    
    if(portalRightAnimating){
        [moveright.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
            CCAnimationManager *animationManager = sender;
            if ([animationManager.lastCompletedSequenceName isEqualToString:@"timeline"]) {
                portalRightAnimating = NO;
            }
        }];
    }
    
    
    
    
    
}



//- (void)showFifteenFromGame:(NSTimer*)theTimer {
//    
//    
//    if(self.gameplayParrentDelegate.portalTimerCreated){ 
//     
//        NSString *moveDirection = (NSString*)[theTimer userInfo];
//        [self.gameplayParrentDelegate showFifteenFromGameNew:[moveDirection intValue]];
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//}



-(void) showFifteenTotalStats{
    
    [self.gameplayParrentDelegate showFifteenFinalStats];

    
}


-(void) update:(CCTime)delta{
    
    
    ///**** BOSS CATCH
    
    if(!_bossFlashCatched && CGRectContainsPoint(CGRectMake(_bossFlash.position.x - 70/2, _bossFlash.position.y - 70/2, 70, 70), ccp(rustyX, rustyY)) && !self.gameplayParrentDelegate._ifLevelsPressed){
        
        _bossFlashCatched = YES;
        
        _bossFlash.visible = NO;
         _bossFinish.visible = YES;
        
        [_bossFinish.animationManager jumpToSequenceNamed:@"timeline" time:0];
        [_bossFinish.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
       
        id scaleUpAction = [CCActionScaleTo actionWithDuration:0.1 scaleX:0 scaleY:0];
        id alphaAction = [CCActionFadeOut actionWithDuration:0.1];
        id moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_bossFlash.position.x, _bossFlash.position.y)];
        
        [self.gameplayParrentDelegate.rusty runAction:alphaAction];
        [self.gameplayParrentDelegate.rusty runAction:scaleUpAction];
        [self.gameplayParrentDelegate.rusty runAction:moveByAction];
        
        [self showFifteenTotalStats];
        
        
    }
    
    
    
    
    
    
    
    ///*** BOSS END
    
    
    
    
    
    
    
    
    if(_rustyPosition.position.x != 0 && _rustyPosition.position.y != 0 && !levelFinishedLoading){
        levelFinishedLoading = YES;
        
        
        if(!self.gameplayParrentDelegate.fifteenNewLevel){
            NSLog(self.gameplayParrentDelegate.fifteenNewLevel ? @"-------fifteenNewLevel = Yes" : @"------fifteenNewLevel = No");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"someUnicNameKeyLOHPIDR" object:nil];
            
            
        }
        
        
    }
    
    if(!showFirstMovingPlatform && CGRectContainsPoint(CGRectMake(_govnoContainer1.position.x, _govnoContainer1.position.y, _govnoContainer1.boundingBox.size.width, _govnoContainer1.boundingBox.size.height), ccp(rustyX, rustyY))){
        showFirstMovingPlatform = YES;
        
        for (CCNode *item in self.children) {
            if([item.name isEqualToString:@"hide-region1"]){
                CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:1];
                [item runAction:scaleAction];
            }
        }
    }
    
    
    if(!showSecondMovingPlatform && CGRectContainsPoint(CGRectMake(_govnoContainer2.position.x, _govnoContainer2.position.y, _govnoContainer2.boundingBox.size.width, _govnoContainer2.boundingBox.size.height), ccp(rustyX, rustyY))){
        showSecondMovingPlatform = YES;
        
        for (CCNode *item in self.children) {
            if([item.name isEqualToString:@"hide-region2"]){
                CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:1];
                [item runAction:scaleAction];
            }
        }
    }
    
    if(!showThirdMovingPlatform && CGRectContainsPoint(CGRectMake(_govnoContainer3.position.x, _govnoContainer3.position.y, _govnoContainer3.boundingBox.size.width, _govnoContainer3.boundingBox.size.height), ccp(rustyX, rustyY))){
        showThirdMovingPlatform = YES;
        
        for (CCNode *item in self.children) {
            if([item.name isEqualToString:@"hide-region3"]){
                CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:1];
                NSLog(@"atatatatatata123123123");
                [item runAction:scaleAction];
            }
        }
    }
    
    if(!showFourthMovingPlatform && CGRectContainsPoint(CGRectMake(_govnoContainer4.position.x, _govnoContainer4.position.y, _govnoContainer4.boundingBox.size.width, _govnoContainer4.boundingBox.size.height), ccp(rustyX, rustyY))){
        showFourthMovingPlatform = YES;
        
        for (CCNode *item in self.children) {
            if([item.name isEqualToString:@"hide-region4"]){
                CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:1];
                [item runAction:scaleAction];
            }
        }
    }
    
    if(!showFifthMovingPlatform && CGRectContainsPoint(CGRectMake(_govnoContainer5.position.x, _govnoContainer5.position.y, _govnoContainer5.boundingBox.size.width, _govnoContainer5.boundingBox.size.height), ccp(rustyX, rustyY))){
        showFifthMovingPlatform = YES;
        
        for (CCNode *item in self.children) {
            if([item.name isEqualToString:@"hide-region5"]){
                CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:1];
                [item runAction:scaleAction];
            }
        }
    }

    if(!_lastContainerCathed && CGRectContainsPoint(CGRectMake(843.0, 263.2, 120.0, 120.0), ccp(rustyX, rustyY))){
        _lastContainerCathed = YES;
        
                CCActionMoveTo *moveAction = [CCActionMoveTo actionWithDuration:0.5 position:ccp(999.0, 257.0)];
                [_naebuteb9 runAction:moveAction];
        
    }
    
    if(!_lastContainerCathed2 && CGRectContainsPoint(CGRectMake(859.9, 211.2, 35.0, 35.0), ccp(rustyX, rustyY))){
        _lastContainerCathed2 = YES;
        
        CCActionMoveTo *moveAction = [CCActionMoveTo actionWithDuration:0.5 position:ccp(999.01, 232.0)];
        [_naebuteb9 runAction:moveAction];
        
    }
    
    if(!_lastContainerCathed3 && CGRectContainsPoint(CGRectMake(1873.2, 316.4, 20.0, 30.0), ccp(rustyX, rustyY))){
        _lastContainerCathed3 = YES;
        
        
        _finalPlatform.position = ccp(1488.0, 0.0);

        CCActionRotateTo *moveAction = [CCActionRotateTo actionWithDuration:0.3 angle:-25];
        [_leverArm3 runAction:moveAction];
        
        CCActionMoveTo *opendoor = [CCActionMoveTo actionWithDuration:2 position:ccp(2094.0, 434.0)];
        [_door runAction:opendoor];
        
        CCActionMoveTo *moveplatform = [CCActionMoveTo actionWithDuration:21 position:ccp(2335.3, 0.0)];
        [_finalPlatform runAction:moveplatform];
        
    
    }

    if(!_lastContainerCathed4 && CGRectContainsPoint(CGRectMake(2165.4, 119.3, 20.0, 30.0), ccp(rustyX, rustyY))){
        _lastContainerCathed4 = YES;
        
        CCActionRotateTo *moveAction = [CCActionRotateTo actionWithDuration:0.3 angle:-25];
        [_leverArm runAction:moveAction];
        
        CCActionMoveTo *opendoor = [CCActionMoveTo actionWithDuration:1 position:ccp(2478.0, 108.0)];
        [_door2 runAction:opendoor];
        
        CCActionRotateTo *moveAction2 = [CCActionRotateTo actionWithDuration:0.3 angle:-25];
        [_leverArm2 runAction:moveAction2];
        
    }

    if(!_lastContainerCathed5 && CGRectContainsPoint(CGRectMake(2516.9, 17.4, 20.0, 30.0), ccp(rustyX, rustyY))){
        _lastContainerCathed5 = YES;
        
        CCActionRotateTo *moveAction = [CCActionRotateTo actionWithDuration:0.3 angle:25];
        [_leverArm runAction:moveAction];
        
        CCActionMoveTo *opendoor = [CCActionMoveTo actionWithDuration:1 position:ccp(2478.0, 78.4)];
        [_door2 runAction:opendoor];
        
        CCActionRotateTo *moveAction2 = [CCActionRotateTo actionWithDuration:0.3 angle:25];
        [_leverArm2 runAction:moveAction2];
        
        NSLog(@"jsdfbkjfsdkbj");
        
    }

    
    
    if(!_changeGravity && CGRectContainsPoint(CGRectMake(1111.7, 0.0, 624.0, 500.0), ccp(rustyX, rustyY))){
        _changeGravity = YES;
        self.gameplayParrentDelegate.gravityIsChange = YES;
        [self.gameplayParrentDelegate.rusty.physicsBody applyImpulse:ccp(0, 0.001)];
        

        _gravityLight.visible = NO;
    }
    
    if(!_defaultGravity && CGRectContainsPoint(CGRectMake(1768.3, 23.5, 60.0, 120.0) , ccp(rustyX, rustyY))){
        _defaultGravity = YES;
        [self.gameplayParrentDelegate.rusty.physicsBody applyImpulse:ccp(0, 0.001)];
        
        _gravityLight2.visible = NO;
        
        self.gameplayParrentDelegate.rusty.rotation = 1;
        self.gameplayParrentDelegate.gravityIsChange = NO;
        

    }
    
    if(!_flashCatched && CGRectContainsPoint(CGRectMake(_flash.position.x-50, _flash.position.y-30, 100, 60), ccp(rustyX, rustyY))){
        _flashCatched = YES;
        _finish.visible = YES;
        [_finish.animationManager jumpToSequenceNamed:@"timeline" time:0];
        [_finish.animationManager  runAnimationsForSequenceNamed:@"timeline"];
        _flash.visible = NO;
               
        
    }
    
    //    float dx = rustyX - _rustyMask.position.x;
    //    float dy = rustyY - _rustyMask.position.y;
    //    float d = sqrt(dx*dx + dy*dy);
    //    float v = 80;
    //
    //    if (d >  1) {
    //        _rustyMask.position = ccp( _rustyMask.position.x + dx/d * v *delta,
    //                                  _rustyMask.position.y + dy/d * v *delta);
    //    } else {
    //        _rustyMask.position = ccp(rustyX, rustyY);
    //    }
    
    int tmpDirection = 0;
    
    CGRect bossRect = CGRectMake(rustyX-_boss.pixelsX/2, rustyY-_boss.pixelsY/2, _boss.pixelsX, _boss.pixelsY);
    CGRect bossCustomRect = CGRectMake(_bossCustom.position.x, _bossCustom.position.y, _bossCustom.boundingBox.size.width, _bossCustom.boundingBox.size.height);
    
    
    CGRect rustyRectCatch = CGRectMake(rustyX-50, rustyY-50, 100, 100);
//    CGRect bossCustomRect = CGRectMake(_bossCustom.position.x, _bossCustom.position.y, _bossCustom.boundingBox.size.width, _bossCustom.boundingBox.size.height);
    
    
    
    
    
    
    CGRect rustyPortalCatch = CGRectMake(rustyX-10, rustyY-10, 20, 20);
    CGRect rustyPortalCatchOut = CGRectMake(rustyX-16, rustyY-16, 32, 32);
    
    
    CGRect finishLevelRect = CGRectMake(_finishLevel.position.x-_finishLevel.boundingBox.size.width/2, _finishLevel.position.y-_finishLevel.boundingBox.size.height/2, _finishLevel.boundingBox.size.width, _finishLevel.boundingBox.size.height);
    
    
    if(CGRectContainsPoint(finishLevelRect, ccp(rustyX, rustyY)) && !levelFinished){
        
        levelFinished = YES;
        [self.gameplayParrentDelegate showWinAnimation];
        NSLog(@"LEVEL FINISHED");
        
        
    }
    
    
    
    CGRect rustyBoomCatch = CGRectMake(_countdownButton.position.x, _countdownButton.position.y+30, _countdownButton.boundingBox.size.width, _countdownButton.boundingBox.size.height);
    
    if(!tntCatched && CGRectContainsPoint(rustyBoomCatch, ccp(rustyX, rustyY))){
        
        tntCatched = YES;
        
        
        
        CCActionMoveTo *moveaction = [CCActionMoveTo actionWithDuration:0.3 position:ccp(441.2, 235.7)];
        id done2 = [CCActionCallBlock actionWithBlock:^{
            currMinute-=1;
            currSeconds=59;
            _boom.visible = YES;
            [_boom.animationManager runAnimationsForSequenceNamed:@"timeline"];
            
            self.gameplayParrentDelegate.rusty.position = ccp(0, -100);
            
            _tnt.visible = NO;
            _tntRestart.visible = YES;
            _countdownButton.visible = NO;
            [_tntRestart.animationManager runAnimationsForSequenceNamed:@"timeline"];
            CCActionDelay *tntDelay = [CCActionDelay actionWithDuration:5];
            id done2 = [CCActionCallBlock actionWithBlock:^{
                _tntRestart.visible = NO;
                _tnt.visible = YES;
                _countdownButton.visible = YES;
                
                
            }];
            
            [_tnt runAction:[CCActionSequence actions:tntDelay, done2, nil]];

            
            
        }];
        
        [_countdownButton runAction:[CCActionSequence actions:moveaction, done2, nil]];
        //currMinute
        
        
        
    }
    
    if(!_speedContainer1Catched && self.gameplayParrentDelegate.globalLevelNumber == 60 && CGRectContainsPoint(CGRectMake(229.3, 0.0, 100.0, 100.0), ccp(rustyX, rustyY))){
        
        _speedIndicator.position = ccp(26.0 , 100.0);
        _speedIndicator.scaleX = -1;
        _speedIndicator.visible = YES;
        
        _speedContainer1Catched = YES;
        _speedContainer2Catched = NO;
        _speedContainer3Catched = NO;
        _speedContainer4Catched = NO;
        _speedContainer5Catched = NO;
        [self.gameplayParrentDelegate setRustyRandomSpeed:1];
        [self.gameplayParrentDelegate setRustyRandomJump:2];
    }
    
    if(!_speedContainer2Catched && self.gameplayParrentDelegate.globalLevelNumber == 60 && CGRectContainsPoint(CGRectMake(-48.6, 80.7, 100.0, 100.0), ccp(rustyX, rustyY))){
        
        
        _speedIndicator.position = ccp(479.0 , 201.0);
        _speedIndicator.scaleX = 1;
        _speedIndicator.visible = YES;
        
        _speedContainer2Catched = YES;
        _speedContainer1Catched = NO;
        _speedContainer3Catched = NO;
        _speedContainer4Catched = NO;
        _speedContainer5Catched = NO;
        [self.gameplayParrentDelegate setRustyRandomSpeed:40];
        [self.gameplayParrentDelegate setRustyRandomJump:4];
    }
    
    if(!_speedContainer3Catched && self.gameplayParrentDelegate.globalLevelNumber == 60 && CGRectContainsPoint(CGRectMake(444.0, 185.8, 100.0, 100.0), ccp(rustyX, rustyY))){
        
        _speedIndicator.position = ccp(26.0, 261.0);
        _speedIndicator.scaleX = -1;
        _speedIndicator.visible = YES;
        _speedContainer3Catched = YES;
        _speedContainer2Catched = NO;
        _speedContainer1Catched = NO;
        _speedContainer4Catched = NO;
        _speedContainer5Catched = NO;
        [self.gameplayParrentDelegate setRustyRandomSpeed:90];
        [self.gameplayParrentDelegate setRustyRandomJump:5];
    }
    
    if(!_speedContainer4Catched && self.gameplayParrentDelegate.globalLevelNumber == 60 && CGRectContainsPoint(CGRectMake(-39.3, 245.5, 100.0, 100.0), ccp(rustyX, rustyY))){
        
        _speedIndicator.visible = NO;
        
        _speedContainer4Catched = YES;
        _speedContainer2Catched = NO;
        _speedContainer3Catched = NO;
        _speedContainer1Catched = NO;
        _speedContainer5Catched = NO;
        [self.gameplayParrentDelegate setRustyRandomSpeed:130];
        [self.gameplayParrentDelegate setRustyRandomJump:6];
    }
    
    if(CGRectContainsPoint(CGRectMake(_ghostContainer.position.x, _ghostContainer.position.y, _ghostContainer.boundingBox.size.width, _ghostContainer.boundingBox.size.height), ccp(rustyX, rustyY))){
        _ghost.visible = YES;
        _ghost.physicsBody.sensor = NO;
        
    }
    
    if(CGRectContainsPoint(CGRectMake(_ghostContainer1.position.x, _ghostContainer1.position.y, _ghostContainer1.boundingBox.size.width, _ghostContainer1.boundingBox.size.height), ccp(rustyX, rustyY))){
        _ghost.physicsBody.sensor = YES;
        _ghost.visible = NO;
    }
    if(CGRectContainsPoint(CGRectMake(_ghostContainer2.position.x, _ghostContainer2.position.y, _ghostContainer2.boundingBox.size.width, _ghostContainer2.boundingBox.size.height), ccp(rustyX, rustyY))){
        _ghost1.visible = YES;
        
    }
    
    if(CGRectContainsPoint(CGRectMake(_ghostContainer1.position.x, _ghostContainer1.position.y, _ghostContainer1.boundingBox.size.width, _ghostContainer1.boundingBox.size.height), ccp(rustyX, rustyY))){
        _ghost.physicsBody.sensor = YES;
        _ghost.visible = NO;
    }

    if(CGRectContainsPoint(CGRectMake(_ghostContainer2.position.x, _ghostContainer2.position.y, _ghostContainer2.boundingBox.size.width, _ghostContainer2.boundingBox.size.height), ccp(rustyX, rustyY))){
        _ghost1.visible = YES;
        
    }
    
    
    if(!_ghost1Enabled && CGRectContainsPoint(CGRectMake(_ghostContainer.position.x, _ghostContainer.position.y, _ghostContainer.boundingBox.size.width, _ghostContainer.boundingBox.size.height), ccp(rustyX, rustyY))){
        
        [self.gameplayParrentDelegate makeGhostAppear:1];
        
        
        _ghost1Enabled = YES;
    }
    
    if(_ghost1Enabled && CGRectContainsPoint(CGRectMake(_ghostContainer1.position.x, _ghostContainer1.position.y, _ghostContainer1.boundingBox.size.width, _ghostContainer1.boundingBox.size.height), ccp(rustyX, rustyY))){
        
        _ghost1Enabled = NO;
        
        [self.gameplayParrentDelegate makeGhostAppear:3];
    }
    
    
    
    
    
    if(!_ghost2Enabled && CGRectContainsPoint(CGRectMake(_ghostContainer2.position.x, _ghostContainer2.position.y, _ghostContainer2.boundingBox.size.width, _ghostContainer2.boundingBox.size.height), ccp(rustyX, rustyY))){
        
        [self.gameplayParrentDelegate makeGhostAppear:2];
        
        
        _ghost2Enabled = YES;
    }
    
    
    if(_ghost2Enabled && CGRectContainsPoint(CGRectMake(_ghostContainer3.position.x, _ghostContainer3.position.y, _ghostContainer3.boundingBox.size.width, _ghostContainer3.boundingBox.size.height), ccp(rustyX, rustyY))){
        
        _ghost2Enabled = NO;
        
        
        [self.gameplayParrentDelegate makeGhostAppear:4];
    }
    
    /*
     
     0 - left
     1 - right
     2 - up
     3 - down
     
     */

    if(!self.gameplayParrentDelegate._ifLevelsPressed){
    
        
        
        
        
        if(CGRectContainsPoint(rustyPortalCatch, movedown.position)){
                
                moveReached = YES;
                tmpNode = movedown;
                tmpDirection = 3;
                
            } else if(CGRectContainsPoint(rustyPortalCatch, moveup.position)){
                
                moveReached = YES;
                tmpNode = moveup;
                tmpDirection = 2;
                
                
            } else if(CGRectContainsPoint(rustyPortalCatch, moveright.position)){
                
                moveReached = YES;
                tmpNode = moveright;
                tmpDirection = 1;
                
            } else if(CGRectContainsPoint(rustyPortalCatch, moveleft.position)){
                
                moveReached = YES;
                tmpNode = moveleft;
                tmpDirection = 0;
                
            } else {
              
                
                moveReached = NO;
           
            
            }
        
       
    
        
   
        
    }
    
    
    
    
    
    
    
    if(!afterReachedTrigger && moveReached && !self.fifteenEnabled && !self.gameplayParrentDelegate.rustyMoving && !self.gameplayParrentDelegate.newLevelLoading){
        
        self.fifteenEnabled = YES;
       
        NSLog(@"Portal reached");
        afterReachedTrigger = YES;
        

        crystalExplode.visible = YES;
        crystalExplode.position = tmpNode.position;

        tmpNode.visible = NO;

        [crystalExplode.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
        [crystalExplode.animationManager runAnimationsForSequenceNamed:@"timeline"];

        
        
        //Это у нас зжимает расти
        
        
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(clearLine:) userInfo:@"2" repeats:NO];
        
        
        [crystalExplode.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
            
            
            if(tmpDirection==1){
                self.rightPortallFirstReached = YES;
            }
            
            [self.gameplayParrentDelegate showFifteenFromGameNew:tmpDirection];
//
//            [tmpNode.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
//           
//            tmpNode.visible = YES;
//            crystalExplode.visible = NO;
            
            
        }];
        
        
    }
    
    
    
    
//    NSLog(@"self.gameplayParrentDelegate.currentActiveLevel = %i", self.gameplayParrentDelegate.currentActiveLevel);
    
    
    if((CGRectContainsPoint(bossRect, _boss.position) || CGRectContainsPoint(bossCustomRect, _bossCustom.position)) && self.gameplayParrentDelegate.currentActiveLevel == 6 && !bossDefeated){
        
        
        bossDefeated = YES;
        
        _boss.visible = NO;
        //NSLog(@"BOSSSSSS = %i", self.gameplayParrentDelegate.activePuzzleNumber);
        
        
//        NSLog(@"pixelsX = %i", _boss.pixelsX);
//        NSLog(@"pixelsY = %i", _boss.pixelsY);
        
        
        
        NSData *readItemData = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%d", self.gameplayParrentDelegate.activePuzzleNumber]];
        FifteenItem *readItem = [NSKeyedUnarchiver unarchiveObjectWithData:readItemData];
        
        FifteenItem *item = [[FifteenItem alloc] init];
        
        item.isFifteenOpened = @YES;
        item.fifteenDeath = readItem.fifteenDeath;
        item.fifteenMoves = readItem.fifteenMoves;
        item.fifteenMinutesPassed = readItem.fifteenMinutesPassed;
        item.fifteenSecondsPassed = readItem.fifteenSecondsPassed;
        item.fifteenEtaDeath = readItem.fifteenEtaDeath;
        item.fifteenEtaMoves = readItem.fifteenEtaMoves;
        item.fifteenEtaMinutesPassed = readItem.fifteenEtaMinutesPassed;
        item.fifteenEtaSecondsPassed = readItem.fifteenEtaSecondsPassed;
        item.fifteenPositions = readItem.fifteenPositions;
        item.fifteenPositionsShuffled = readItem.fifteenPositionsShuffled;
        item.currentFifteenLevel = readItem.currentFifteenLevel;
        
        item.isBossDefeated = @YES;
        
        NSData *itemData = [NSKeyedArchiver archivedDataWithRootObject:item];
        [[NSUserDefaults standardUserDefaults] setObject:itemData forKey:[NSString stringWithFormat:@"%d", self.gameplayParrentDelegate.activePuzzleNumber]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
    }
    
    
    if(self.gameplayParrentDelegate.rustyIsDead){
        
        bossDefeated = NO;
        _boss.visible = YES;
        

    }

    
    

    
    if(!CGRectContainsPoint(rustyPortalCatchOut, tmpNode.position) && afterReachedTrigger){
        
        [tmpNode.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
        
        tmpNode.cascadeOpacityEnabled = YES;
        
        tmpNode.visible = YES;
        tmpNode.opacity = 0;
        [tmpNode setOpacity:0];
        
        
        //    for (id item in fifteen.children) {
        //        [item runAction:[fadeOut copy]];
        //    }
        
        CCActionFadeIn *fadeInPortal = [CCActionFadeIn actionWithDuration:0.4];
        [tmpNode runAction:fadeInPortal];
        
        crystalExplode.visible = NO;
        afterReachedTrigger = NO;
        
    }
    
    
    
    
//    if (CGRectContainsPoint(rustyRect, movedown.position)) {
//        [self animatePortal:1];
//        
//    } else {
//        if(!portalDownAnimating){
//            [movedown.animationManager setPaused:YES];
//        }
//    }
//    
//    if (CGRectContainsPoint(rustyRect, moveup.position)) {
//        [self animatePortal:2];
//        
//    } else {
//        if(!portalUpAnimating){
//            [moveup.animationManager setPaused:YES];
//        }
//    }
//    
//    if (CGRectContainsPoint(rustyRect, moveleft.position)) {
//        [self animatePortal:3];
//        
//    } else {
//        if(!portalLeftAnimating){
//            [moveleft.animationManager setPaused:YES];
//        }
//    }
//    
//    if (CGRectContainsPoint(rustyRect, moveright.position)) {
//        [self animatePortal:4];
//        
//    } else {
//        if(!portalRightAnimating){
//            [moveright.animationManager setPaused:YES];
//        }
//    }
    
    
    
    
    
    //portals
    
    if(!portalEnabled){
        
        
        if(CGRectContainsPoint(CGRectMake(_portalIdle.position.x-10, _portalIdle.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle.position.x > 0){
                
            portalEnabled = YES;
            _portalIdle.visible = NO;
            
            _portalStart.position = _portalIdle.position;
            _portalIdleStart.position = _portalIdle.position;
            
            currentActivePortal = 1;
            
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle2.position.x-10, _portalIdle2.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle2.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle2.visible = NO;
            
            _portalStart.position = _portalIdle2.position;
            _portalIdleStart.position = _portalIdle2.position;
            
            currentActivePortal = 2;
            
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle3.position.x-10, _portalIdle3.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle3.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle3.visible = NO;
            
            _portalStart.position = _portalIdle3.position;
            _portalIdleStart.position = _portalIdle3.position;
            
            currentActivePortal = 3;
            
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle4.position.x-10, _portalIdle4.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle4.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle4.visible = NO;
            
            _portalStart.position = _portalIdle4.position;
            _portalIdleStart.position = _portalIdle4.position;
            
            currentActivePortal = 4;
            
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle5.position.x-10, _portalIdle5.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle5.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle5.visible = NO;
            
            _portalStart.position = _portalIdle5.position;
            _portalIdleStart.position = _portalIdle5.position;
            
            currentActivePortal = 5;
            
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle6.position.x-10, _portalIdle6.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle6.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle6.visible = NO;
            
            _portalStart.position = _portalIdle6.position;
            _portalIdleStart.position = _portalIdle6.position;
            
            currentActivePortal = 6;
            
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle7.position.x-10, _portalIdle7.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle7.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle7.visible = NO;
            
            _portalStart.position = _portalIdle7.position;
            _portalIdleStart.position = _portalIdle7.position;
            
            currentActivePortal = 7;
          
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle8.position.x-10, _portalIdle8.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle8.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle8.visible = NO;
            
            _portalStart.position = _portalIdle8.position;
            _portalIdleStart.position = _portalIdle8.position;
            
            currentActivePortal = 8;
         
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle9.position.x-10, _portalIdle9.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle9.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle9.visible = NO;
            
            _portalStart.position = _portalIdle9.position;
            _portalIdleStart.position = _portalIdle9.position;
            
            currentActivePortal = 9;
        
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle10.position.x-10, _portalIdle10.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle10.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle10.visible = NO;
            
            _portalStart.position = _portalIdle10.position;
            _portalIdleStart.position = _portalIdle10.position;
            
            currentActivePortal = 10;
        
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle11.position.x-10, _portalIdle11.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle11.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle11.visible = NO;
            
            _portalStart.position = _portalIdle11.position;
            _portalIdleStart.position = _portalIdle11.position;
            
            currentActivePortal = 11;
            
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle12.position.x-10, _portalIdle12.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle12.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle12.visible = NO;
            
            _portalStart.position = _portalIdle12.position;
            _portalIdleStart.position = _portalIdle12.position;
            
            currentActivePortal = 12;
        
        } else if(CGRectContainsPoint(CGRectMake(_portalIdle13.position.x-10, _portalIdle13.position.y-20, 25, 30), ccp(rustyX, rustyY)) && _portalIdle13.position.x > 0){
            
            portalEnabled = YES;
            _portalIdle13.visible = NO;
            
            _portalStart.position = _portalIdle13.position;
            _portalIdleStart.position = _portalIdle13.position;
            
            currentActivePortal = 13;
    
            
        }
        
            
        
        
        if(portalEnabled){
            _portalStart.visible = YES;
            [_portalStart.animationManager runAnimationsForSequenceNamed:@"timeline"];
            
            self.portalFirstReached = YES;
            
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(triggerPortalEnabled) userInfo:nil repeats:NO];
            NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(clearLine:) userInfo:@"1" repeats:NO];
            NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(moveRusty) userInfo:nil repeats:NO];
        }
        
        
    }
    
    
    
    
    
    
    //make opacity 1
    
    
    if (CGRectContainsPoint(CGRectMake(invisibleFall.position.x-invisibleFall.offset, invisibleFall.position.y-invisibleFall.boundingBox.size.height, invisibleFall.boundingBox.size.width+(invisibleFall.offset*2), -300), ccp(rustyX, rustyY)) && !invisibleFallActivated) {
        
        //NSLog(@"invisibleFall.offset = %d", invisibleFall.offset);
        
        invisibleFall.opacity = 1;
        invisibleFall.physicsBody.type = CCPhysicsBodyTypeDynamic;
        
        invisibleFallActivated = YES;
        
        invisibleFall.physicsBody.sensor = NO;
        
        id fade2 = [CCActionFadeOut actionWithDuration:invisibleFall.resetTime];
        
        id done2 = [CCActionCallBlock actionWithBlock:^{
            
            
            invisibleFallActivated = NO;
            
            invisibleFall.physicsBody.sensor = YES;
            invisibleFall.physicsBody.velocity = ccp(0,0);
            invisibleFall.rotation = 0;
            invisibleFall.position = invisibleFallInitPos;
            
            invisibleFall.physicsBody.type = CCPhysicsBodyTypeStatic;
            
            //            id fade3 = [CCActionFadeIn actionWithDuration:4];
            //            id done3 = [CCActionCallBlock actionWithBlock:^{
            //                fallNode.physicsBody.sensor = NO;
            //            }];
            //
            //            id seq3 = [CCActionSequence actions:fade3, done3, nil];
            //            [fallNode runAction:seq3];
            
            
        }];
        
        id seq2 = [CCActionSequence actions:fade2, done2, nil];
        [invisibleFall runAction:seq2];
        
        
        
    }
    
    
    
    
    
    //    if (CGRectContainsPoint(rustyRect, moveup.position)) {
    //        [movedown.animationManager setPaused:NO];
    //    } else {
    //        [movedown.animationManager setPaused:YES];
    //
    //    }
    //
    //    if (CGRectContainsPoint(rustyRect, moveleft.position)) {
    //        [movedown.animationManager setPaused:NO];
    //    } else {
    //        [movedown.animationManager setPaused:YES];
    //
    //    }
    //
    //    if (CGRectContainsPoint(rustyRect, moveright.position)) {
    //        [movedown.animationManager setPaused:NO];
    //    } else {
    //        [movedown.animationManager setPaused:YES];
    //
    //    }
    
    
    
    
    
    if (CGRectContainsPoint(rustyRectCatch, platformCatch.position)) {
        
        //[platformCatch.animationManager setPaused:NO];
        if(!platformCatchStarted){
            platformCatchStarted = YES;
            [self animateCatchPlatform];
        }
        
        
    } else {
        
        if(!platformCatchStarted){
            [platformCatch.animationManager setPaused:YES];
        }
        
    }
    
    
    if (CGRectContainsPoint(rustyRectCatch, platformReverse.position)) {
        
        if(!platformReverseStarted){
            platformReverseStarted = YES;
            [self animateReversePlatform];
        }
        
        
    } else {
        
        if(!platformReverseStarted){
            [platformReverse.animationManager setPaused:YES];
        }
        
    }
    
    
    
    
    
    
    
    
    
    if([[NSString stringWithFormat:@"%.1f",stoppedAnimationTime]floatValue] == [[NSString stringWithFormat:@"%.1f",self.animationManager.runningSequence.time]floatValue] && !freezeTimelineReturned){
        
        freezeTimelineReturned = YES;
        
        [self.animationManager setPaused:YES];
        [self.animationManager jumpToSequenceNamed:@"Light" time:stoppedAnimationTime];
        [self.animationManager setPaused:NO];
        
    }
 
    
    
    
    
    
    
    
}


- (void)movePlayerLight:(CGPoint)rustyPoint{
    
    rustyX = rustyPoint.x;
    rustyY = rustyPoint.y;
    
    //_playerLight.position = ccp(rustyX, rustyY);
}

- (void) hidePortals {
    //_rightPortal.visible = FALSE;
    //_leftPortal.visible = FALSE;
    
}



-(void) initFall:(FallPlatform*)fallNode _fallId:(int)fallId _initialPos:(CGPoint)initialPos{
    
    
    
    //  fallNode.physicsBody.type = CCPhysicsBodyTypeDynamic;
    
    //    if(fallNode.resetTime){
    //        NSLog(@"resetTime = %d", fallNode.resetTime);
    //    }
    
    int resetTime = 2.4;
    
    if ([fallNode respondsToSelector:NSSelectorFromString(@"getResetTime")]) {
            NSLog(@"resetTime = %d", fallNode.resetTime);
            resetTime = fallNode.resetTime;
    }
    
    
//    @try {
//        NSLog(@"resetTime = %d", fallNode.resetTime);
//        resetTime = fallNode.resetTime;
//    }
//    @catch (NSException *exception) {
//        NSLog(@"%@", exception.reason);
//    }
//    @finally {
//        //        NSLog(@"resetTime in spritebuilder does not set");
//        //        NSLog(@"resetTime setting to 0");
//        //        resetTime = 4;
//    }
    
    
    CCNode *copyNode = fallNode;
    
    //NSLog(@"test = %d", fallNode.resetTime);
    
    //    FallPlatform *copyNode = fallNode;
    
    
    if(fallId==1){
        
        
        
        
        
        if(copyNode.physicsBody.type != CCPhysicsBodyTypeDynamic){
            
            id fade1 = [CCActionFadeOut actionWithDuration:resetTime];
            id done1 = [CCActionCallBlock actionWithBlock:^{
                
                copyNode.opacity = 1;
                copyNode.physicsBody.sensor = NO;
                copyNode.position = initialPos;
                copyNode.rotation = 0;
                copyNode.physicsBody.type = CCPhysicsBodyTypeKinematic;
                
            }];
            copyNode.physicsBody.type = CCPhysicsBodyTypeDynamic;
            
            id seq1 = [CCActionSequence actions:fade1, done1, nil];
            [copyNode runAction:seq1];
        }
        
        
        
        
    }
    else if (fallId==2){
        
        if(copyNode.physicsBody.type != CCPhysicsBodyTypeDynamic){
        
            id fade1 = [CCActionFadeOut actionWithDuration:2.9];
            id done1 = [CCActionCallBlock actionWithBlock:^{
                
                copyNode.opacity = 1;
                copyNode.physicsBody.sensor = NO;
                copyNode.position = initialPos;
                copyNode.rotation = 0;
                copyNode.physicsBody.type = CCPhysicsBodyTypeKinematic;
                
            }];
            copyNode.physicsBody.type = CCPhysicsBodyTypeDynamic;
            
            id seq1 = [CCActionSequence actions:fade1, done1, nil];
            [copyNode runAction:seq1];
         
         
         
         }
        
//        if(!fallNode.physicsBody.sensor){
//            
//            id fade2 = [CCActionFadeOut actionWithDuration:0.2];
//            id done2 = [CCActionCallBlock actionWithBlock:^{
//                
//                fallNode.physicsBody.sensor = YES;
//                
//                id fade3 = [CCActionFadeIn actionWithDuration:resetTime];
//                id done3 = [CCActionCallBlock actionWithBlock:^{
//                    fallNode.physicsBody.sensor = NO;
//                }];
//                
//                id seq3 = [CCActionSequence actions:fade3, done3, nil];
//                [fallNode runAction:seq3];
//                
//                
//            }];
//            
//            id seq2 = [CCActionSequence actions:fade2, done2, nil];
//            [fallNode runAction:seq2];
//            
//        }
    }
    
}


-(void) moveRustyMaskToPosition:(CGPoint)maskPos{
    if(!self.gameplayParrentDelegate.newLevelLoading){
        self._rustyMask.position = maskPos;
    }
}


-(void)moveRusty{
    
    
    if(currentActivePortal == 1){
        
        
        _portalFinish.visible = YES;
        _portalIdle.opacity = 0;
        [_portalFinish.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish.position.x, _portalFinish.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish.position.x, _portalFinish.position.y)];
        _portalIdle3.visible = YES;
        
        
    } else if(currentActivePortal == 2){
       
        
        _portalFinish2.visible = YES;
        _portalIdle2.opacity = 0;
        [_portalFinish2.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish2.position.x, _portalFinish2.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish2.position.x, _portalFinish2.position.y)];
        _portalIdle4.visible = YES;
        
    } else if(currentActivePortal == 3){
        
        
        _portalFinish3.visible = YES;
        _portalIdle3.opacity = 0;
        [_portalFinish3.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish3.position.x, _portalFinish3.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish3.position.x, _portalFinish3.position.y)];
        _portalIdle5.visible = YES;
        _portalIdle3.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle7.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle9.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
        _portalIdle13.visible = NO;

        
    } else if(currentActivePortal == 4){
        
        
        _portalFinish4.visible = YES;
        _portalIdle4.opacity = 0;
        [_portalFinish4.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish4.position.x, _portalFinish4.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish4.position.x, _portalFinish4.position.y)];
        _portalIdle6.visible = YES;
        _portalIdle3.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle7.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle9.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
        _portalIdle13.visible = NO;
        
    } else if(currentActivePortal == 5){
        
        
        _portalFinish5.visible = YES;
        _portalIdle5.opacity = 0;
        [_portalFinish5.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish5.position.x, _portalFinish5.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish5.position.x, _portalFinish5.position.y)];
        _portalIdle7.visible = YES;
        _portalIdle3.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle9.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
        _portalIdle13.visible = NO;

    } else if(currentActivePortal == 6){
        
        
        _portalFinish6.visible = YES;
        _portalIdle6.opacity = 0;
        [_portalFinish6.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish6.position.x, _portalFinish6.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish6.position.x, _portalFinish6.position.y)];
        _portalIdle3.visible = YES;
        _portalIdle7.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle9.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
        _portalIdle13.visible = NO;
    
    } else if(currentActivePortal == 7){
        
        
        _portalFinish7.visible = YES;
        _portalIdle7.opacity = 0;
        [_portalFinish7.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish7.position.x, _portalFinish7.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish7.position.x, _portalFinish7.position.y)];
        _portalIdle8.visible = YES;
        _portalIdle7.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle3.visible = NO;
        _portalIdle9.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
        _portalIdle13.visible = NO;
        
    } else if(currentActivePortal == 8){
        
        
        _portalFinish8.visible = YES;
        _portalIdle8.opacity = 0;
        [_portalFinish8.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish8.position.x, _portalFinish8.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish8.position.x, _portalFinish8.position.y)];
        _portalIdle9.visible = YES;
        _portalIdle13.visible = YES;
        _portalIdle7.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle7.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
  
    
    } else if(currentActivePortal == 9){
        
        
        _portalFinish9.visible = YES;
        _portalIdle9.opacity = 0;
        [_portalFinish9.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish9.position.x, _portalFinish9.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish9.position.x, _portalFinish9.position.y)];
        _portalIdle10.visible = YES;
        _portalIdle7.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle9.visible = NO;
        _portalIdle3.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
        _portalIdle13.visible = NO;
        
    } else if(currentActivePortal == 10){
        
        
        _portalFinish10.visible = YES;
        _portalIdle10.opacity = 0;
        [_portalFinish10.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish10.position.x, _portalFinish10.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish10.position.x, _portalFinish10.position.y)];
        _portalIdle11.visible = YES;
        _portalIdle12.visible = YES;
        _portalIdle7.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle9.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle13.visible = NO;
        
        
    } else if(currentActivePortal == 11){
        
        
        _portalFinish11.visible = YES;
        _portalIdle11.opacity = 0;
        [_portalFinish11.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish11.position.x, _portalFinish11.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish11.position.x, _portalFinish11.position.y)];
        _portalIdle9.visible = YES;
        _portalIdle13.visible = YES;
        _portalIdle7.visible = NO;
        _portalIdle4.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
        
    } else if(currentActivePortal == 12){
        
        
        _portalFinish12.visible = YES;
        _portalIdle12.opacity = 0;
        [_portalFinish12.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish12.position.x, _portalFinish12.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish12.position.x, _portalFinish12.position.y)];
   
    } else if(currentActivePortal == 13){
        
        
        _portalFinish13.visible = YES;
        _portalIdle13.opacity = 0;
        [_portalFinish13.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish13.position.x, _portalFinish13.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish13.position.x, _portalFinish13.position.y)];
        _portalIdle7.visible = NO;
        _portalIdle3.visible = NO;
        _portalIdle6.visible = NO;
        _portalIdle5.visible = NO;
        _portalIdle8.visible = NO;
        _portalIdle9.visible = NO;
        _portalIdle10.visible = NO;
        _portalIdle11.visible = NO;
        _portalIdle12.visible = NO;
        _portalIdle13.visible = NO;
        _portalIdle4.visible = YES;
        
        
    }
    
    //id fade3 = [CCActionFadeIn actionWithDuration:1];
    //[_portalIdle runAction:fade3];
    NSTimer *timer4 = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(restorePortals) userInfo:nil repeats:NO];
    
    
    
    id scaleUpAction = [CCActionScaleTo actionWithDuration:0.2 scaleX:1 scaleY:1];
    [self.gameplayParrentDelegate.rusty runAction:scaleUpAction];
    id alphaAction = [CCActionFadeIn actionWithDuration:0.1];
    [self.gameplayParrentDelegate.rusty runAction:alphaAction];
    
    
    [self.gameplayParrentDelegate pauseGamePlayScene];
    
}

-(void) restorePortals{
    
    _portalIdleStart.visible = YES;
    [_portalIdleStart.animationManager runAnimationsForSequenceNamed:@"timeline"];
    
    NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(restoreIdleStatus) userInfo:nil repeats:NO];
    
    
}

-(void) restoreIdleStatus{
    _portalIdleStart.visible = NO;
    _portalIdle.visible = YES;
    _portalIdle2.visible = YES;
//    _portalIdle3.visible = YES;
//    _portalIdle4.visible = YES;
//    _portalIdle5.visible = YES;
//    _portalIdle6.visible = YES;
//    _portalIdle7.visible = YES;
//    _portalIdle8.visible = YES;
//    _portalIdle9.visible = YES;
//    _portalIdle10.visible = YES;
//    _portalIdle11.visible = YES;
//    _portalIdle12.visible = YES;
//    _portalIdle13.visible = YES;

}



-(void) triggerPortalEnabled{
    portalEnabled = !portalEnabled;
}


-(void) updateRustyMask{
    if(!self.gameplayParrentDelegate.newLevelLoading){
        self._rustyMask.position = [self getRustyPos];
    }
}


- (void)clearLine:(NSTimer*)theTimer {
    
    NSString *type = (NSString*)[theTimer userInfo];
    

    /*
     
     0 - portal
     1 - fifteen crystal
     
     */
    
    //    [lineHolder removeAllChildren];
    
    //[self.gameplayParrentDelegate.rusty ]
    
    //id scaleUpAction =  [[CCScaleTo actionWithDuration:1 scaleX:1.0 scaleY:1.0] rate:2.0];
    
    
    
    
    //id scaleDownAction = [CCEaseInOut actionWithAction:[CCScaleTo actionWithDuration:0.5 scaleX:0.8 scaleY:0.8] rate:2.0];
    
    //CCSequence *scaleSeq = [CCSequence actions:scaleUpAction, scaleDownAction, nil];
    //[sprite runAction:[CCRepeatForever actionWithAction:scaleSeq]];
    
    id moveByAction;
    
    NSLog(@"type = %@", type);
    
    if([type intValue] == 1) {
        
        if(currentActivePortal == 1){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle.position.x + 7, _portalIdle.position.y + 8)];
            
        } else if(currentActivePortal == 2){
        
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle2.position.x + 7, _portalIdle2.position.y + 8)];
            
        } else if(currentActivePortal == 3){
        
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle3.position.x + 7, _portalIdle3.position.y + 8)];
            
        } else if(currentActivePortal == 4){
        
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle4.position.x + 7, _portalIdle4.position.y + 8)];
            
        } else if(currentActivePortal == 5){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle5.position.x + 7, _portalIdle5.position.y + 8)];
        
        } else if(currentActivePortal == 6){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle6.position.x + 7, _portalIdle6.position.y + 8)];
    
        } else if(currentActivePortal == 7){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle7.position.x + 7, _portalIdle7.position.y + 8)];
       
        } else if(currentActivePortal == 8){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle8.position.x + 7, _portalIdle8.position.y + 8)];
            
        } else if(currentActivePortal == 9){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle9.position.x + 7, _portalIdle9.position.y + 8)];
            
        } else if(currentActivePortal == 10){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle10.position.x + 7, _portalIdle10.position.y + 8)];
            
        } else if(currentActivePortal == 11){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle11.position.x + 7, _portalIdle11.position.y + 8)];
            
        } else if(currentActivePortal == 12){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle12.position.x + 7, _portalIdle12.position.y + 8)];
            
        } else if(currentActivePortal == 13){
            
            moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(_portalIdle13.position.x + 7, _portalIdle13.position.y + 8)];
    
        }
        
        
    } else if([type intValue] == 2){
        
        moveByAction = [CCActionMoveTo actionWithDuration:0.1 position:ccp(tmpNode.position.x + 7, tmpNode.position.y + 8)];
        
    }
    
    
    id scaleUpAction = [CCActionScaleTo actionWithDuration:0.1 scaleX:0 scaleY:0];
    id alphaAction = [CCActionFadeOut actionWithDuration:0.1];
    
    [self.gameplayParrentDelegate.rusty runAction:alphaAction];
    [self.gameplayParrentDelegate.rusty runAction:scaleUpAction];
    [self.gameplayParrentDelegate.rusty runAction:moveByAction];
    
}



-(void) freezeAnimationStarted {
   
    
    for (CCNode *node in [self children]) {
    
        if(![node isKindOfClass:[MovingPlatform class]]){
            if(node != self._rustyMask){
                node.position = node.oldPosition;
            }
        }
        
    }
}

-(void) nullSpeedContainers{
    _speedContainer2Catched = NO;
    _speedContainer3Catched = NO;
    _speedContainer4Catched = NO;
    _speedContainer5Catched = NO;
    
    _ghost.visible = NO;
    _ghost1.visible = NO;
    _ghost2.visible = NO;

    if (self.gameplayParrentDelegate.globalLevelNumber == 60) {
        _speedIndicator.position = ccp(307.0 , 24.0);
        _speedContainer1Catched = NO;
        _speedIndicator.scaleX = 1;
        _speedIndicator.visible = YES;
    }

}

-(void) rustyIsDeadAlreadyMotherFucka {
    
    for (CCNode *item in self.children) {
        if([item.name isEqualToString:@"hide-region1"] || [item.name isEqualToString:@"hide-region2"] || [item.name isEqualToString:@"hide-region3"] || [item.name isEqualToString:@"hide-region4"] || [item.name isEqualToString:@"hide-region5"]){
            CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:0];
            [item runAction:scaleAction];
        }
    }
    
    
    showSecondMovingPlatform = NO;
    showFirstMovingPlatform = NO;
    showThirdMovingPlatform = NO;
    showFourthMovingPlatform = NO;
    showFifthMovingPlatform = NO;
    
    _bossFlash.visible = YES;
    
    _flashCatched = NO;
    _gravityLight.visible = YES;
    _gravityLight2.visible = YES;
    
    if(_ghost1Enabled){
        _ghost1Enabled = NO;
    }
    
    if(_ghost2Enabled){
        _ghost2Enabled = NO;
    }
    
    currMinute = 0;
    currSeconds = 35;

//    [countDowntimer fire];
    if(_countdownTexture){
        
        tntCatched = NO;
        
        [_countdownTexture stopAllActions];
        
        CCActionMoveTo *moveaction = [CCActionMoveTo actionWithDuration:1 position:ccp(455.3, 499)];
        [_countdownTexture runAction:moveaction];
    } else {
        NSLog(@"not found");
    }
    
    if(_countdownButton){
        
        [_countdownButton stopAllActions];
        
        CCActionMoveTo *moveaction1 = [CCActionMoveTo actionWithDuration:1 position:ccp(441.2, 244.7)];
        
        id done2 = [CCActionCallBlock actionWithBlock:^{
            
            CCActionMoveTo *moveaction2 = [CCActionMoveTo actionWithDuration:34 position:ccp(455.3, 407.6)];
            [_countdownTexture runAction:moveaction2];
            
            CCActionDelay *delayaction = [CCActionDelay actionWithDuration:33];
            CCActionMoveTo *moveaction3 = [CCActionMoveTo actionWithDuration:1 position:ccp(441.2, 240.7)];
                        
            [_countdownButton runAction:[CCActionSequence actions:delayaction, moveaction3, nil]];
            
        }];
        
        id seq2 = [CCActionSequence actions:moveaction1, done2, nil];
        [_countdownButton runAction:seq2];
    } else {
        NSLog(@"not found");
    }
    
    CCActionMoveTo *moveAction = [CCActionMoveTo actionWithDuration:0.5 position:ccp(1000.1, 229.0)];
    [_naebuteb9 runAction:moveAction];
    
    [_finalPlatform stopAllActions];
    _finalPlatform.position = ccp(1488.0, 400.0);
    
    [_door stopAllActions];
    CCActionMoveTo *opendoor = [CCActionMoveTo actionWithDuration:1 position:ccp(2094.0, 403.0)];
    [_door runAction:opendoor];
    
    CCActionRotateTo *moveAction4 = [CCActionRotateTo actionWithDuration:0.3 angle:25];
    [_leverArm3 runAction:moveAction4];
    
    CCActionRotateTo *moveAction3 = [CCActionRotateTo actionWithDuration:0.3 angle:25];
    [_leverArm runAction:moveAction3];
    
    CCActionMoveTo *opendoor2 = [CCActionMoveTo actionWithDuration:1 position:ccp(2478.0, 78.4)];
    [_door2 runAction:opendoor2];
    
    CCActionRotateTo *moveAction2 = [CCActionRotateTo actionWithDuration:0.3 angle:25];
    [_leverArm2 runAction:moveAction2];
    
    
    _lastContainerCathed = NO;
    _lastContainerCathed2 = NO;
    _lastContainerCathed3 = NO;
    _lastContainerCathed4 = NO;
    _lastContainerCathed5 = NO;
    
    _defaultGravity = NO;
    _changeGravity = NO;
//    self.gameplayParrentDelegate.gravityIsChange = NO;
    
}

-(void) countdowntimerFired {
    
    if(!self.gameplayParrentDelegate.isGamePaused) {
        
    
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=59;
            _boom.visible = YES;
            [_boom.animationManager runAnimationsForSequenceNamed:@"timeline"];
            
            self.gameplayParrentDelegate.rusty.position = ccp(0, -100);
            
            _tnt.visible = NO;
            _tntRestart.visible = YES;
            _countdownButton.visible = NO;
            [_tntRestart.animationManager runAnimationsForSequenceNamed:@"timeline"];
            CCActionDelay *tntDelay = [CCActionDelay actionWithDuration:5];
            id done2 = [CCActionCallBlock actionWithBlock:^{
                _tntRestart.visible = NO;
                _tnt.visible = YES;
                _countdownButton.visible = YES;
                
                
            }];
            
            [_tnt runAction:[CCActionSequence actions:tntDelay, done2, nil]];
            
        } else if(currSeconds>0) {
            currSeconds-=1;
        }
        
        
        
        if(currMinute>-1){

            CCActionDelay *tntDelay3 = [CCActionDelay actionWithDuration:0.5];
            _countdownTimer.visible = YES;
            
            id done2 = [CCActionCallBlock actionWithBlock:^{
                
                _countdownTimer.visible = NO;
                
                
            }];
            [_tnt runAction:[CCActionSequence actions:tntDelay3, done2, nil]];
           
            [_countdownTimer setString:[NSString stringWithFormat:@"%d:%d", currMinute, currSeconds]];
            
        }
        
    }
    }
}
-(void) setFreeze:(BOOL) freeze{
    
    
    
    if(freeze){
        
        
//        freezeTimelineReturned = NO;
        
        for (CCNode *node in [self children]) {
            node.oldPosition = node.position;
        }
        
        
        
        stoppedAnimationTime = self.animationManager.runningSequence.time;
        
        [self.animationManager setPaused:YES];
        [self.animationManager jumpToSequenceNamed:@"notFreeze" time:stoppedAnimationTime];
        [self.animationManager setPaused:NO];
        
        
        for (CCNode *node in [self children]) {
            node.position = node.oldPosition;
        }
        
        
        
    } else {
        freezeTimelineReturned = NO;
        //[self.animationManager setPaused:YES];
        //[self.animationManager jumpToSequenceNamed:@"Light" time:stoppedAnimationTime];
        //[self.animationManager setPaused:NO];
        
        
    }
    
    freezeEnabled = freeze;
}


@end
