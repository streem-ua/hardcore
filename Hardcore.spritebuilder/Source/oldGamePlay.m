#import "GamePlay.h"
#import "Levels.h"
#import <CCPhysics+ObjectiveChipmunk.h>
#import "SoftRusty.h"
#import "Fifteen.h"
#import "MainMenu.h"


@implementation GamePlay {
    
    CCNode* level;
    // CCNode *rusty;
    CCNode *_levelNode;
    CCNode *_contentNode;
    
    CCPhysicsNode* _physicsNode;
    
    CCSprite *testSprite;
    
    CGPoint velocity;
    
    BOOL _forwardMarch;
    BOOL _backwardMarch;
    BOOL _mightAsWellJump;
    BOOL newLevelLoading;
    
    BOOL fifteenEnabled;
    BOOL portalAvailable;
    BOOL fifteenTime;
    
    NSInteger _onDoubleJump;
    NSString* collisionType;
    CGPoint currentTouch;
    float normalX;
    float normalY;
    
    Fifteen *fifteen;
    
    Levels* levels;
    
    BOOL _touchStopped;
    
    CCActionFadeOut *fadeOut;
    CCActionFadeTo *fadeIn;
    
    BOOL menuEnabled;
    CCNode *_rightMenu;
    
    CCLabelTTF *_txtTime;
    int levelSeconds;
    int levelMinutes;
    
    int currentActiveLevel;
    
    int activePuzzleNumber;
    
    CCLabelTTF *scorelabel;
    
    CCPhysicsJoint *joint;
    
    
    CCNode *_fifteenSelect;
    CCNode *_levelsSelect;
    
    
    NSTimer *portalTimer;
    BOOL portalTimerCreated;
    BOOL rustyMoving;
    
    int rustySpeed;
    int rustyJump;
    
    
    MainMenu *mainMenu;
    BOOL _ifLevelsPressed;
}


- (void) scale:(CGFloat) newScale scaleCenter:(CGPoint) scaleCenter {
    
//
//    if (isAction == YES) {
//        self.scale = 1.01;
//        
//        CGPoint subPosition = ccpSub(self.position, scaleCenter);
//        NSLog(@"%f %f", 512 - scaleCenter.x, 384 / 2  - scaleCenter.y);
//        CGPoint newPosition = ccp(0 - scaleCenter.x,  0 - scaleCenter.y);
//            self.position = newPosition;
//
//    }
    
}

- (void)didLoadFromCCB
{
    
    [self setMultipleTouchEnabled:YES];
    self.userInteractionEnabled = YES;
    self.multipleTouchEnabled = YES;
    
    //_rightMenu.visible = NO;
    portalTimerCreated = NO;
    rustyMoving = NO;
    
    
    _levelsSelect = [[CCNode alloc] init];
    [_contentNode addChild:_levelsSelect];
    
    rustySpeed = 87;
    rustyJump = 36;
    
    
    
    
    
    mainMenu = (MainMenu*)[CCBReader load:@"startSelect"];
    mainMenu.gameplayParrentDelegate = self;
    
    _fifteenSelect.visible = NO;
    
    
    [self addChild:mainMenu];
    

}



-(void) startupMenuFunc:(BOOL)ifLevelsPressed with15id:(int)_currentFifteenNumber {
    
    mainMenu.visible = false;
    
    
    _ifLevelsPressed = ifLevelsPressed;
    
    if(_ifLevelsPressed){
        
            int x_counter=0;
            int y_counter=0;
        
        
            for (int i = 1; i<=60; i++) {
        
        
        
                CCButton *testBtn = [[CCButton alloc] initWithTitle:[NSString stringWithFormat:@"%i", i]];
                testBtn.name = [NSString stringWithFormat:@"%i", i];
                [testBtn setTarget:self selector:@selector(tileBtnClicked:)];
        
                testBtn.position = ccp(30+45*x_counter, 300-40*y_counter);
                [_levelsSelect addChild:testBtn];
        
        
                if(x_counter == 9){
                    x_counter = 0;
                    y_counter++;
                } else {
                    x_counter++;
                    
                }
                
                
                
            }
    } else {
        
        currentActiveLevel = 1;
        activePuzzleNumber = _currentFifteenNumber;
        
        [self fifteenChoosed];
        
    }
    
    
}



