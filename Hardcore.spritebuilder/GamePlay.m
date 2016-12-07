#import "GamePlay.h"
#import "Levels.h"
#import <CCPhysics+ObjectiveChipmunk.h>
#import "Fifteen.h"
#import "MainMenu.h"
#import "ButtonController.h"
#import "LeftMenu.h"
#import "FifteenItem.h"
#import "BossStory.h"
#import "CCNode_Private.h"
#import "WaterKillClass.h"
#import "Ghost.h"
#import "LevelsModel.h"
#import "TopBar.h"
#import "LeftMenuNew.h"

@implementation GamePlay {
    
    CCNode *tst;
    CCNode *KOGDANACHALAS;
    CCNode *tst_test;
    CCNode *EBANYIVPOT2HUIPIZDA;

    CCNode *EbaniyVROT1;
    
    
    
    
    // CCNode *rusty;
    CCNode *_levelNode;
    CCNode *_contentNode;
    
    CCPhysicsNode* _physicsNode;
    
    CCSprite *testSprite;
    
    CGPoint velocity;
    
    BOOL _forwardMarch;
    BOOL _backwardMarch;
    BOOL _mightAsWellJump;
    BOOL menuAnimationFinished;
    
    BOOL fifteenEnabled;
    BOOL portalAvailable;
    BOOL fifteenTime;
    
    BOOL gravityReveresed;
    
    NSInteger _onDoubleJump;
    NSString* collisionType;
    float normalX;
    float normalY;
    
    Fifteen *fifteen;
    
    Levels* levels;
    
    BOOL _touchStopped;
    
    
    
    BOOL menuEnabled;
    
    //CCLabelTTF *_txtTime;
    
    
    
    
    CCLabelTTF *scorelabel;
    
    
    
    
    CCPhysicsJoint *joint;
    
    
    CCNode *_fifteenSelect;
    CCNode *_levelsSelect;
    
    
    
    int rustySpeed;
    int rustyJump;
    
    MainMenu *mainMenu;
    
    
    NSString *levelName;
    CCNode *respawnAnimation;
    
    BOOL rustyOnPlatform;
    
    CCNode *gameImageButtons;
    
    
    
    LeftMenu *leftMenu;
    
    CGPoint firstTouch;
    CGPoint lastTouch;
    CGPoint currentTouch;
    CGPoint currentPrevTouch;
    BOOL touchMovingForward;
    
    BOOL leftMenuEnabled;
    
    CustomButton* moveLeft;
    CustomButton* moveUp;
    
    NSTimer *globalDeathTimer;
    BOOL globalDeathTriger;
    
    CCMotionStreak* streak;
    
    
    
    CCNode *currentPlatform;
    CCNode *bubbles;
    
    WaterKillClass *killingWaves;
    
    
    BossStory *bossStory;
    
    BOOL freezeEnabled;
    
    
    
    Ghost *_ghostSprite1;
    Ghost *_ghostSprite2;
    
    
    NSMutableArray *rememberPoints;
    BOOL rememberPointsTest;
    int currentRememberPosition;
    
    LevelsModel *levelModel;
    TopBar *topBar;
    
    
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.gravityIsChange = NO;
        self.rustyCrystalNum = 0;
        self.globalLevelNumber = 0;
        
        self.rustyDeadFirstTime = NO;
        self.rustyDeadFirstTimeGlobal = NO;
        self.fifteenNewLevel = NO;
        self.rustyKilledByWater = NO;
        freezeEnabled = NO;
        // отлично, добавляем обзервер
        gravityReveresed = NO;
        
        self.isGamePaused = NO;
        currentRememberPosition = 0;
        
        rememberPointsTest = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testFunc) name:@"someUnicNameKeyLOHPIDR" object:nil];
        self.myFontColor = [CCColor colorWithRed:0.114 green:0.83 blue:0.242];
        

        levelModel = [[LevelsModel alloc] init];
        
                
        
        
    }
    return self;
}



- (void)didLoadFromCCB
{
    
    currentPlatform = [CCNode node];
   
    touchMovingForward = NO;
    
    [self setMultipleTouchEnabled:YES];
    self.userInteractionEnabled = YES;
    self.multipleTouchEnabled = YES;
    
    self.portalTimerCreated = NO;
    self.rustyMoving = NO;
    
    rustyOnPlatform = NO;
    
    _levelsSelect = [[CCNode alloc] init];
    [_contentNode addChild:_levelsSelect];
    
    rustySpeed = 88;
    rustyJump = 36;
    self.defaultRustySpeed = 88;
    self.defaultRustyJump = 36;
    
    
    mainMenu = (MainMenu*)[CCBReader load:@"startSelect"];
    mainMenu.gameplayParrentDelegate = self;
    
    _fifteenSelect.visible = NO;
    
    
    [self addChild:mainMenu];
    
    self.rustyIsDead = YES;
    
    leftMenu = [LeftMenu node];
    leftMenu.gameplayParrentDelegate = self;
    
}



