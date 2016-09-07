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


@implementation Levels {
    
    
    
    CGFloat rustyX;
    CGFloat rustyY;
    
    CCNode *_gun;
    
    CCNode *_bullet;
    
    //    CCSprite *_rightPortal;
    //    CCSprite *_leftPortal;
    //    CCSprite *_upPortal;
    //    CCSprite *_downPortal;
    
    CCSprite *_movingPlatform;
    
    
    CCNode *movedown;
    CCNode *moveup;
    CCNode *moveleft;
    CCNode *moveright;
    
    CCNode *crystalExplode;
    
    BOOL moveReached;
    
    CCNode *platformCatch;
    CCNode *platformReverse;
    
    
    
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
    
    
    CCNode *_portalIdle;
    CCNode *_portalIdle2;
    CCNode *_portalIdle3;
    CCNode *_portalIdle4;
    
    CCNode *_portalStart;
    CCNode *_portalIdleStart;
    
    CCNode *_portalFinish;
    CCNode *_portalFinish2;
    CCNode *_portalFinish3;
    CCNode *_portalFinish4;
    
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
    
    
    }

/*
 
 - (instancetype)initWithGamePlay:(GamePlay *)gp
 {
 self = [super init];
 if (self) {
 gameplay = gp;
 
 }
 return self;
 }
 */

//показывай что не так

//1. В GamePlay.m есть инициализация класса Levels
//levels = (Levels*)[CCBReader load:levelName];
//levels.gameplayParrentDelegate = self;
//levels.name = @"levels";
//[_levelNode addChild:levels];

//2. Вот внизу init прописан, все ок. Он выполняется, но
//[self.gameplayParrentDelegate testFunc];
//вот это не выывается

//Хотя NSLog(@"DELEGATE NOT NULL"); выводится, то есть онего видит, и видит все методы в GamePlay другие, но не выполняет их
//ВТФ х_х
// ок, давай смотреть
// команд не передается через тимвью )
// нажать?)
// ага
// не та проверка была :) ну ты понял уже
// ок, теперь мы знаем что self.gameplayParrentDelegate в том месте равен нил
// какая теперь задача? или это все?
// задача чо бы он не был нил))
// ок



//- (instancetype)initWithParrentDelegate:(id)parrentDelegate{
//    self = [self init];
//    if (self) {
//        NSLog(@"-----000000 THE GREAT LEVELS INIT");
//        self.gameplayParrentDelegate = parrentDelegate;
//        if (self.gameplayParrentDelegate != nil) {
//            [self.gameplayParrentDelegate testFunc]; // self.gameplayParrentDelegate not nil
//        } else {
//            NSLog(@"sory gameplayParrentDelegate is nil and testFunct not called");
//        }
//        
//        
//        
//    }
//    return self;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        levelFinishedLoading = NO;
    }
    return self;
}

- (void)didLoadFromCCB {
    
    
   // NSLog(@"-----000000 THE GREAT LEVELS DIDLOAD");
    
    
    
    
    //[self.gameplayParrentDelegate testFunc];
    
    bossDefeated = NO;
    
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
    
    _portalStart.visible = NO;
    _portalIdleStart.visible = NO;
    
    afterReachedTrigger = NO;
    
    //[_leftPortal.animationManager stop]
    
    
    
    
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
    
    
}




-(CGPoint)getRustyPosition{
    return _rustyPosition.position;
    
}

-(void) moveRustyMask{
    
    
    if(!self.fifteenEnabled && !self.gameplayParrentDelegate.rustyIsDead && self.gameplayParrentDelegate.rusty.visible && !self.gameplayParrentDelegate.newLevelLoading){
        
        CCActionMoveTo *moveTo = [CCActionMoveTo actionWithDuration:0.2 position:ccp(rustyX, rustyY)];
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




-(void) update:(CCTime)delta{
    
    
    if(_rustyPosition.position.x != 0 && _rustyPosition.position.y != 0 && !levelFinishedLoading){
        levelFinishedLoading = YES;
        
        
        if(!self.gameplayParrentDelegate.fifteenNewLevel){
            NSLog(self.gameplayParrentDelegate.fifteenNewLevel ? @"-------fifteenNewLevel = Yes" : @"------fifteenNewLevel = No");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"someUnicNameKeyLOHPIDR" object:nil];
            
            
        }
        
        
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
    
    
    
    
    
    
    
    CGRect rustyPortalCatch = CGRectMake(rustyX-10, rustyY-10, 20, 20);
    CGRect rustyPortalCatchOut = CGRectMake(rustyX-16, rustyY-16, 32, 32);
    
    
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
    
    
    
    
    
    
    
    //    if(_bullet.position.x < 10){
    //        _bullet.position = ccp(487, 105);
    //    }
    //    _bullet.position = ccpAdd(_bullet.position, ccpMult(ccp(-130, 0), delta));
    
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
        
        
    } else if(currentActivePortal == 2){
       
        
        _portalFinish2.visible = YES;
        _portalIdle2.opacity = 0;
        [_portalFinish2.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish2.position.x, _portalFinish2.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish2.position.x, _portalFinish2.position.y)];
        
    } else if(currentActivePortal == 3){
        
        
        _portalFinish3.visible = YES;
        _portalIdle3.opacity = 0;
        [_portalFinish3.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish3.position.x, _portalFinish3.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish3.position.x, _portalFinish3.position.y)];

        
    } else if(currentActivePortal == 4){
        
        
        _portalFinish4.visible = YES;
        _portalIdle4.opacity = 0;
        [_portalFinish4.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        self._rustyMask.position = ccp(_portalFinish4.position.x, _portalFinish4.position.y);
        [self.gameplayParrentDelegate moveRustyToPosition:ccp(_portalFinish4.position.x, _portalFinish4.position.y)];

        
    }
    
    
    
    
    
    
    
    
    //id fade3 = [CCActionFadeIn actionWithDuration:1];
    //[_portalIdle runAction:fade3];
    NSTimer *timer4 = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(restorePortals) userInfo:nil repeats:NO];
    
    
    
    id scaleUpAction = [CCActionScaleTo actionWithDuration:0.2 scaleX:1 scaleY:1];
    [self.gameplayParrentDelegate.rusty runAction:scaleUpAction];
    id alphaAction = [CCActionFadeIn actionWithDuration:0.1];
    [self.gameplayParrentDelegate.rusty runAction:alphaAction];
    
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
    _portalIdle3.visible = YES;
    _portalIdle4.visible = YES;
    
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


@end