- (void) tileBtnClicked:(CCButton *)sender{
    
    //    NSLog(@"%@", sender.name);
    
    _levelsSelect.visible = NO;
    
    currentActiveLevel = sender.name.intValue;
    activePuzzleNumber = 1;
    
    [self fifteenChoosed];
    
    //[self startGameWithLevel:sender.name.intValue withString:@"native"];
    
}



- (void) startFromPuzzle:(CCNode *)sender {
    
    activePuzzleNumber = sender.name.intValue;
    
    _fifteenSelect.visible = NO;
    [self fifteenChoosed];
    
}




- (void) fifteenChoosed {
    
    
    
    
    
    newLevelLoading = TRUE;
    fifteenEnabled = FALSE;
    fifteenTime = FALSE;
    menuEnabled = FALSE;
    
    
    //self.rusty = _levelRusty;
    
    
    self.rusty = [CCBReader load:@"rusty/rusty"];
    
    
    fifteen = (Fifteen*)[CCBReader load:@"fifteen/fifteen"];
    fifteen.gameplayParrentDelegate = self;
    [fifteen setActivePuzzleNumber:activePuzzleNumber];
    
    fifteen.name = @"fifteen";
    
    _physicsNode.gravity = ccp(0, -500);
    //[self addChild:_contentNode];
    //[_contentNode addChild:_physicsNode];
    
    [_physicsNode addChild:self.rusty];
    
    velocity = ccp(0.0, 0.0);
    
    ChipmunkSpace *space = [_physicsNode space];
    space.collisionBias = 0.f;
    
    //_physicsNode.sleepTimeThreshold = 0.01f;
    //space.damping = 0.01f;
    
    //level.physicsBody.density = 10;
    //level.physicsBody.friction = 10;
    //level.physicsBody.elasticity = 0.0;
    //level.physicsBody.mass = 10;
    //level.physicsBody.force = ccp(20, 20);
    
    //level.physicsBody.collisionGroup = @1;
    
    //self.rusty.physicsBody.friction = 1.7;
    //self.rusty.physicsBody.elasticity = 0;
    
    //_physicsNode.debugDraw = YES;
    
    _physicsNode.iterations = 20;
    _onDoubleJump = 0;
    _physicsNode.collisionDelegate = self;
    
    
    
    CustomButton* moveLeft = [CustomButton spriteWithImageNamed:@"left_right.png"];
    moveLeft.opacity = 0;
    moveLeft.name = @"moveLeftRight";
    moveLeft.userInteractionEnabled = YES;
    moveLeft.scaleY = .8;
    moveLeft.scaleX = .25;
    moveLeft.position = ccp(0+moveLeft.boundingBox.size.width/2, 0+moveLeft.boundingBox.size.height/2);
    moveLeft.delegate = self;
    [_contentNode addChild:moveLeft];
    
    CustomButton* moveUp = [CustomButton spriteWithImageNamed:@"up.png"];
    moveUp.name = @"moveUp";
    moveUp.opacity = 0;
    moveUp.userInteractionEnabled = YES;
    moveUp.scaleY = .8;
    moveUp.scaleX = .6;
    moveUp.delegate = self;
    moveUp.position = ccp(moveLeft.position.x + 340, moveLeft.position.y);
    [_contentNode addChild:moveUp];
    
    //CustomButton* callMenu = [CustomButton spriteWithImageNamed:@"up.png"];
    //callMenu.visible = NO;
    //_pauseButton.name = @"callMenu";
    //callMenu.userInteractionEnabled = YES;
    //callMenu.scale = .2;
    //callMenu.delegate = self;
    //callMenu.position = ccp(480, 350);
    //[_contentNode addChild:callMenu];
    
    //[self startGameWithLevel:@"levels/level1"];
    
    
    
    
    [_contentNode addChild:fifteen];
    
    
    
    [self startGameWithLevel:currentActiveLevel withString:@"native"];
    
    
    
    fadeOut = [CCActionFadeTo actionWithDuration:0.5 opacity:0];
    fadeIn = [CCActionFadeTo actionWithDuration:0.5 opacity:0.85];
    
    
    fifteen.cascadeOpacityEnabled = YES;
    
    fifteen.visible = NO;
    [fifteen runAction:fadeOut];
    
    
    NSTimer *gameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showTime:) userInfo:nil repeats:YES];
    
    
    //    for (id item in fifteen.children) {
    //        [item runAction:[fadeOut copy]];
    //
    //    }
    //    fifteen.visible = NO;
    
    //[fifteen print15];
    //[fifteen moveCell:1];
    
    
    scorelabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Current scene: %d Current level: %d", [fifteen getActivePuzzleNumber], [fifteen getActiveLevelNumber]] fontName:@"Verdana" fontSize:7.0f];
    scorelabel.position = ccp(65, 375);
    
    
    [_contentNode addChild: scorelabel];
    
    
}