-(void) startupMenuFunc:(BOOL)ifLevelsPressed with15id:(int)_currentFifteenNumber {
    
    mainMenu.visible = false;
    
    
    self._ifLevelsPressed = ifLevelsPressed;
    
    if(self._ifLevelsPressed){
        
            int x_counter=0;
            int y_counter=0;
        
        
            for (int i = 1; i<=73; i++) {
        
        
        
                CCButton *testBtn = [[CCButton alloc] initWithTitle:[NSString stringWithFormat:@"| %i |", i]];
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
        

        
        self.currentActiveLevel = 1;
        self.activePuzzleNumber = _currentFifteenNumber;
        [self fifteenChoosed];
        
        
    }
    
    
}



- (void) tileBtnClicked:(CCButton *)sender{
    
    NSLog(@"%@", sender.name);
    
    _levelsSelect.visible = NO;
    
    
    
    self.currentActiveLevel = sender.name.intValue;
    self.activePuzzleNumber = 1;
    
    [self fifteenChoosed];
    
//    [self startGameWithLevel:sender.name.intValue withString:@"native"];
    
}



- (void) startFromPuzzle:(CCNode *)sender {
    
    self.activePuzzleNumber = sender.name.intValue;
    
    _fifteenSelect.visible = NO;
    [self fifteenChoosed];
    
}




- (void) fifteenChoosed {
    
    
    
    
    
    self.newLevelLoading = YES;
    fifteenEnabled = FALSE;
    fifteenTime = FALSE;
    menuEnabled = FALSE;
    
    self.rusty = [[Rusty alloc] init];
    
    
    
    fifteen = (Fifteen*)[CCBReader load:@"fifteen/fifteen"];
    fifteen.gameplayParrentDelegate = self;
    
    [fifteen setActivePuzzleNumber:self.activePuzzleNumber];
    
    fifteen.name = @"fifteen";
    
    _physicsNode.gravity = ccp(0, -500);
  
    respawnAnimation = [CCBReader load:@"spawn/spawn"];
    respawnAnimation.visible = NO;
    [self addChild:respawnAnimation];
    
    
    velocity = ccp(0.0, 0.0);
    
    ChipmunkSpace *space = [_physicsNode space];
    space.collisionBias = 0.f;
    
    
    _physicsNode.iterations = 20;
    _onDoubleJump = 0;
    _physicsNode.collisionDelegate = self;
    
    
    
    moveLeft = [CustomButton spriteWithImageNamed:@"left_right.png"];
    moveLeft.opacity = 0;
    moveLeft.name = @"moveLeftRight";
    moveLeft.userInteractionEnabled = YES;
    //    moveLeft.scaleY = .9;
    moveLeft.scaleX = .21;
    moveLeft.position = ccp(10+moveLeft.boundingBox.size.width/2, 0+moveLeft.boundingBox.size.height/2);
    moveLeft.delegate = self;
    [_contentNode addChild:moveLeft];
    
    moveUp = [CustomButton spriteWithImageNamed:@"up.png"];
    moveUp.name = @"moveUp";
    moveUp.opacity = 0;
    moveUp.userInteractionEnabled = YES;
    //    moveUp.scaleY = .7;
    moveUp.scaleX = .3;
    moveUp.delegate = self;
    moveUp.position = ccp([[CCDirector sharedDirector] viewSize].width-50, moveLeft.position.y);
    [_contentNode addChild:moveUp];
    
    
    
    self.buttonController = [[ButtonController alloc] init];
    [_contentNode addChild:self.buttonController];
    
    
    [_contentNode addChild:fifteen];
    _contentNode.userInteractionEnabled = YES;
    
    
    
    NSLog(@"self.currentActiveLevel = %i", self.currentActiveLevel);
    
    [self startGameWithLevel:self.currentActiveLevel withString:@"native"];
    
    
    
    
    fifteen.cascadeOpacityEnabled = YES;
    
    fifteen.visible = NO;
//    [fifteen hideFifteen];
    
    
    NSTimer *gameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showTime:) userInfo:nil repeats:YES];
 
    
    
    
    
    
    
    [_contentNode addChild:leftMenu];
    leftMenu.position = ccp(-150, 0);
    
    
    
    [leftMenu setupData:fifteen.fifteenOriginHolder withCurrentFifteen:fifteen.fifteenShuffleHolder];
    
    
    
    
    streak = [CCMotionStreak streakWithFade:0.3 minSeg:1 width:15 color:[CCColor colorWithCcColor3b:ccc3(255, 255, 255)] textureFilename:@"rustyFollowBack.png"];
    [_physicsNode addChild:streak];
    [_physicsNode addChild:self.rusty];
    
    
    
   
    
    
    NSLog(@"collisionType = %@", self.rusty.physicsBody.collisionType);
    
    self.rusty.physicsBody.sensor = YES;
    
    
    topBar = (TopBar*)[CCBReader load:@"topBar/topBar_res"];
    topBar.gameplayParrentDelegate = self;
    topBar.position = ccp(topBar.position.x, [CCDirector sharedDirector].viewSize.height);
    [self addChild:topBar];
    
    
    
    LeftMenuNew *leftMenuNew = (LeftMenuNew*)[CCBReader load:@"leftMenu/leftMenuRes"];
    leftMenuNew.gameplayParrentDelegate = self;
    [self addChild:leftMenuNew];
    
    
    
    
    
}




-(int) getTestActivePuzzleNumber {
    return self.activePuzzleNumber;
}

-(int) getActivePuzzleNumber {
    
    self.activePuzzleNumber++;
    return self.activePuzzleNumber;
}


- (void) startGameWithLevel:(int)levelId withString:(NSString *)typeStr{
    
    if([typeStr  isEqual: @"fifteen"]){
        
        NSData *readItemData = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%d", self.activePuzzleNumber]];
        FifteenItem *readItem = [NSKeyedUnarchiver unarchiveObjectWithData:readItemData];
        
        [fifteen setActiveNumber:[readItem.currentFifteenLevel intValue]];
        self.currentActiveLevel = [readItem.currentFifteenLevel intValue];
    
        levelId = [readItem.currentFifteenLevel intValue];
        
    }
    
    
    portalAvailable = TRUE;
    
    menuAnimationFinished = YES;
    self.allowRightLeftMenu = YES;
    
    self.thisIsTutorial = NO;
    
    if(!self._ifLevelsPressed){
        
        levelName = [levelModel getLevelNameById:levelId withActivePuzzleNumber:self.activePuzzleNumber];
        
    } else {
        levelName = [NSString stringWithFormat:@"newLevels/level%d/level%d", levelId, levelId];
        
    }
    
    
    NSString *globalLevelId = [levelName substringFromIndex: [levelName length] - 2];
    self.globalLevelNumber = [globalLevelId intValue];
    
    [scorelabel setString:[NSString stringWithFormat:@"Current scene: %d Current level: %d", [fifteen getActivePuzzleNumber], [fifteen getActiveLevelNumber]]];
    
    
    if([typeStr  isEqual: @"fifteen"]){

        fifteenEnabled = TRUE;
        self.newLevelLoading = YES;
        self.fifteenNewLevel = YES;
        [self emptyLevelScene];
        [self setLevelSettings:levelId];
    
    } else {
        
        [_levelNode removeChildByName:@"levels" cleanup:YES];
        self.fifteenNewLevel = NO;
        
        
        levels = (Levels*)[CCBReader load:levelName]; //goto load: yes )
        
        if (self.activePuzzleNumber == 11 && levelId==1){
        
            levels.leftMenuFirstClosed = NO;
        
        } else {
        
            levels.leftMenuFirstClosed = YES;
        
        }

        levels.gameplayParrentDelegate = self;
        levels.name = @"levels";
        levels.levelFlipped = NO;
        levels.levelOriginId = self.globalLevelNumber;
        
         _contentNode.scaleY = 0.955;
        
        [_levelNode addChild:levels];
        
        [self setLevelSettings:levelId];
       

    }

    _onDoubleJump = 0;
    
}


