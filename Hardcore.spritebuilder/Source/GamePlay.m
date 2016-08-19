#import "GamePlay.h"
#import "Levels.h"
#import <CCPhysics+ObjectiveChipmunk.h>
#import "Fifteen.h"
#import "MainMenu.h"
#import "ButtonController.h"
#import "LeftMenu.h"
#import "RightMenu.h"
#import "FifteenItem.h"
#import "BossStory.h"


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
    BOOL menuAnimationFinished;
    
    BOOL fifteenEnabled;
    BOOL portalAvailable;
    BOOL fifteenTime;
    
    NSInteger _onDoubleJump;
    NSString* collisionType;
    float normalX;
    float normalY;
    
    Fifteen *fifteen;
    
    Levels* levels;
    
    BOOL _touchStopped;
    
    CCActionFadeOut *fadeOut;
    CCActionFadeTo *fadeIn;
    
    BOOL menuEnabled;
    CCNode *_rightMenu;
    
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
    
    
    
    RightMenu *rightMenu;
    LeftMenu *leftMenu;
    
    CGPoint firstTouch;
    CGPoint lastTouch;
    CGPoint currentTouch;
    CGPoint currentPrevTouch;
    BOOL touchMovingForward;
    
    BOOL leftMenuEnabled;
    BOOL rightMenuEnabled;
    
    CustomButton* moveLeft;
    CustomButton* moveUp;
    
    NSTimer *globalDeathTimer;
    BOOL globalDeathTriger;
    
    CCMotionStreak* streak;
    
    
    
    CCNode *currentPlatform;
    
    
    BossStory *bossStory;
    
    BOOL freezeEnabled;
    
    }


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        self.rustyCrystalNum = 0;
        self.rustyDeathNum = 100;
        self.rustyDeadFirstTime = NO;
        self.rustyDeadFirstTimeGlobal = NO;
        self.fifteenNewLevel = NO;
        freezeEnabled = NO;
        // отлично, добавляем обзервер
        
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testFunc) name:@"someUnicNameKeyLOHPIDR" object:nil];
        
        // ok теперь когда кто-то пошлет сообщение с таким ключем, то этот файл выполнит метод testFunc и нихуя ему не передаст
        self.myFontColor = [CCColor colorWithRed:0.114 green:0.83 blue:0.242];
        // теперь ищем место откуда послать сообщение
        
        
        
//        NSString *domainName = [[NSBundle mainBundle] bundleIdentifier];
//        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//
//        
//        
        
        
        

        
                
        
        
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
    
    //_rightMenu.visible = NO;
    self.portalTimerCreated = NO;
    self.rustyMoving = NO;
    
    rustyOnPlatform = NO;
    
    _levelsSelect = [[CCNode alloc] init];
    [_contentNode addChild:_levelsSelect];
    
    rustySpeed = 87;
    rustyJump = 36;
    
    
    //gameImageButtons = [CCBReader load:@"game_buttons"];
    
    mainMenu = (MainMenu*)[CCBReader load:@"startSelect"];
    mainMenu.gameplayParrentDelegate = self;
    
    _fifteenSelect.visible = NO;
    
    
    [self addChild:mainMenu];
    
    self.rustyIsDead = YES;
    

//    leftMenu = (LeftMenu*)[CCBReader load:@"MenuLeft"];
    
    
    
    leftMenu = [LeftMenu node];
    leftMenu.gameplayParrentDelegate = self;
    
//    rightMenu = [RightMenu node];
    rightMenu = (RightMenu*)[CCBReader load:@"RightMenu"];
    rightMenu.gameplayParrentDelegate = self;
    rightMenu.leftMenuDelegate = leftMenu;
    
    
    OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
    [audio playBg:@"vagner.mp3" loop:YES];
    
    
    
}