- (void) reloadFifteen:(int)activePuzzleNum{
    
    
    //[fifteen removeAllChildren];
    //activePuzzleNumber++;
    
    NSLog(@"FIFTEEN REMOVED");
    
    [self hideFifteen];
    [_contentNode removeChildByName:@"fifteen" cleanup:YES];
    
    fifteen = (Fifteen*)[CCBReader load:@"fifteen/fifteen"];
    fifteen.gameplayParrentDelegate = self;
    [fifteen setActivePuzzleNumber: activePuzzleNumber];
    
    fifteen.name = @"fifteen";
    
    fifteen.cascadeOpacityEnabled = YES;
    fifteen.visible = NO;
    [fifteen runAction:fadeOut];
    
    [_contentNode addChild:fifteen];
    
    
    
    
    
}


-(int) getTestActivePuzzleNumber {
    NSLog(@"TESTEd  = %d", activePuzzleNumber);
    return activePuzzleNumber;
}

-(int) getActivePuzzleNumber {
    
    activePuzzleNumber++;
    return activePuzzleNumber;
}

static bool isAction = NO;
- (void) startGameWithLevel:(int)levelId withString:(NSString *)typeStr{
    if (isAction == NO) {
        isAction = YES;
    }
    NSString *levelName = @"";
    [fifteen setActiveNumber:levelId];
    
    currentActiveLevel = levelId;
    
    portalAvailable = TRUE;
    
    if([typeStr  isEqual: @"fifteen"]){
        fifteenEnabled = TRUE;
    }
    
    
    
    
    //levelName = [NSString stringWithFormat:@"newLevels/level%d/level%d", levelId, levelId];
    
    
    
    
    NSLog(@"levelId = %d, activePuzzleNumber = %d", levelId, activePuzzleNumber);
    
    
    //levelId = -1;
    
    
    if(!_ifLevelsPressed){
        switch (levelId) {
            case 1:
                
                
                
                
                if(activePuzzleNumber == 1){
                    
                    
                    levelName = @"newLevels/level1/level1";
                    
                } else if(activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level6/level6";
                    
                } else if(activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level11/level11";
                    
                } else if(activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level16/level16";
                    
                } else if(activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level21/level21";
                    
                } else if(activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level26/level26";
                    
                } else if(activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level31/level31";
                    
                } else if(activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level36/level36";
                    
                }
                
                
                
                break;
                
            case 2:
                
                
                
                if(activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level2/level2";
                    
                } else if(activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level7/level7";
                    
                } else if(activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level12/level12";
                    
                } else if(activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level17/level17";
                    
                } else if(activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level22/level22";
                    
                } else if(activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level27/level27";
                    
                } else if(activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level32/level32";
                    
                } else if(activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level37/level37";
                    
                }
                
                
                break;
                
            case 3:
                
                
                
                if(activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level3/level3";
                    
                } else if(activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level8/level8";
                    
                } else if(activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level13/level13";
                    
                } else if(activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level18/level18";
                    
                } else if(activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level23/level23";
                    
                } else if(activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level28/level28";
                    
                } else if(activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level33/level33";
                    
                } else if(activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level38/level38";
                    
                }
                
                
                break;
                
            case 4:
                
                
                
                if(activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level4/level4";
                    
                } else if(activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level9/level9";
                    
                    
                } else if(activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level14/level14";
                    
                } else if(activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level19/level19";
                    
                } else if(activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level24/level24";
                    
                } else if(activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level29/level29";
                    
                } else if(activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level34/level34";
                    
                } else if(activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level39/level39";
                    
                }
                
                
                
                break;
                
            case 5:
                
                
                if(activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level5/level5";
                    
                } else if(activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level10/level10";
                    
                } else if(activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level15/level15";
                    
                } else if(activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level20/level20";
                    
                } else if(activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level25/level25";
                    
                } else if(activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level30/level30";
                    
                } else if(activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level35/level35";
                    
                } else if(activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level40/level40";
                    
                }
                
                
                break;
        }

    } else {
        levelName = [NSString stringWithFormat:@"newLevels/level%d/level%d", levelId, levelId];
        
    }
    
    
    
    
    
  
    
    [scorelabel setString:[NSString stringWithFormat:@"Current scene: %d Current level: %d", [fifteen getActivePuzzleNumber], [fifteen getActiveLevelNumber]]];
    
    
    [_levelNode removeChildByName:@"levels" cleanup:YES];
    levels = (Levels*)[CCBReader load:levelName];
    levels.name = @"levels";
    
    
    
    
    if(levels.getRustyPos.x != 0){
        self.rusty.position = levels.getRustyPos;
        [self scale:0.5 scaleCenter:self.rusty.position];
    }
    levels.gameplayParrentDelegate = self;
    
    
    [_levelNode addChild:levels];
    _onDoubleJump = 0;
    
    newLevelLoading = FALSE;
    
    [_txtTime setString:@"00:00"];
    levelSeconds = 0;
    levelMinutes = 0;
    // CCEffectNode* effectNode = [CCEffectNode effectNodeWithWidth:_levelNode.contentSizeInPoints.width height:_levelNode.contentSizeInPoints.height];
    //effectNode.effect = [CCEffectBlur effectWithBlurRadius:30];
    
}