-(void) setLevelSettings:(int)levelId {
    
    
    if(levelId == 70){
        
        self.rusty.scale = 0.9;
        
        
        CCActionScaleBy *grow = [CCActionScaleTo actionWithDuration:0 scale:0.9];
        [self.rusty runAction:[CCActionRepeatForever actionWithAction:grow]];
    
    
    
    } else if(levelId == 37){
        
        killingWaves = (WaterKillClass*)[CCBReader load:@"newLevels/level37/move_wave/killingWaves"];
        killingWaves.gameplayParrentDelegate = self;
        killingWaves.zOrder = 50;
        [_physicsNode addChild:killingWaves];
        
        bubbles = [CCBReader load:@"newLevels/level37/move_wave/deadRusty"];
        bubbles.position = ccp(10, 10);
        bubbles.visible = NO;
        [self.rusty addChild:bubbles];
        
    } else if(levelId == 54){
        
        rustyJump = 28;
        rustySpeed = 66;
        
        self.rusty.scale = 0.7;
        
        
        CCActionScaleBy *grow = [CCActionScaleTo actionWithDuration:0 scale:0.7];
        [self.rusty runAction:[CCActionRepeatForever actionWithAction:grow]];
    
    
    } else if(levelId == 67){
        
        _ghostSprite1 = [Ghost node];
        _ghostSprite2 = [Ghost node];
        
        [_ghostSprite2 toggleVisible: ccp(299, 306)];
        [_ghostSprite1 toggleVisible: ccp(70, 47)];
        
        
        
        _ghostSprite1.name = @"_ghostSprite1";
        _ghostSprite2.name = @"_ghostSprite2";
        
        
        [levels addChild:_ghostSprite1];
        [levels addChild:_ghostSprite2];
        
        
        levels._rustyMask.zOrder = 0;
        
        
    } else if(levelId == 33){
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [defaults objectForKey:@"rememberPoints"];
        NSArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if([myArray count] < 2){
            
            rememberPoints = [NSMutableArray arrayWithObjects:
                              [NSValue valueWithCGPoint:CGPointMake(5.5, 6.6)],
                              nil];
            
        } else {
            
            rememberPoints = [(NSArray*)myArray mutableCopy];
            rememberPointsTest = YES;
        }
        
    }
    
    if(levelId == 65){
        self.gravityIsChange = YES;
    }
    
    if(levelId == 62){
        
        for (CCNode *item in levels.children) {
            
            if([item.name isEqualToString:@"hide"]){
                item.anchorPoint = ccp(0.5, 0.5);
                item.scale = 0;
                item.rotation = 8;
            }
            
            if([item.name isEqualToString:@"hide-opacity"] || [item.name isEqualToString:@"hide-region1"] || [item.name isEqualToString:@"hide-region2"]){
                item.scale = 0;
            }
            
        }
        
        
    }
    
}


-(void) makeGhostAppear:(int)ghostId{
    
    
    if(ghostId == 1){
        
        [_ghostSprite1 makeGhostAppear];
        
        NSLog(@"makeGhostAppear 1");
        
    } else if(ghostId == 2){
        
        [_ghostSprite2 makeGhostAppear];
        
        NSLog(@"makeGhostAppear 2");
        
    } else if(ghostId == 3){
        
        
        [_ghostSprite1 makeGhostDissapear];
        
         NSLog(@"makeGhostDissAppear 1");
        
    } else if(ghostId == 4){
        
        
        [_ghostSprite2 makeGhostDissapear];
        
        NSLog(@"makeGhostDissAppear 2");
    }
    
    
}

-(void)flipLevel{
  
    
//    _levelNode.scaleX *= -1;
    
    
//    
//    CCActionScaleBy *grow = [CCActionScaleTo actionWithDuration:0 scaleX:-1 scaleY:1];
//    [_levelNode runAction:[CCActionRepeatForever actionWithAction:grow]];
//    
//    
//    CCActionScaleBy *grow2 = [CCActionScaleTo actionWithDuration:0 scaleX:-1 scaleY:1];
//    [levels runAction:[CCActionRepeatForever actionWithAction:grow2]];
//    
    
    
//    _levelNode.rotation = 180;
//    _levelNode.position = ccp(512, 384);
//
//    _levelNode.scaleY = -1;
//    _levelNode.position = ccp(512, 0);

    
   
    
  //  for(CCNode *node in [levels children]) {
    
//        node.physicsBody = nil;
//    }
    
    

    if(!levels.levelFlipped){
        
        levels.levelFlipped = YES;
        
        for(CCNodeColor *node2 in [levels children]) {
            if([node2 isKindOfClass:[CCNodeColor class]]){
                
                node2.position = ccp(512-node2.position.x, node2.position.y);
                
            }
        }
        
    } else {
        
        
        for(CCNodeColor *node2 in [levels children]) {
            if([node2 isKindOfClass:[CCNodeColor class]]){
                
                node2.position = ccp(512-(512-node2.position.x), node2.position.y);
                
            }
        }
        
        levels.levelFlipped = NO;
    }
    
    
    
    [self.rusty.physicsBody applyImpulse:ccp(0, 0.001)];
    
//    for(CCNodeColor *node2 in [levels children]) {
//         if([node2 isKindOfClass:[CCNodeColor class]]){
//            node2.physicsBody = nil;
//            node2.physicsBody = NULL;
//            
//            node2.physicsBody = [CCPhysicsBody bodyWithRect:CGRectMake(node2.position.x, node2.position.y, node2.boundingBox.size.width, node2.boundingBox.size.height) cornerRadius:0];
//            node2.physicsBody.type = CCPhysicsBodyTypeStatic;
//        }
//    }
    
    
    
//    levels.position = ccp(200, 0);
    
    
    NSLog(@"FLIPPED");

}