-(void) startupMenuFunc:(BOOL)ifLevelsPressed with15id:(int)_currentFifteenNumber {
    
    mainMenu.visible = false;
    
    
    self._ifLevelsPressed = ifLevelsPressed;
    
    if(self._ifLevelsPressed){
        
            int x_counter=0;
            int y_counter=0;
        
        
            for (int i = 1; i<=70; i++) {
        
        
        
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
    
    [self startGameWithLevel:sender.name.intValue withString:@"native"];
    
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
    
    
    //self.rusty = _levelRusty;
    
    
//    self.rusty = [CCBReader load:@"rusty/rusty"];
    
    
    
//    self.rusty = [[Rusty alloc] init];
    self.rusty = [CCBReader load:@"rusty/rusty"];
    
    
    
    
    fifteen = (Fifteen*)[CCBReader load:@"fifteen/fifteen"];
    fifteen.gameplayParrentDelegate = self;
    [fifteen setActivePuzzleNumber:self.activePuzzleNumber];
    
    fifteen.name = @"fifteen";
    
    _physicsNode.gravity = ccp(0, -500);
    //[self addChild:_contentNode];
    //[_contentNode addChild:_physicsNode];
    //self.rusty.position = ccp([[CCDirector sharedDirector] viewSize].width, [[CCDirector sharedDirector] viewSize].height);
    
    
    
    respawnAnimation = [CCBReader load:@"spawn/spawn"];
    respawnAnimation.visible = NO;
    [self addChild:respawnAnimation];
    
    
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
    
//    _physicsNode.debugDraw = YES;
    
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
    
    //CustomButton* callMenu = [CustomButton spriteWithImageNamed:@"up.png"];
    //callMenu.visible = NO;
    //_pauseButton.name = @"callMenu";
    //callMenu.userInteractionEnabled = YES;
    //callMenu.scale = .2;
    //callMenu.delegate = self;
    //callMenu.position = ccp(480, 350);
    //[_contentNode addChild:callMenu];
    
    //[self startGameWithLevel:@"levels/level1"];
    
    
    self.buttonController = [[ButtonController alloc] init];
    [_contentNode addChild:self.buttonController];
    
    
    [_contentNode addChild:fifteen];
    _contentNode.userInteractionEnabled = YES;
    
    
    
    NSLog(@"self.currentActiveLevel = %i", self.currentActiveLevel);
    
    [self startGameWithLevel:self.currentActiveLevel withString:@"native"];
    
    
    
    fadeOut = [CCActionFadeTo actionWithDuration:0.5 opacity:0];
    fadeIn = [CCActionFadeTo actionWithDuration:0.5 opacity:1];
    
    
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
    
    
    
    
    
    
    [_contentNode addChild:leftMenu];
    leftMenu.position = ccp(-150, 0);
    
    [_contentNode addChild:rightMenu];
    rightMenu.position = ccp([[CCDirector sharedDirector] viewSize].width+150, 0);
    
    
    
    [leftMenu setupData:fifteen.fifteenOriginHolder withCurrentFifteen:fifteen.fifteenShuffleHolder];
    
    
    [rightMenu updateData];
    //
    
    
    
    
//    self.rusty.physicsBody.collisionType = @"rusty";
    streak = [CCMotionStreak streakWithFade:0.3 minSeg:1 width:15 color:[CCColor colorWithCcColor3b:ccc3(255, 255, 255)] textureFilename:@"rustyFollowBack.png"];
   
    [_physicsNode addChild:streak];
    
    
    self.rusty.physicsBody.collisionType = @"rusty";
    [_physicsNode addChild:self.rusty];
    
    
    NSLog(@"collisionType = %@", self.rusty.physicsBody.collisionType);
    
    self.rusty.physicsBody.sensor = YES;
    
    
    
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
        
        
        if(self.currentActiveLevel != 11){
        
            leftMenu.fifteentutorialhighlight.visible = NO;
        
        } else {
            
            leftMenu.fifteentutorialhighlight.visible = YES;
        
        }
        
        
        
        
        
    } if([typeStr  isEqual: @"bossLevel"]){
    
        self.currentActiveLevel = 6;
    
    } else {
        
        
        
    }
    
    portalAvailable = TRUE;
    
    menuAnimationFinished = YES;
    self.allowRightLeftMenu = YES;
    
    self.thisIsTutorial = NO;
    
    if(!self._ifLevelsPressed){
        
        
        switch (levelId) {
            case 1:
                
                
                
                
                if(self.activePuzzleNumber == 1){
                    
                    
                    levelName = @"newLevels/level3/level3";
                    
                } else if(self.activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level30/level30";
                    
                } else if(self.activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level8/level8";
                    
                } else if(self.activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level28/level28";
                    
                } else if(self.activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level13/level13";
                    
                } else if(self.activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level10/level10";
                    
                } else if(self.activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level52/level52";
                    
                } else if(self.activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level41/level41";
                    
                } else if(self.activePuzzleNumber == 9){
                    
                    levelName = @"newLevels/level55/level55";
                    
                } else if (self.activePuzzleNumber == 10){
                    
                    levelName = @"newLevels/level59/level59";
                    
                    
                } else if (self.activePuzzleNumber == 11){
                    
                    self.thisIsTutorial = YES;
                    levels.leftMenuFirstClosed = NO;
                  
                    levelName = @"newLevels/level15/level15";
                    
                    
                } 
                
                
                
                break;
                
            case 2:
                
                
                
                if(self.activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level24/level24";
                    
                } else if(self.activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level5/level5";
                    
                } else if(self.activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level9/level9";
                    
                } else if(self.activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level20/level20";
                    
                } else if(self.activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level36/level36";
                    
                } else if(self.activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level18/level18";
                    
                } else if(self.activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level12/level12";
                    
                } else if(self.activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level32/level32";
                    
                } else if(self.activePuzzleNumber == 9){
                    
                    levelName = @"newLevels/level17/level17";
                    
                } else if (self.activePuzzleNumber == 10){
                    
                    levelName = @"newLevels/level58/level58";
                    
                } else if (self.activePuzzleNumber == 11){
                    
                    levelName = @"newLevels/level22/level22";
                    
                    
                }
                
                
                break;
                
            case 3:
                
                
                
                if(self.activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level4/level4";
                    
                } else if(self.activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level53/level53";
                    
                } else if(self.activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level11/level11";
                    
                } else if(self.activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level19/level19";
                    
                } else if(self.activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level25/level25";
                    
                } else if(self.activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level38/level38";
                    
                } else if(self.activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level43/level43";
                    
                } else if(self.activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level26/level26";
                    
                } else if(self.activePuzzleNumber == 9){
                    
                    levelName = @"newLevels/level56/level56";
                    
                } else if (self.activePuzzleNumber == 10){
                    
                    levelName = @"newLevels/level57/level57";
                    
                } else if (self.activePuzzleNumber == 11){
                    
                    levels.leftMenuFirstStart = NO;
                    self.thisIsTutorial = YES;
                    
                    levelName = @"newLevels/level23/level23";
              
                }
                
                
                break;
                
            case 4:
                
                
                
                if(self.activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level21/level21";
                    
                } else if(self.activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level7/level7";
                    
                    
                } else if(self.activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level14/level14";
                    
                } else if(self.activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level44/level44";
                    
                } else if(self.activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level45/level45";
                    
                } else if(self.activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level31/level31";
                    
                } else if(self.activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level49/level49";
                    
                } else if(self.activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level48/level48";
                    
                } else if(self.activePuzzleNumber == 9){
                    
                    levelName = @"newLevels/level54/level54";
                    
                } else if (self.activePuzzleNumber == 10){
                    
                    levelName = @"newLevels/level50/level50";
                    
                } else if (self.activePuzzleNumber == 11){
                    
                    levelName = @"newLevels/level27/level27";
             
                }
                
                
                
                break;
                
            case 5:
                
                
                if(self.activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level46/level46";
                    
                } else if(self.activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level16/level16";
                    
                } else if(self.activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level40/level40";
                    
                } else if(self.activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level2/level2";
                    
                } else if(self.activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level47/level47";
                    
                } else if(self.activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level1/level1";
                    
                } else if(self.activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level35/level35";
                    
                } else if(self.activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level29/level29";
                    
                } else if(self.activePuzzleNumber == 9){
                    
                    levelName = @"newLevels/level51/level51";
                    
                } else if (self.activePuzzleNumber == 10){
                    
                    levelName = @"newLevels/level39/level39";
                    
                } else if (self.activePuzzleNumber == 11){
                    
                    self.thisIsTutorial = YES;
                    self.firstTutorialWin = YES;
                    
                    
                    levelName = @"newLevels/level6/level6";
          
                }
                
                
                break;
                
                
            case 6:
                
                
                if(self.activePuzzleNumber == 1){
                    
                    levelName = @"newLevels/level46/level46";
                    
                    
                } else if(self.activePuzzleNumber == 4){
                    
                    levelName = @"newLevels/level16/level16";
                    
                } else if(self.activePuzzleNumber == 3){
                    
                    levelName = @"newLevels/level40/level40";
                    
                } else if(self.activePuzzleNumber == 2){
                    
                    levelName = @"newLevels/level2/level2";
                    
                } else if(self.activePuzzleNumber == 5){
                    
                    levelName = @"newLevels/level47/level47";
                    
                } else if(self.activePuzzleNumber == 6){
                    
                    levelName = @"newLevels/level1/level1";
                    
                } else if(self.activePuzzleNumber == 7){
                    
                    levelName = @"newLevels/level35/level35";
                    
                } else if(self.activePuzzleNumber == 8){
                    
                    levelName = @"newLevels/level29/level29";
                    
                } else if(self.activePuzzleNumber == 9){
                    
                    levelName = @"newLevels/level51/level51";
                    
                } else if (self.activePuzzleNumber == 10){
                    
                    levelName = @"newLevels/level39/level39";
                    
                } else if (self.activePuzzleNumber == 11){
                    
                    self.thisIsTutorial = YES;
                    self.firstTutorialWin = YES;
                    
                    
                    levelName = @"newLevels/level6/level6";
                    
                }
                
                
                break;
                
                
                
        }
        
    } else {
        levelName = [NSString stringWithFormat:@"newLevels/level%d/level%d", levelId, levelId];
        
    }
    
    
    
    
    NSString *globalLevelId = [levelName substringFromIndex: [levelName length] - 2];
    
    
    
    
//    levelName = @"newLevels/level1/level1_test";
    
    
    [scorelabel setString:[NSString stringWithFormat:@"Current scene: %d Current level: %d", [fifteen getActivePuzzleNumber], [fifteen getActiveLevelNumber]]];
    
    
    if([typeStr  isEqual: @"fifteen"]){
        
        
        
        fifteenEnabled = TRUE;
        self.newLevelLoading = YES;
        
//        [_levelNode runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], [CCActionMoveTo actionWithDuration:1 position:ccp(0, 0)], [CCActionCallFunc actionWithTarget:self selector:@selector(emptyLevelScene)], nil]];
//
        self.fifteenNewLevel = YES;
        
        [self emptyLevelScene];
        
        
        
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
        [_levelNode addChild:levels];
        
        
       
        
        
        if([globalLevelId intValue] == 15 || [globalLevelId intValue] == 23){
         
            leftMenu.fifteentutorialhighlight.visible = YES;
            
            
        } else {
            
            leftMenu.fifteentutorialhighlight.visible = NO;
        
        }

        
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            CCGLView *view = (CCGLView*)[[CCDirector sharedDirector] view];
//            NSAssert(view, @"Do not initialize the TextureCache before the Director");
//            
//            EAGLContext *auxGLcontext = [[EAGLContext alloc]
//                                         initWithAPI:kEAGLRenderingAPIOpenGLES2
//                                         sharegroup:[[view context] sharegroup]];
//            
//            if( [EAGLContext setCurrentContext:auxGLcontext] ) {
//                
//               
//                levels = (Levels*)[CCBReader load:levelName];
//                levels.name = @"levels";
//                levels.gameplayParrentDelegate = self;
//                [_levelNode addChild:levels];
//                self.newLevelLoading = NO;
//                
//                glFlush();
//                
//                [EAGLContext setCurrentContext:nil];
//            } else {
//                CCLOG(@"cocos2d: ERROR: TetureCache: Could not set EAGLContext");
//            }
//        });
        
        
        
        
    }
    
    
    
    
    _onDoubleJump = 0;
    
//    self.newLevelLoading = YES;
    
//    [_txtTime setString:@"00:00"];
    // CCEffectNode* effectNode = [CCEffectNode effectNodeWithWidth:_levelNode.contentSizeInPoints.width height:_levelNode.contentSizeInPoints.height];
    //effectNode.effect = [CCEffectBlur effectWithBlurRadius:30];
    
    
    
    
    
    
    
    
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
    
    
    if(!self.newLevelLoading){
        NSLog(@"=============== SPAWN RUSTY ================== with x=%f AND y=%f", startPoint.x, startPoint.y);
        
        //[_physicsNode removeChildByName:@"rusty" cleanup:YES];
        
        
        //self.rusty.name = @"rusty";
        
        respawnAnimation.visible = YES;
        
        
        respawnAnimation.position = startPoint;
        levels._rustyMask.position = startPoint;
    
        self.rusty.position = startPoint;
        self.rusty.physicsBody.velocity = ccp(0,0);
        self.rusty.physicsBody.sensor = NO;
        

        self.rusty.visible = NO;
        
    
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

- (void) menuTouch {
    

//    [[CCDirector sharedDirector]
//             replaceScene:[CCBReader loadAsScene:@"GamePlay"]];
//    
    
    menuAnimationFinished = NO;
    
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
    
    CCActionCallFunc *callMe = [CCActionCallFunc actionWithTarget:self selector:@selector(closeRightMenu)];
    CCActionSequence *seq    = [CCActionSequence actions:ease,callMe,nil];
    //self.spinAction    = seq;
    //[self.character runaction:self.spinAction];
    
    [_contentNode runAction:seq];
    
 
    
}


-(void) closeRightMenu{
    menuAnimationFinished = YES;
}



-(void) exitToMain{
    
    [_levelNode removeChildByName:@"levels" cleanup:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"someUnicNameKeyLOHPIDR" object:nil];
    
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
            
            self.rustyMoving = YES;
            self.portalTimerCreated = NO;
            
            rustyOnPlatform = NO;
//            [self.rusty makeMovement:3];
            
            [self.buttonController triggerSpriteVisibility:3];
            
            if(self.rusty.physicsBody.velocity.y > -100){
            
                _onDoubleJump++;
                
                if(_onDoubleJump == 2){
                    levels.firstDoubleJump = YES;
                }
            
            } else {
                _onDoubleJump = 2;
                
            }
            
            
//            self.rusty.animationRunning = NO;
            
        } else {
            
            
            
            NSLog(@"Something here");
            
            
            
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
    } else {
        
    }
    
    
    
}


-(void) buttonControllerSwitchJump{
    [self.buttonController triggerSpriteVisibility:4];
//    [self.rusty touchStopped];
    
}

-(void) manageButtonTouchLight:(float)positionX{
    [self.buttonController moveTouchLight:positionX];
    
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
    
    
//    NSLog(@"%f", self.rusty.position.y);
    
    
    if(self.rusty.physicsBody.velocity.y <= -20){
//        self.rusty.animationRunning = NO;
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
        
//        NSLog(@"currentPlatform.velocity.x = %f", currentPlatform.physicsBody.velocity.x);
        
        
        if (_forwardMarch) {

            [self.rusty.physicsBody applyImpulse:ccp(0.1*delta, 0)];
            self.rusty.position = ccp(self.rusty.position.x + rustySpeed*delta, self.rusty.position.y);
            
//            if(rustyOnPlatform){
//                [self.rusty.physicsBody setVelocity:ccp(100, self.rusty.physicsBody.velocity.y)];
//            } else {
//                [self.rusty.physicsBody applyImpulse:ccp(0.1*delta, 0)];
//                self.rusty.position = ccp(self.rusty.position.x + rustySpeed*delta, self.rusty.position.y);
//                
//            }
            
        }
        
        if (_backwardMarch) {
            
            [self.rusty.physicsBody applyImpulse:ccp(-0.1*delta, 0)];
            self.rusty.position = ccp(self.rusty.position.x - rustySpeed*delta, self.rusty.position.y);
            
//             
//            if(rustyOnPlatform){
//                [self.rusty.physicsBody setVelocity:ccp(-100, self.rusty.physicsBody.velocity.y)];
//            } else {
//                [self.rusty.physicsBody applyImpulse:ccp(-0.1*delta, 0)];
//                self.rusty.position = ccp(self.rusty.position.x - rustySpeed*delta, self.rusty.position.y);
//                
//            }
          
        }
        
        
        
        
        if(self.rusty.physicsBody.velocity.x == 0 && roundf(self.rusty.physicsBody.velocity.y) == 0){
            self.rustyMoving = false;
        }
        
        
        if (self.rusty.position.y < -150) {
            
            if(!self.newLevelLoading && !self.fifteenNewLevel){
                self.rustyDeathNum--;
                
                [fifteen updateSomeData];
                
                NSLog(@"This one");
                [self retry];
            }
            
        }
    }
    
    
    
//    if(leftMenuEnabled){
//        
//        [leftMenu makeMovement:currentTouch];
//        
//    }
    
    
    
    if(leftMenu.leftMenuEnabled){
  
        moveLeft.visible = NO;
        levels.leftMenuFirstStart = YES;
        
    } else {
        moveLeft.visible = YES;
        
    }
    
    
    if(rightMenu.rightMenuEnabled){
        
        moveUp.visible = NO;
        levels.rightMenuFirstStart = YES;
        
    } else {
        moveUp.visible = YES;
    }
    
    
}

- (void)retry
{
    
    self.rustyIsDead = YES;
    
    self.rusty.physicsBody.velocity = ccp(0,0);
    _forwardMarch = FALSE;
    _backwardMarch = FALSE;
    _touchStopped = TRUE;
    
    [rightMenu updateData];
    
    //[levels updateRustyMask];
   
    if(!self.rustyDeadFirstTime){
        self.rustyDeadFirstTime = YES;
    }
    [self spawnRusty:levels.getRustyPosition];
    
    
}

- (void)ccPhysicsCollisionPostSolve:(CCPhysicsCollisionPair*)pair
                              rusty:(Rusty*)nodeA
                           wildcard:(CCNode*)nodeB
{
    
    
    
    
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
        
                NSLog(@"Top");
   
    } else if((fabs(pair.contacts.normal.x)==0 || pair.contacts.normal.x==-1) && (pair.contacts.normal.y==0 || pair.contacts.normal.y>0)){
    
                NSLog(@"BottomLeft");
    
    } else if((fabs(pair.contacts.normal.x)==0 || pair.contacts.normal.x==1) && (pair.contacts.normal.y==0 || pair.contacts.normal.y>0)){
        
                    NSLog(@"BottomRight");
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
            _onDoubleJump = 0;
            rustyOnPlatform = YES;
            
            
            nodeB.physicsBody.friction = 0;
            currentPlatform = nodeB;
  
            
//            
            
            
            
            if(!_forwardMarch && !_backwardMarch){
                self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x, self.rusty.physicsBody.velocity.y);
//                self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x, self.rusty.physicsBody.velocity.y);
                
                //NSLog(@"Working");
            } else {

                
//                if(_forwardMarch){
//                    
//                    self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x+50, self.rusty.physicsBody.velocity.y);
//                    
//                } else if(_backwardMarch){
//                
//                    self.rusty.physicsBody.velocity = ccp(nodeB.physicsBody.velocity.x-50, self.rusty.physicsBody.velocity.y);
//                }

                
                
                
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
        
        self.rustyDeathNum--;
        [fifteen updateSomeData];
        
        
        NSLog(@"SPIKE spotted");
        [self retry];
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
//    [_txtTime setString:_myStr];
    
}


- (void)showFifteenFromGameNew:(int)moveDirection {
    
    
    //NSLog(rustyMoving ? @"Yes" : @"No");
    
    
    
//    if(!rustyMoving && self.portalTimerCreated){
//        
//        NSLog(@"moveDirection = %d", moveDirection);
//        
//        [self.portalTimer invalidate];
//        self.portalTimer = nil;
//        
//        [self showFifteen];
//        [fifteen moveCell:moveDirection];
//        
//    }

    
    
    
    
        [self showFifteen];
        [fifteen moveCell:moveDirection];
    
    
}


- (void)showFifteenFromGame:(NSTimer*)theTimer {
    
    
    
//    if(!rustyMoving && self.portalTimerCreated){
//        
//        
////        [levels makePortalExplode];
//        
//        //[levels makePortalExplode:self withSelector:@selector(explodeIsDone)];
//        
//        NSString *moveDirection = (NSString*)[theTimer userInfo];
//        
//        //        NSLog (@"Got the int: %d", [moveDirection intValue]);
//        
//        [self.portalTimer invalidate];
//        self.portalTimer = nil;
//        
//        [self showFifteen];
//        [fifteen moveCell:[moveDirection intValue]];
//        
//    }
    
    
}


-(void) explodeIsDone{
    
    [self.portalTimer invalidate];
    self.portalTimer = nil;
    
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
    
    
    _levelNode.opacity = 0;
    _levelNode.position = ccp(0,0);
    
    [_levelNode runAction:[CCActionFadeIn actionWithDuration:0.5]];
    
    
//    [_levelNode runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], [CCActionMoveTo actionWithDuration:1 position:ccp(0, 0)], nil]];
    
    [leftMenu setupData:fifteen.fifteenOriginHolder withCurrentFifteen:fifteen.fifteenShuffleHolder];
    
    
    
    [fifteen runAction:fadeOut];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(visibleOff) userInfo:nil repeats:NO];
    NSTimer *timerAvail = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(manageAvail) userInfo:nil repeats:NO];
    
    
    if(levels.getRustyPos.x != 0 && menuAnimationFinished){
//        self.rusty.position = levels.getRustyPos;
        if(!self.newLevelLoading){
            
            //[self spawnRusty:levels.getRustyPos];
            //[levels moveRustyMaskToPosition:levels.getRustyPos];
      
        }
        
    }
    
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
    CCActionMoveTo *moveMenu;
    
    if(rightMenuEnabled){
        rightMenuEnabled = NO;
        moveMenu = [CCActionMoveTo actionWithDuration:0.3 position:ccp([[CCDirector sharedDirector] viewSize].width+150, 0)];
        
    } else {
        moveMenu = [CCActionMoveTo actionWithDuration:0.3 position:ccp([[CCDirector sharedDirector] viewSize].width, 0)];
        
    }
    
    id moveHighlightWithEase = [CCActionEaseInOut actionWithAction:moveMenu rate:2];
    
    
    [rightMenu runAction:moveHighlightWithEase];
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
    
    
    
    //[leftMenu showFifteen: fifteen.getOriginFifteen];
    
    
//    [_contentNode addChild:fifteen.getOriginFifteen];
    
    
}



- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    
        CGPoint touchLocation = [touch locationInNode:_contentNode];
        firstTouch = touchLocation;
    
}

-(void) touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    
    CGPoint touchLocation = [touch locationInNode:_contentNode];
//    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    currentTouch = touchLocation;
    
    float swipeLength = ccpDistance(firstTouch, currentTouch);
    
    
    
    //if(!leftMenu.leftMenuEnabled && leftMenu.position.x <= 0){
        if (firstTouch.x > currentTouch.x && swipeLength > 10 && firstTouch.x > ([[CCDirector sharedDirector] viewSize].width-20) && !rightMenu.rightMenuEnabled) {
            
            
            if(self.allowRightLeftMenu && levels.leftMenuFirstClosed){
                [rightMenu makeMovement:currentTouch];
                
                if(leftMenu.leftMenuEnabled){
                    [leftMenu finishMovement:1];
                }
            }
            
            
            
            
        }
        
        
        if (firstTouch.x < currentTouch.x && swipeLength > 10 && firstTouch.x > ([[CCDirector sharedDirector] viewSize].width-300) && rightMenu.rightMenuEnabled) {
            
            if(self.allowRightLeftMenu && levels.leftMenuFirstClosed){
                [rightMenu makeMovement:currentTouch];
            }
            
            
        }
    //}
    
    
    
    
    //if(!rightMenu.rightMenuEnabled && rightMenu.position.x >= [[CCDirector sharedDirector] viewSize].width){
        if (firstTouch.x < currentTouch.x && swipeLength > 10 && firstTouch.x <= 30 && currentTouch.x <= 150 && !leftMenu.leftMenuEnabled) {
            if(self.allowRightLeftMenu){
                [leftMenu makeMovement:currentTouch];
                if(rightMenu.rightMenuEnabled){
                    [rightMenu finishMovement:1];
                }
            }
            
        }
        
        
        if (firstTouch.x > currentTouch.x && swipeLength > 10 && firstTouch.x < (300) && leftMenu.leftMenuEnabled) {
            if(self.allowRightLeftMenu){
                [leftMenu makeMovement:currentTouch];
            }
            
        }
    //}
    
    
    
    
    if(currentTouch.x > currentPrevTouch.x){
        touchMovingForward = YES;
    } else {
        touchMovingForward = NO;
    }
    currentPrevTouch = currentTouch;
    
}