#pragma mark - CustomButtonProtocol implementation

- (void) menuTouch {
    

//    [[CCDirector sharedDirector]
//             replaceScene:[CCBReader loadAsScene:@"GamePlay"]];
//    
    
    
    
    CGPoint moveTo;
    
    if(menuEnabled){
        moveTo = ccp(0, 0);
        menuEnabled = FALSE;
        [self hideFifteen];
    } else {
        moveTo = ccp(-150, self.position.y);
        menuEnabled = TRUE;
        [self showFifteen];
    }
    
    CCActionMoveTo* move = [CCActionMoveTo actionWithDuration:0.5 position:moveTo];
    
    CCActionEaseInOut *ease = [CCActionEaseInOut actionWithAction:move rate:3];
    
    
    [_contentNode runAction:ease];
    
}


-(void) exitToMain{
        [[CCDirector sharedDirector]
                 replaceScene:[CCBReader loadAsScene:@"GamePlay"]];
}

- (void)leftTouch
{
    
    if(!fifteenEnabled){
        _forwardMarch = FALSE;
        _backwardMarch = TRUE;
        _touchStopped = FALSE;
        
        portalTimerCreated = NO;
        rustyMoving = YES;
        
    }
}

- (void)rightTouch
{
    if(!fifteenEnabled){
        _touchStopped = FALSE;
        _backwardMarch = FALSE;
        _forwardMarch = TRUE;
        
        portalTimerCreated = NO;
        rustyMoving = YES;
    }
}

- (void)upTouch
{
    
    
    
    
    
    if(!fifteenEnabled){
        
        
//        if (_onDoubleJump < 2){
//            self.rusty.physicsBody.velocity = ccp(self.rusty.physicsBody.velocity.x, 0);
//            [self.rusty.physicsBody applyImpulse:ccp(0, 55)];
//            
//            rustyMoving = YES;
//            portalTimerCreated = NO;
//            
//            _onDoubleJump++;
//        }

        
        
        if (_onDoubleJump < 2){
            
            self.rusty.physicsBody.velocity = ccp(self.rusty.physicsBody.velocity.x, 0);
            [self.rusty.physicsBody applyImpulse:ccp(0, rustyJump)];
            
            rustyMoving = YES;
            portalTimerCreated = NO;
            
            
            if(self.rusty.physicsBody.velocity.y > -100){
                _onDoubleJump++;
            } else {
                _onDoubleJump = 2;
            }
            
        }
        
        
        
        
        //        if (_onDoubleJump < 2 && ([collisionType  isEqual:@"2"] || [collisionType  isEqual:@"platform"] || [collisionType  isEqual:@"fall"] || [collisionType  isEqual: @"move-left"] || [collisionType  isEqual: @"move-right"] || [collisionType  isEqual: @"move-down"] || [collisionType  isEqual: @"move-up"])) {
        //                                                               //NSLog(@"jump collisionType = %ld", (long)collisionType);
        //                                                               // && normalY >= -1 && normalY < -0.5
        //
        //                                                                _mightAsWellJump = YES;
        //
        //                                                               self.rusty.physicsBody.velocity =
        //                                                               ccp(self.rusty.physicsBody.velocity.x, 0);
        //                                                               [self.rusty.physicsBody applyImpulse:ccp(0, 55)];
        //
        //                                                                 _onDoubleJump++;
        //
        //
        //
        //                                                           }
    }
    
    
    
}