- (int)randomValueBetween:(int)min and:(int)max {
    return (int)(min + arc4random_uniform(max - min + 1));
}

-(void) setRustyRandomSpeed:(int)aditionalSpeed{
    int tempRustySpeed = [self randomValueBetween:140 and:150+aditionalSpeed];
    rustySpeed = tempRustySpeed;
    NSLog(@"tempRustySpeed = %i", tempRustySpeed);
}

-(void) setRustyRandomJump:(int)aditionalJump{
    rustyJump = _defaultRustyJump-aditionalJump;
    NSLog(@"rustyJump = %i", rustyJump);
}

-(void) clearLevels{
    [_levelNode removeChildByName:@"levels" cleanup:YES];
    
    
    
    
}

-(void) emptyLevelScene {
    
    
    
//    CCScene *myScene = [[CCDirector sharedDirector] runningScene];
    CCNode *node = [_levelNode.children objectAtIndex:0];
    UIImage *img = [self screenshotWithStartNode:node];
    
    
    int contentScale = 0;
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]
        && [[UIScreen mainScreen] scale] >= 2.0) {
        // Retina
        contentScale = 4;
    } else {
        // Not Retina
        contentScale = 2;
    }
    
    
    CCTexture *test = [[CCTexture alloc] initWithCGImage:img.CGImage contentScale:contentScale];
    CCSprite *sprite = [CCSprite spriteWithTexture:test];
    
    
    
    [_levelNode removeChildByName:@"levels" cleanup:YES];
    
    
    
    
    self.fifteenNewLevel = YES;
    
    NSLog(@"levelName = %@", levelName);
    
    levels = (Levels*)[CCBReader load:levelName];
    levels.name = @"levels";
    levels.gameplayParrentDelegate = self;
    [_levelNode addChild:levels];
    
    sprite.position = ccp([[CCDirector sharedDirector] viewSize].width/2, [[CCDirector sharedDirector] viewSize].height/2);
    sprite.name = @"screenshot";
    [_levelNode addChild:sprite];
    
    respawnAnimation.visible = NO;
    
    
    
    
    int runPixelsX = 0;
    int runPixelsY = 0;
    
    
    if([fifteen.currentDirectionString  isEqual: @"left"]){
        
        runPixelsX = -512;
        
    } else if([fifteen.currentDirectionString  isEqual: @"right"]){
        
        runPixelsX = 512;
        
    } else if([fifteen.currentDirectionString  isEqual: @"up"]){
        
        runPixelsY = 384;
        
    } else if([fifteen.currentDirectionString  isEqual: @"down"]){
        
        runPixelsY = -384;
        
    }
    
    levels.position = ccp(runPixelsX, runPixelsY);

    
    CCActionMoveTo *moveTo = [CCActionMoveTo actionWithDuration:1 position:ccp([[CCDirector sharedDirector] viewSize].width/2-runPixelsX, [[CCDirector sharedDirector] viewSize].height/2 - runPixelsY)];
    id moveToWithEase = [CCActionEaseInOut actionWithAction:moveTo rate:2];
    
    
    CCActionMoveTo *moveToLevels = [CCActionMoveTo actionWithDuration:1 position:ccp(0, 0)];
    id moveToLevelsWithEase = [CCActionEaseInOut actionWithAction:moveToLevels rate:2];
    
    
    [sprite runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveToWithEase, [CCActionCallFunc actionWithTarget:self selector:@selector(newLevelLoadingOff)], nil]];
    
    //onComplete SPawnRusty and set newLevelLoading = NO;
    
//    self.rusty.position = levels.getRustyPos;
    
    [levels runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveToLevelsWithEase, nil]];
    
//    self.rusty.physicsBody.sensor = YES;
    
    
    
    
}

-(void) newLevelLoadingOff {
    self.newLevelLoading = NO;
    
    if(self.fifteenNewLevel){
        self.fifteenNewLevel = NO;
        [self spawnRusty:levels.getRustyPosition];
    }
    
    [levels moveRustyMaskToPosition:levels.getRustyPosition];
    [_levelNode removeChildByName:@"screenshot" cleanup:YES];
    
}

-(UIImage*) screenshotWithStartNode:(CCNode*)stNode
{
    [CCDirector sharedDirector].nextDeltaTimeZero = YES;
    
    CGSize winSize = [[CCDirector sharedDirector] viewSize];
    CCRenderTexture* renTxture =
    [CCRenderTexture renderTextureWithWidth:winSize.width
                                     height:winSize.height];
    [renTxture begin];
    [stNode visit];
    [renTxture end];
    
    
    return [renTxture getUIImage];
    
}
// )))) находим инит метод этого файла

-(void) testFunc {
    
    //вот тут например должен вызватся //ок
//    NSLog(@"---------The GREAT test func");
    
    self.rustyIsDead = YES;
    self.newLevelLoading = NO;
    
    [self spawnRusty:levels.getRustyPosition];
    
}