-(void) touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    CGPoint touchLocation = [touch locationInNode:_contentNode];
    
    
    
    if(!leftMenu.leftMenuEnabled){
    
    if(firstTouch.x > touchLocation.x && firstTouch.x > ([[CCDirector sharedDirector] viewSize].width-50) && rightMenu.position.x < [[CCDirector sharedDirector] viewSize].width){
        //Forward
       if(self.allowRightLeftMenu){
           if(!touchMovingForward){
                [rightMenu finishMovement:2];
            } else {
                [rightMenu finishMovement:1];
            }
        }
        
    
    } else if(firstTouch.x < touchLocation.x && firstTouch.x > ([[CCDirector sharedDirector] viewSize].width-300) && rightMenu.rightMenuEnabled){
        
        //Back
        if(self.allowRightLeftMenu){
            if(touchMovingForward){
                [rightMenu finishMovement:1];
            } else {
                [rightMenu finishMovement:2];
            }
        }
        
    } else if(rightMenu.position.x >= [[CCDirector sharedDirector] viewSize].width - 100) {
        if(self.allowRightLeftMenu){
            [rightMenu totalHide:1];
        }
    }
    
    }
    
    
    if(!rightMenu.rightMenuEnabled){
    
    if(firstTouch.x < touchLocation.x && firstTouch.x >= 0 && firstTouch.x < 300 && leftMenu.position.x > 0){
        //Forward
        if(self.allowRightLeftMenu){
            if(touchMovingForward){
                [leftMenu finishMovement:2];
            } else {
                [leftMenu finishMovement:1];
            }
        }
        
        
    } else if(firstTouch.x > touchLocation.x && firstTouch.x >= 0 && firstTouch.x < 300 && leftMenu.leftMenuEnabled){
        //Back
        if(self.allowRightLeftMenu){
            if(!touchMovingForward){
                [leftMenu finishMovement:1];
                levels.leftMenuFirstClosed = YES;
            } else {
                [leftMenu finishMovement:2];
//                levels.leftMenuFirstClosed = YES;
            }
        }
        
    } else if(leftMenu.position.x <= 100) {
        if(self.allowRightLeftMenu){
            [leftMenu totalHide:1];
        }
    }

    }
    
    
   

    
}


-(void)pauseGamePlayScene{
    //for(CCSprite *sprite in [self children]) {
        
//        [[CCDirector sharedDirector] stopAnimation];
    
    
    
    if(!self.thisIsTutorial){
        
        _physicsNode.paused = YES;
        self.rustyIsDead = YES;
        
        }
    
    
    //}
}

-(void)resumeGamePlayScene{
    
    _physicsNode.paused = NO;
    self.rustyIsDead = NO;
    
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



-(void) freezeLevel:(BOOL)freeze {
    freezeEnabled = freeze;
    [levels setFreeze:freeze];
    
}

-(void) removeBossStory{
    
    [self removeChild:bossStory];
    [self resumeGamePlayScene];
}

@end