-(void)stopTouch
{
    _backwardMarch = FALSE;
    _forwardMarch = FALSE;
    
    _touchStopped = TRUE;
    
    
    //self.rusty.physicsBody.velocity = ccp(0, self.rusty.physicsBody.velocity.y);
    //self.rusty.physicsBody.velocity = ccpMult(self.rusty.physicsBody.velocity, ccpMult(ccp(120);
    
    
}

- (void)buttonHandler
{
    //NSLog(@"asdasda");
}

- (void)update:(CCTime)delta
{
    
    
    
    [self scale:1.5 scaleCenter:self.rusty.position];
    if(!fifteenEnabled){
        
        if(_touchStopped){
            if (self.rusty.physicsBody.velocity.x > 0) {
                if (self.rusty.physicsBody.velocity.x >= 20) {
                    self.rusty.physicsBody.velocity = ccp(self.rusty.physicsBody.velocity.x-20, self.rusty.physicsBody.velocity.y);
                } else {
                    self.rusty.physicsBody.velocity = ccp(0, self.rusty.physicsBody.velocity.y);
                }
            }
            if (self.rusty.physicsBody.velocity.x < 0) {
                if(self.rusty.physicsBody.velocity.x <= -20){
                    self.rusty.physicsBody.velocity = ccp(self.rusty.physicsBody.velocity.x+20, self.rusty.physicsBody.velocity.y);
                } else {
                    self.rusty.physicsBody.velocity = ccp(0, self.rusty.physicsBody.velocity.y);
                }
            }
        }
        
        
        [levels movePlayerLight:self.rusty.position];
        
        if (_forwardMarch) {
            // self.rusty.physicsBody.velocity =
            // ccp(0,self.rusty.physicsBody.velocity.y);
            
            [self.rusty.physicsBody applyImpulse:ccp(0.1, 0)];
            self.rusty.position = ccp(self.rusty.position.x + rustySpeed*delta, self.rusty.position.y);
            [self scale:0.5 scaleCenter:self.rusty.position];
            if (self.rusty.physicsBody.velocity.x < 100) {
                
                
                
                //[self.rusty.physicsBody applyImpulse:ccp(15, 0)];
                
                
                
                
                
                
                //[self.rusty.physicsBody setVelocity:ccp(100, self.rusty.physicsBody.velocity.y)];
                
                //[self.rusty.physicsBody applyForce:ccp(350, 0)];
                
                //self.rusty.position = ccpAdd(self.rusty.position, ccpMult(ccp(120, 0), delta));
                
            }
            //[self.rusty.physicsBody applyForce:ccp(395, 0)];
        }
        
        if (_backwardMarch) {
            // self.rusty.physicsBody.velocity = ccp(0,
            // self.rusty.physicsBody.velocity.y);
            
            [self.rusty.physicsBody applyImpulse:ccp(-0.1, 0)];
            self.rusty.position = ccp(self.rusty.position.x - rustySpeed*delta, self.rusty.position.y);
            // self.rusty.physicsBody.velocity = ccp(self.rusty.physicsBody.velocity.x - 80*delta, self.rusty.physicsBody.velocity.y);
            [self scale:0.5 scaleCenter:self.rusty.position];
            
            if (self.rusty.physicsBody.velocity.x > -100) {
                
                
                
                //[self.rusty.physicsBody applyImpulse:ccp(-15, 0)];
                
                
                //            CGPoint moveDirection = ccp(-1, 0);
                //            CGPoint force = ccpMult(moveDirection, 500);
                //            [self.rusty.physicsBody applyForce:force];
                
                
                
                
                
                //[self.rusty.physicsBody setVelocity:ccp(-100, self.rusty.physicsBody.velocity.y)];
                
                //[self.rusty.physicsBody applyForce:ccp(-350, 0)];
                
                //self.rusty.position = ccpAdd(self.rusty.position, ccpMult(ccp(-120, 0), delta));
            }
        }
        
        
        
        
        if(self.rusty.physicsBody.velocity.x == 0 && roundf(self.rusty.physicsBody.velocity.y) == 0){
            rustyMoving = false;
        }
        
        
        if (self.rusty.position.y < -150) {
            [self scale:0.5 scaleCenter:self.rusty.position];
            [self retry];
        }
    }
}