-(void) spawnRusty:(CGPoint)startPoint{
    
    if(self.globalLevelNumber == 33){
        CCActionFollow *follow = [CCActionFollow actionWithTarget:self.rusty worldBoundary:CGRectMake(0, 0, 2560, 384)];
        [levels runAction:follow];
        [_levelNode runAction:follow];
        [_physicsNode runAction:follow];
    }
    
    if(!self.newLevelLoading && !self.rustyKilledByWater){
        bubbles.visible = NO;
        respawnAnimation.visible = YES;
        respawnAnimation.position = startPoint;
        levels._rustyMask.position = startPoint;
        self.rusty.position = startPoint;
        self.rusty.physicsBody.velocity = ccp(0,0);
        self.rusty.physicsBody.sensor = NO;
        self.rusty.visible = NO;
        [levels nullSpeedContainers];
        [respawnAnimation.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
        [respawnAnimation.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        [respawnAnimation.animationManager setCompletedAnimationCallbackBlock:^(id sender) {
            
            self.rusty.visible = YES;
            [levels moveRustyMaskToPosition:startPoint];
            self.rusty.scale = 0;
            self.rusty.opacity = 0;
            
            id scaleUpAction = [CCActionScaleTo actionWithDuration:0.2 scaleX:1 scaleY:1];
            [self.rusty runAction:scaleUpAction];
            
            id alphaAction = [CCActionFadeIn actionWithDuration:0.2];
            [self.rusty runAction:alphaAction];
            
            
            NSTimer *deadRustyTriger = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(finishEstablishingRusty) userInfo:nil repeats:NO];
            
            
            
            
        }];
        
    }
    
}

-(void) finishEstablishingRusty{
    
   self.rustyIsDead = NO;
    self.newLevelLoading = NO;
}



#pragma mark - CustomButtonProtocol implementation


-(void) closeRightMenu{
    menuAnimationFinished = YES;
}



-(void) exitToMain{
    
    [_levelNode removeChildByName:@"levels" cleanup:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"someUnicNameKeyLOHPIDR" object:nil];
   
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[rememberPoints copy]];
    [userDefaults setObject:data forKey:@"rememberPoints"];
    [userDefaults synchronize];
    
    [[CCDirector sharedDirector]
                 replaceScene:[CCBReader loadAsScene:@"GamePlay"]];
}

- (void)leftTouch

{
    
    
    
    
    
    //rustyOnPlatform
    //если на платформе - добавлять к скорости расти скорость платформы
    
    
    
    
    
    
    
    
    if(!fifteenEnabled && !self.rustyIsDead && !_physicsNode.paused && levels.allowRustyMoveTutorial){
        _forwardMarch = FALSE;
        _backwardMarch = TRUE;
        _touchStopped = FALSE;
        
//        [self.rusty makeMovement:1];
        
        self.portalTimerCreated = NO;
        self.rustyMoving = YES;
        
        if(levels.rightFirstPressed){
            levels.leftFirstPressed = YES;
        }
        
        [self.buttonController triggerSpriteVisibility:1];
        
        
    } else {
        
        //NSLog(fifteenEnabled ? @"fifteenEnabled = Yes" : @"fifteenEnabled = No");
        //NSLog(self.rustyIsDead ? @"self.rustyIsDead = Yes" : @"self.rustyIsDead = No");
        
        //NSLog(@"rusty is dead");
    }
}

- (void)rightTouch
{
    if(!fifteenEnabled && !self.rustyIsDead && !_physicsNode.paused && levels.allowRustyMoveTutorial){
        _touchStopped = FALSE;
        _backwardMarch = FALSE;
        _forwardMarch = TRUE;
        
//        [self.rusty makeMovement:2];
        
        self.portalTimerCreated = NO;
        self.rustyMoving = YES;
        
        levels.rightFirstPressed = YES;
        
        [self.buttonController triggerSpriteVisibility:2];
        
    }
}


- (void)upTouch
{
    
    if(!fifteenEnabled && !self.rustyIsDead && !_physicsNode.paused && levels.allowRustyMoveTutorial){

        if(self.gravityIsChange){
            if(gravityReveresed){
                
                gravityReveresed = false;
                _physicsNode.gravity = ccp(0, -800);
                [self.rusty.physicsBody applyImpulse:ccp(0, 0.001)];
                CCActionRotateTo *rustyRotate = [CCActionRotateTo actionWithDuration:0.2 angle:0];
                [self.rusty runAction:rustyRotate];
                
            } else if(!gravityReveresed){
                
                gravityReveresed = true;
                _physicsNode.gravity = ccp(0, 800);
                [self.rusty.physicsBody applyImpulse:ccp(0, 0.001)];
                CCActionRotateTo *rustyRotate = [CCActionRotateTo actionWithDuration:0.2 angle:180];
                [self.rusty runAction:rustyRotate];
            }
            
            
            
            
            
        } else {
            
            if (_onDoubleJump < 2){
                _physicsNode.gravity = ccp(0, -500);
                
                self.rusty.physicsBody.velocity = ccp(0, 0);
                [self.rusty.physicsBody applyImpulse:ccp(0, rustyJump)];
                [self.rusty startJump];
                self.rustyMoving = YES;
                self.portalTimerCreated = NO;
                rustyOnPlatform = NO;
                [self.buttonController triggerSpriteVisibility:3];
                
                if(self.rusty.physicsBody.velocity.y > -100){
                    _onDoubleJump++;
                    
                    if(_onDoubleJump == 2){
                        levels.firstDoubleJump = YES;
                    }
                    
                } else {
                    _onDoubleJump = 2;
                }
            }
            
        }
    }
}


-(void) buttonControllerSwitchJump{
    [self.buttonController triggerSpriteVisibility:4];
//    [self.rusty touchStopped];
    
}

-(void) manageButtonTouchLight:(float)positionX{
//    [self.buttonController moveTouchLight:positionX];
    
}

-(void)stopTouch
{
    _backwardMarch = FALSE;
    _forwardMarch = FALSE;
    
    _touchStopped = TRUE;
    
    [self.buttonController triggerSpriteVisibility:0];
    
//    [self.rusty touchStopped];
    
    //self.rusty.physicsBody.velocity = ccp(0, self.rusty.physicsBody.velocity.y);
    //self.rusty.physicsBody.velocity = ccpMult(self.rusty.physicsBody.velocity, ccpMult(ccp(120);
    
    
}

- (void)buttonHandler
{
    //NSLog(@"asdasda");
}

