#import "CustomButton.h"
#import "ButtonController.h"
#import "Rusty.h" //
// странно, у тебя не переходит по .h?
//ща я попрббую
// переходит fuaga

//unpress cmd

@interface GamePlay : CCNode <CCPhysicsCollisionDelegate, CustomButtonProtocol> {

}

//


//Почему ругается? :(

// give me a mouse )




- (void) moveRustyToPosition:(CGPoint)myPos;
- (void) hideFifteen;
- (void) startGameWithLevel:(int)levelId withString:(NSString *)typeStr;
- (void) reloadFifteen:(int)activePuzzleNumber;

- (int) getActivePuzzleNumber;
- (int) getTestActivePuzzleNumber;
-(void) setRustyRandomSpeed;
- (void) startFromPuzzle:(CCNode *)sender;
//(CCButton *)sender
-(void) showWinAnimation;

@property CCNode *rusty;
//

@property NSTimer *portalTimer;


@property int defaultRustySpeed;

@property BOOL portalTimerCreated;
@property BOOL rustyMoving;
@property BOOL rustyIsDead;


@property int activePuzzleNumber;
@property int currentActiveLevel;


@property BOOL newLevelLoading;
@property BOOL _ifLevelsPressed;

@property ButtonController *buttonController;

@property int rustyCrystalNum;
@property int rustyDeathNum;


@property CCColor *myFontColor;

-(void) spawnRusty:(CGPoint)startPoint;
-(void) exitToMain;

-(void)pauseGamePlayScene;
-(void)resumeGamePlayScene;

- (void) startupMenuFunc:(BOOL)ifLevelsPressed with15id:(int)_currentFifteenNumber;

//- (void)showFifteenFromGame:(NSTimer*)theTimer;
- (void)showFifteenFromGameNew:(int)moveDirection;
-(void) showFifteen;

@property BOOL thisIsTutorial;
@property BOOL firstTutorialWin;
@property BOOL rustyDeadFirstTime;
@property BOOL rustyDeadFirstTimeGlobal;
@property BOOL allowRightLeftMenu;


@property int levelSeconds;
@property int levelMinutes;

@property BOOL fifteenNewLevel;

-(void) moveFifteenHighlightTutorial:(CGPoint) myPoint;

-(void) testFunc;

-(void) clearLevels;

-(void) showBossStory:(int) bossLevelId;
-(void) removeBossStory;
-(void) freezeLevel:(BOOL)freeze;
-(void) addNewCheckPoint;
-(void) switchLightOff;


@property NSUserDefaults *myFifteenSaved;



@end