- (void)retry
{
    
    [levels updateRustyMask];
    self.rusty.position = levels.getRustyPos;
    [self scale:0.5 scaleCenter:self.rusty.position];
    
}

- (void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair*)pair
                              rusty:(CCNode*)nodeA
                           wildcard:(CCNode*)nodeB
{
    
    /*
     NSLog(@"pair.contacts.normal.x = %f", pair.contacts.normal.x);
     NSLog(@"pair.contacts.normal.y = %f", pair.contacts.normal.y);
     */
    normalX = pair.contacts.normal.x;
    normalY = pair.contacts.normal.y;
    
    collisionType = nodeB.physicsBody.collisionType;
    
    
    //NSLog(@"nodeB.physicsBody.type = %u", nodeB.physicsBody.type);
    //NSLog(@"nodeB.physicsBody.collisionType = %@", nodeB.physicsBody.collisionType);
    
    //    if (nodeB.physicsBody.type == 2) {
    //        _onDoubleJump = 0;
    //    }
    
    
    
    
    
    //    NSLog(@"self.rusty.physicsBody.velocity.y = %f", self.rusty.physicsBody.velocity.y);
    
    
    
    
    
    if(fabs(pair.contacts.normal.x)==0 && pair.contacts.normal.y>0)
    {
//        NSLog(@"TOP");
        //        CCLOG(@"Top");
    } else if((fabs(pair.contacts.normal.x)==0 || pair.contacts.normal.x==-1) && (pair.contacts.normal.y==0 || pair.contacts.normal.y>0)){
        
//        NSLog(@"TopLeft");
        
    } else if((fabs(pair.contacts.normal.x)==0 || pair.contacts.normal.x==1) && (pair.contacts.normal.y==0 || pair.contacts.normal.y>0)){
        
//        NSLog(@"TopRight");
        
    } else {
        if (self.rusty.physicsBody.velocity.y <= 0 && self.rusty.physicsBody.velocity.y >= -0.3) {
            _onDoubleJump = 0;
        }
        
    }
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"platform"]){
        
        if(fabs(pair.contacts.normal.x)==0 && pair.contacts.normal.y>0)
        {
            NSLog(@"Platform TOP");
            
        } else if(pair.contacts.normal.x==0 && pair.contacts.normal.y<0){
            
            NSLog(@"Bottom");
            _onDoubleJump = 0;
        }
        
        float alpha = 0.00;
        alpha = nodeB.physicsBody.velocity.x - self.rusty.physicsBody.velocity.x;
        
        self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x+alpha, self.rusty.physicsBody.velocity.y);
        
        
        
        //self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x, self.rusty.physicsBody.velocity.y);
        //        NSLog(@"asdasdasdasdada");
        //        joint = [CCPhysicsJoint connectedPivotJointWithBodyA:self.rusty.physicsBody bodyB:nodeB.physicsBody anchorA: self.rusty.anchorPoint];
        //
        
    }
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"fall1"]){
        _onDoubleJump = 0;
        [levels initFall:nodeB _fallId:1 _initialPos:nodeB.position];
        
        
    }
    
    if([nodeB.physicsBody.collisionType  isEqual: @"fall2"]){
        _onDoubleJump = 0;
        [levels initFall:nodeB _fallId:2 _initialPos:nodeB.position];
        
    }

    
    if([nodeB.physicsBody.collisionType  isEqual: @"chrystal"]){
        NSLog(@"Chrystal found");
        [nodeB removeFromParent];
    }
    
    /*
     if (nodeB.physicsBody.type == 5) {
     [self retry];
     }
     */
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"spike"]){
        [self retry];
    }
    
    
    
    
    
    