- (void)update:(CCTime)delta
{
    
//    if([rememberPoints count] > 1 && rememberPointsTest){
//        self.rusty.position = [[rememberPoints objectAtIndex:currentRememberPosition] CGPointValue];
//        currentRememberPosition++;
//    } else {
//        [rememberPoints addObject:[NSValue valueWithCGPoint:CGPointMake(self.rusty.position.x, self.rusty.position.y)]];
//    }
    
    if(self.globalLevelNumber == 62){
        //Невидимые платформы
        for (CCNode *item in levels.children) {
             if([item.name isEqualToString:@"hide"]){
                 if(CGRectContainsPoint(CGRectMake(item.position.x-40, item.position.y-40, item.boundingBox.size.width+80, item.boundingBox.size.height+80), self.rusty.position) && item.scale == 0){
                     item.visible = YES;
                     CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:1.25];
                     CCActionScaleTo *scaleActionNext = [CCActionScaleTo actionWithDuration:0.07 scale:1];
                     CCActionRotateTo *rotateTo = [CCActionRotateTo actionWithDuration:0.03 angle:-8];
                     CCActionRotateTo *rotateTo2 = [CCActionRotateTo actionWithDuration:0.03 angle:5];
                     CCActionRotateTo *rotateTo3 = [CCActionRotateTo actionWithDuration:0.03 angle:0];
                     CCActionSequence *mySeq = [CCActionSequence actions:scaleAction, scaleActionNext, rotateTo, rotateTo2, rotateTo3, nil];
                     [item runAction:mySeq];
                 }
             }
            
            if([item.name isEqualToString:@"hide-opacity"] && item.scale == 0){
                if(CGRectContainsPoint(CGRectMake(item.position.x-40, item.position.y-40, item.boundingBox.size.width+80, item.boundingBox.size.height+80), self.rusty.position) && item.scale == 0){
                    CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:1];
                    [item runAction:scaleAction];
                }
            }
        
        }
        
        
    }
    
    CGRect waterRect = CGRectMake(killingWaves.imageWaves.position.x-256, killingWaves.imageWaves.position.y+180, killingWaves.imageWaves.boundingBox.size.width, -370);
    
    if(CGRectContainsPoint(waterRect, self.rusty.position) && !self.rustyIsDead && !self.rustyKilledByWater){
        self.rusty.physicsBody.sensor = TRUE;
        self.rustyIsDead = YES;
        self.rustyKilledByWater = YES;
        [killingWaves moveWaterToInitPosition];
        bubbles.visible = YES;
        [bubbles.animationManager jumpToSequenceNamed:@"timeline" time:0];
        [bubbles.animationManager runAnimationsForSequenceNamed:@"timeline"];
    }
    
    [streak setPosition:self.rusty.position];
    
    if(!fifteenEnabled){
        
        if(_touchStopped && !rustyOnPlatform){
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
            [self.rusty.physicsBody applyImpulse:ccp(0.1*delta, 0)];
            self.rusty.position = ccp(self.rusty.position.x + rustySpeed*delta, self.rusty.position.y);
        }
        
        if (_backwardMarch) {
            [self.rusty.physicsBody applyImpulse:ccp(-0.1*delta, 0)];
            self.rusty.position = ccp(self.rusty.position.x - rustySpeed*delta, self.rusty.position.y);
        }
        
        
        
        
        if(self.rusty.physicsBody.velocity.x == 0 && roundf(self.rusty.physicsBody.velocity.y) == 0){
            self.rustyMoving = false;
        }
        
        
        if (self.rusty.position.y < -150) {
            
            if(!self.newLevelLoading && !self.fifteenNewLevel){
                [topBar updateDeath];
                
                [fifteen updateSomeData];
                
                NSLog(@"This one");
                [self retry];
            }
            
        }
    }
    
    
    if(leftMenu.leftMenuEnabled){
  
        moveLeft.visible = NO;
        levels.leftMenuFirstStart = YES;
        
    } else {
        moveLeft.visible = YES;
        
    }
    
    
    
}

- (void)retry
{
    
    if(self.globalLevelNumber == 62){
        
        for (CCNode *item in levels.children) {
            
            if([item.name isEqualToString:@"hide"]){
//                item.visible = NO;
                
                CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.25 scale:0];
                CCActionRotateTo *rotateTo = [CCActionRotateTo actionWithDuration:0.05 angle:8];
                CCActionSequence *mySeq = [CCActionSequence actions:scaleAction, rotateTo, nil];
                
                [item runAction:mySeq];
                
            }
            
            if([item.name isEqualToString:@"hide-opacity"]){
                
                
                CCActionScaleTo *scaleAction = [CCActionScaleTo actionWithDuration:0.08 scale:0];
                [item runAction:scaleAction];
                
            }

            
        }
        
        
    }
    
    if(self.globalLevelNumber == 65){
        gravityReveresed = false;
        self.rusty.rotation = 1;
        _physicsNode.gravity = ccp(0, -500);
    }
    
    if(self.globalLevelNumber == 54){
        rustyJump = 28;
        rustySpeed = 66;
    } else{
        rustySpeed = self.defaultRustySpeed;
        rustyJump = self.defaultRustyJump;
    }
    
    if(self.globalLevelNumber == 33){
        self.gravityIsChange = NO;
        gravityReveresed = false;
        self.rusty.rotation = 0;
        _physicsNode.gravity = ccp(0, -500);
        
        
    }
    
    self.rustyIsDead = YES;
    
    rustySpeed = self.defaultRustySpeed;
    
    self.rusty.physicsBody.velocity = ccp(0,0);
    _forwardMarch = FALSE;
    _backwardMarch = FALSE;
    _touchStopped = TRUE;
    
    
    
    //[levels updateRustyMask];
   
    if(!self.rustyDeadFirstTime){
        self.rustyDeadFirstTime = YES;
    }
    [self spawnRusty:levels.getRustyPosition];
    
    
    
    [_ghostSprite1 makeGhostDissapear];
    [_ghostSprite2 makeGhostDissapear];
    
    [levels rustyIsDeadAlreadyMotherFucka];
    
}


- (BOOL)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair*)pair
                              water:(WaterKillClass*)nodeA
                           wildcard:(CCNode*)nodeB
{
    

    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"fall1"]){
    
        nodeB.physicsBody.sensor = YES;
        
        return NO;

    } else {
        return YES;

    }
    
    
    return NO;
    
    
}



- (BOOL)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair*)pair
                              rusty:(Rusty*)nodeA
                           wildcard:(CCNode*)nodeB
{
    
    
//    if(self.globalLevelNumber == 62){
//        
//        nodeB.visible = YES;
//        
//    }
    
    normalX = pair.contacts.normal.x;
    normalY = pair.contacts.normal.y;
    
    collisionType = nodeB.physicsBody.collisionType;
    
    
    //NSLog(@"nodeB.physicsBody.type = %u", nodeB.physicsBody.type);
//    NSLog(@"nodeB.physicsBody.collisionType = %@", nodeB.physicsBody.collisionType);
    
    //    if (nodeB.physicsBody.type == 2) {
    //        _onDoubleJump = 0;
    //    }
    
    
    //    NSLog(@"self.rusty.physicsBody.velocity.y = %f", self.rusty.physicsBody.velocity.y);
    
    
    
    
    
    if(fabs(pair.contacts.normal.x)==0 && pair.contacts.normal.y>0)
    {
        
//                NSLog(@"Top");
   
    } else if((fabs(pair.contacts.normal.x)==0 || pair.contacts.normal.x==-1) && (pair.contacts.normal.y==0 || pair.contacts.normal.y>0)){
    
//                NSLog(@"BottomLeft");
    
    } else if((fabs(pair.contacts.normal.x)==0 || pair.contacts.normal.x==1) && (pair.contacts.normal.y==0 || pair.contacts.normal.y>0)){
        
//                    NSLog(@"BottomRight");
    } else {
        
 
        if (self.rusty.physicsBody.velocity.y <= 0 && self.rusty.physicsBody.velocity.y >= -0.30) {
            
            
            if((pair.contacts.normal.x >= -0.9 && pair.contacts.normal.x <= 0.75) && pair.contacts.normal.y <= 0.5){
                _onDoubleJump = 0;
                
            }
            
            
        } else {
   
            
            if((pair.contacts.normal.x >= -0.9 && pair.contacts.normal.x <= 0.75) && pair.contacts.normal.y <= 0.5){
                _onDoubleJump = 0;
             }
            
            
            
        }
        
    }
    
//    NSLog(@"pair.contacts.normal.x = %f", pair.contacts.normal.x);
//    NSLog(@"pair.contacts.normal.y = %f", pair.contacts.normal.y);
    
    if(pair.contacts.normal.x==0 && pair.contacts.normal.y<0){
//        [self.rusty tryAnimation:1];
    }
    
    if(fabs(pair.contacts.normal.x)==0 && pair.contacts.normal.y>0)
    {
        //        CCLOG(@"Top");
    }
    
    if(pair.contacts.normal.x==-1 && pair.contacts.normal.y==0)
    {
        //        CCLOG(@"Left");
//        [self.rusty tryAnimation:2];
        
    }
    if(pair.contacts.normal.x==1 && pair.contacts.normal.y==0)
    {
        //        CCLOG(@"Right");
    }
    
    
    
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"_boss"]){
        
        NSLog(@"THIS is BOSS");
        
    }
    
    
    
    
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"platform"]){
        
        
        if(fabs(pair.contacts.normal.x)==0 && pair.contacts.normal.y>0)
        {
            NSLog(@"Platform TOP");
            
//        } else if(pair.contacts.normal.x==0 && pair.contacts.normal.y<0){
        } else if(pair.contacts.normal.x<0.8 && pair.contacts.normal.y<=0){
            
            //NSLog(@"Bottom");
            
            
//            _onDoubleJump = 0;
            
            
            
            rustyOnPlatform = YES;
            
            
            nodeB.physicsBody.friction = 0;
            currentPlatform = nodeB;
  
           
            
            
            if(!_forwardMarch || !_backwardMarch){
            
                
                self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x, self.rusty.physicsBody.velocity.y);

            } else {

                
                if(_forwardMarch && nodeB.physicsBody.velocity.x <= 0){
                    
                    self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x+50, self.rusty.physicsBody.velocity.y);
                    
                } else if(_backwardMarch && nodeB.physicsBody.velocity.x > 0){
                    
                    self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x-50, self.rusty.physicsBody.velocity.y);
                }
                
                
            }
            
            
            
        }
        
        
        
        
    } else {
        rustyOnPlatform = NO;
    }
    
    if([nodeB.physicsBody.collisionType  isEqual: @"fall1"]){
        
//        if(fabs(pair.contacts.normal.x)==0 && pair.contacts.normal.y<0)
        if(fabs(pair.contacts.normal.x)<0.8 && pair.contacts.normal.y<=0)
        {
            _onDoubleJump = 0;
            [levels initFall:nodeB _fallId:1 _initialPos:nodeB.position];
            
        }
        
    }
    
    if([nodeB.physicsBody.collisionType  isEqual: @"fall2"]){
//        if(fabs(pair.contacts.normal.x)==0 && pair.contacts.normal.y<0)
        if(fabs(pair.contacts.normal.x)<0.8 && pair.contacts.normal.y<=0)
        {
            _onDoubleJump = 0;
            [levels initFall:nodeB _fallId:2 _initialPos:nodeB.position];
        }
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
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"spike"] && !self.newLevelLoading && !freezeEnabled){
        
        [topBar updateDeath];
        [fifteen updateSomeData];
        
        
        NSLog(@"SPIKE spotted");
        [self retry];
    }
    
    
    
    
    
    if([nodeB.physicsBody.collisionType  isEqual: @"water"] && !self.newLevelLoading && !freezeEnabled){
    
        
        self.rusty.physicsBody.sensor = TRUE;
//        _physicsNode.gravity = ccp(0, -300);
        self.rustyIsDead = YES;
        
        self.rustyKilledByWater = YES;

        [killingWaves moveWaterToInitPosition];
        
       
        
        bubbles.visible = YES;
        
        [bubbles.animationManager jumpToSequenceNamed:@"timeline" time:0];
        [bubbles.animationManager runAnimationsForSequenceNamed:@"timeline"];

//        CCActionSpawn *myBuublesSpawn = [CCActionSpawn actions:[CCActionFadeIn actionWithDuration:2], [CCActionMoveTo actionWithDuration:2 position:ccp(10,10)], nil];
//        CCActionSequence *showSeq = [CCActionSequence actions:[CCActionDelay actionWithDuration:2], myBuublesSpawn, nil];
//        
//        [bubbleHolder runAction:showSeq];
        
        
        return NO;
        
        
   
    
    }
    
    
    return YES;
    
}