//    if([nodeB.physicsBody.collisionType  isEqual: @"move-left"] && !fifteenEnabled && portalAvailable){
//        _onDoubleJump = 0;
//        
//        
//        
//        if(!newLevelLoading){
//            
//            portalTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(showFifteenFromGame:) userInfo:@"0" repeats:NO];
//            
//            
//            //[self showFifteen];
//            //[fifteen moveCell:0];
//            
//            
//            
//            
//            
//            
//            
//            
//            //NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(hideFifteen) userInfo:nil repeats:NO];
//            
//            /*
//             NSLog(@"new level");
//             
//             [self startGameWithLevel:@"levels/level2"];
//             */
//        }
//    }
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"move-left"] && !fifteenEnabled && portalAvailable){
        _onDoubleJump = 0;
        
        
        
        if(!newLevelLoading){
            
            
            if(!rustyMoving && !portalTimerCreated){
                portalTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(showFifteenFromGame:) userInfo:@"0" repeats:NO];
                portalTimerCreated = YES;
                NSLog(@"Timer Start");
                
            }        }
    }
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"move-right"] && !fifteenEnabled && portalAvailable){
        _onDoubleJump = 0;
        
        
        if(!newLevelLoading){
            
            if(!rustyMoving && !portalTimerCreated){
                
                portalTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(showFifteenFromGame:) userInfo:@"1" repeats:NO];
                portalTimerCreated = YES;
                NSLog(@"Timer Start");
                
            }
            
        }
    }
    
    if([nodeB.physicsBody.collisionType  isEqual: @"move-up"] && !fifteenEnabled && portalAvailable){
        _onDoubleJump = 0;
        if(!newLevelLoading){
            if(!rustyMoving && !portalTimerCreated){
                portalTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(showFifteenFromGame:) userInfo:@"2" repeats:NO];
                portalTimerCreated = YES;
                NSLog(@"Timer Start");
                
            }
        }
    }
    
    if([nodeB.physicsBody.collisionType  isEqual: @"move-down"] && !fifteenEnabled && portalAvailable){
        _onDoubleJump = 0;
        
        if(!newLevelLoading){
            if(!rustyMoving && !portalTimerCreated){
                portalTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(showFifteenFromGame:) userInfo:@"3" repeats:NO];
                portalTimerCreated = YES;
                NSLog(@"Timer Start");
                
            }
        }
    }
    
    
    
}


-(void)showTime:(NSTimer *)sender
{
    levelSeconds++;
    if (levelSeconds == 60)
    {
        levelSeconds = 0;
        levelMinutes++;
        
    }
    
    NSString *_myStr = [NSString stringWithFormat:@"%02i:%02i", levelMinutes, levelSeconds];
    [_txtTime setString:_myStr];
    
}



- (void)showFifteenFromGame:(NSTimer*)theTimer {
    

    
    
    if(!rustyMoving && portalTimerCreated){
        
        
//        [levels makePortalExplode];
        
        //[levels makePortalExplode:self withSelector:@selector(explodeIsDone)];
        
        NSString *moveDirection = (NSString*)[theTimer userInfo];
        
        //        NSLog (@"Got the int: %d", [moveDirection intValue]);
        
        
        
        
        
        
        [portalTimer invalidate];
        portalTimer = nil;
        
        [self showFifteen];
        [fifteen moveCell:[moveDirection intValue]];
        
    }
    
    
}


-(void) explodeIsDone{
    
    [portalTimer invalidate];
    portalTimer = nil;
    
    [self showFifteen];
//    [fifteen moveCell:1];
}


-(void) showFifteen {
    fifteenEnabled = TRUE;
    fifteen.visible = TRUE;
    portalAvailable = FALSE;
    
    [fifteen runAction:fadeIn];
    
    //    if(menuEnabled){
    //        fifteen.position = ccp(-150, 0);
    //    } else {
    //        fifteen.position = ccp(0, 0);
    //    }
    
    
    
}

-(void) hideFifteen {
    
    
    //    for (id item in fifteen.children) {
    //        [item runAction:[fadeOut copy]];
    //    }
    
    
    NSLog(@"Hide fifteen");
    
    
    
    [fifteen runAction:fadeOut];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(visibleOff) userInfo:nil repeats:NO];
    
    NSTimer *timerAvail = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(manageAvail) userInfo:nil repeats:NO];
    
    
}

-(void) visibleOff {
    fifteenEnabled = FALSE;
    fifteen.visible = FALSE;
}

-(void) manageAvail {
    portalAvailable = TRUE;
    [portalTimer invalidate];
    portalTimer = nil;
}

-(void) moveRustyToPosition:(CGPoint)myPos{
    NSLog(@"Rusty moved");
    
    self.rusty.position = myPos;
    [self scale:0.5 scaleCenter:self.rusty.position];
}

@end