-(void) spawnRustyFromWater{
    
    if(self.rustyIsDead){
        self.rustyKilledByWater = NO;
        self.rustyIsDead = NO;
        self.newLevelLoading = NO;
        
        [self spawnRusty:levels.getRustyPosition];
        
        NSLog(@"spawnRustyFromWater");
    }
    
}



-(void)showTime:(NSTimer *)sender
{
    self.levelSeconds++;
    if (self.levelSeconds == 60)
    {
        self.levelSeconds = 0;
        self.levelMinutes++;
        
    }
    
    NSString *_myStr = [NSString stringWithFormat:@"%02i:%02i", self.levelMinutes, self.levelSeconds];
    
    
    [topBar updateTimerData:_myStr];
    
    
//    [_txtTime setString:_myStr];
    
}


- (void)showFifteenFromGameNew:(int)moveDirection {
    
    
    
    
    
        fifteenEnabled = TRUE;
        fifteen.visible = TRUE;
        portalAvailable = FALSE;
    
        [fifteen showFifteen:moveDirection];
    
    
    
    
    
}



-(void) hideFifteen {
   
    
    
    //_levelNode.opacity = 0;
    //_levelNode.position = ccp(0,0);
    
    //[_levelNode runAction:[CCActionFadeIn actionWithDuration:0.5]];
    //[leftMenu setupData:fifteen.fifteenOriginHolder withCurrentFifteen:fifteen.fifteenShuffleHolder];
    
    [fifteen hideFifteen];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(visibleOff) userInfo:nil repeats:NO];
    NSTimer *timerAvail = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(manageAvail) userInfo:nil repeats:NO];
    
    
    id scaleUpAction = [CCActionScaleTo actionWithDuration:0.1 scaleX:1 scaleY:1];
    id alphaAction = [CCActionFadeIn actionWithDuration:0.1];
    
    [self.rusty runAction:alphaAction];
    [self.rusty runAction:scaleUpAction];
    
    
}

-(void) visibleOff {
    levels.fifteenEnabled = NO;
    
    fifteenEnabled = FALSE;
    fifteen.visible = FALSE;
}

-(void) manageAvail {
    portalAvailable = TRUE;
    [self.portalTimer invalidate];
    self.portalTimer = nil;
}

-(void) moveRustyToPosition:(CGPoint)myPos{
    self.rusty.position = myPos;
    
}


-(void) swipeLeft {
   
}

-(void) swipeRight {
    
    CCActionMoveTo *moveMenu;
    
    if(leftMenuEnabled){
        leftMenuEnabled = NO;
        moveMenu = [CCActionMoveTo actionWithDuration:0.3 position:ccp(-150, 0)];

    } else {
        moveMenu = [CCActionMoveTo actionWithDuration:0.3 position:ccp(0, 0)];

    }
    
    id moveHighlightWithEase = [CCActionEaseInOut actionWithAction:moveMenu rate:2];
    
//    [leftMenu runAction:moveHighlightWithEase];
    
    
    
    
//    [_contentNode addChild:fifteen.getOriginFifteen];
    
    
}



- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    
        CGPoint touchLocation = [touch locationInNode:_contentNode];
        firstTouch = touchLocation;
    
}

-(void) touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    
    //CGPoint touchLocation = [touch locationInNode:_contentNode];
    
    
}

-(void) touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    
    //CGPoint touchLocation = [touch locationInNode:_contentNode];
    
    
    
   

    
}


-(void)pauseGamePlayScene{
    //for(CCSprite *sprite in [self children]) {
        
//        [[CCDirector sharedDirector] stopAnimation];
    
    
    
    if(!self.thisIsTutorial){
        
        _physicsNode.paused = YES;
        self.rustyIsDead = YES;
        self.isGamePaused = YES;
        
        }
    
    
    //}
}

-(void)resumeGamePlayScene{
    
    _physicsNode.paused = NO;
    self.rustyIsDead = NO;
    self.isGamePaused = NO;
    
}


-(void) moveFifteenHighlightTutorial:(CGPoint) myPoint{
    

    [leftMenu moveTutorialHighlight:myPoint];
    
}



-(void) manageGlobalDeath{
    globalDeathTriger = YES;
}



-(void) showBossStory:(int) bossLevelId {
    
    [self pauseGamePlayScene];
    
    bossStory = (BossStory*)[CCBReader load:@"bossScreens/BossStory"];
    bossStory.newLevelId = bossLevelId;
    bossStory.gameplayParrentDelegate = self;
    [self addChild:bossStory];
    
    
}


-(void) addNewCheckPoint {
    [levels setRustyPosition:self.rusty.position];
}


-(void) switchLightOff {
    
    if(levels._rustyMask.visible){
        
        levels._rustyMask.visible = NO;
        
        
    } else {
        
        levels._rustyMask.visible = YES;
        
    }

}

-(void) showWinAnimation {

    [fifteen showWinAnimation];

}

-(void) freezeLevel:(BOOL)freeze {
    freezeEnabled = freeze;
    [levels setFreeze:freeze];
    
}



-(void) showFifteenFinalStats{
    
    fifteen.visible = TRUE;
    [fifteen showFifteenFinalStats];
    
    
}

-(void) removeBossStory{
    
    [self removeChild:bossStory];
    [self resumeGamePlayScene];
}

@end
