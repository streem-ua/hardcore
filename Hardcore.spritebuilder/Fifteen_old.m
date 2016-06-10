//
//  Rusty.m
//  Untitled
//
//  Created by Admin on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Fifteen.h"

#define kN 3
#define kM 5


@implementation Fifteen{
    
    CCSprite *_first;
    CCSprite *_second;
    CCSprite *_third;
    CCSprite *_fourth;
    CCSprite *_fifth;
    CCSprite *activeSprite;
    
    
    
    int currentActiveLevel;
    
    int fifteenPositions[kN+2][kM+2];
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        for (int i = 0; i < kN + 2; i++) {
            fifteenPositions[i][0] = -1;
            fifteenPositions[i][kM + 1] = -1;
        }
        
        for (int j = 0; j < kM + 2; j++) {
            fifteenPositions[0][j] = -1;
            fifteenPositions[kN + 1][j] = -1;
        }
        
        
        fifteenPositions[0+1][1+1] = 4;
        fifteenPositions[0+1][2+1] = 3;
        fifteenPositions[1+1][1+1] = 2;
        fifteenPositions[1+1][2+1] = 1;
        fifteenPositions[2+1][3+1] = 5;
        
        
    }
    return self;
}


-(void)print15 {
    if(1) {
        printf("\n");
        for (int i = 0; i < kN+2; i++) {
            for (int j = 0; j < kM+2; j++) {
                printf(" %02d ", fifteenPositions[i][j]);
            }
            printf("\n");
        }
    }
}


-(void)buildGrid{
    
    for (int i = 0; i < kN+2; i++) {
        for (int j = 0; j < kM+2; j++) {
            
            switch (fifteenPositions[i][j]) {
                case 1:
                    _first.position = ccp(j * _first.contentSize.width, 370-i * _first.contentSize.height);
                    break;
                case 2:
                    _second.position = ccp(j * _first.contentSize.width, 370-i * _first.contentSize.height);
                    break;
                case 3:
                    _third.position = ccp(j * _first.contentSize.width, 370-i * _first.contentSize.height);
                    break;
                case 4:
                    _fourth.position = ccp(j * _first.contentSize.width, 370-i * _first.contentSize.height);
                    break;
                case 5:
                    _fifth.position = ccp(j * _first.contentSize.width, 370-i * _first.contentSize.height);
                    break;
                    
                default:
                    break;
            }
            
            
            
            
        }
   }
    
}

- (void)didLoadFromCCB {

    [self buildGrid];
//    -1  -1  -1  -1  -1  -1  -1
//    -1  00  04  03  00  00  -1
//    -1  00  02  01  00  00  -1
//    -1  00  00  00  05  00  -1
//    -1  -1  -1  -1  -1  -1  -1
    
    
}


- (void)touchBegan:(CCTouch*)touch withEvent:(CCTouchEvent*)event
{
    
    //CGPoint touchLocation = [touch locationInWorld];
    
    
}



- (void)touchMoved:(CCTouch*)touch withEvent:(CCTouchEvent*)event
{
    //CGPoint touchLocation = [touch locationInWorld];
}

- (void)touchEnded:(CCTouch*)touch withEvent:(CCTouchEvent*)event
{
    
}


-(void)moveCell:(int)direction{
    
    CCActionMoveTo *move;
    int levelPositionX = 0;
    int levelPositionY = 0;
    
    BOOL allowLeftMove = NO;
    BOOL allowRightMove = NO;
    BOOL allowUpMove = NO;
    BOOL allowDownMove = NO;
    
    /*
     
     0 - left
     1 - right
     2 - up
     3 - down
     
     */
    
    
    
    for (int i = 0; i < kN+2; i++) {
        for (int j = 0; j < kM+2; j++) {
            
            if (fifteenPositions[i][j] == currentActiveLevel) {
                levelPositionX = j;
                levelPositionY = i;
                break;
            }
        }
    }
    
    
    NSLog(@"currentActiveLevel = %d", currentActiveLevel);
    
    
    if(fifteenPositions[levelPositionY][levelPositionX-1] == 0 && direction == 0){
        allowLeftMove = YES;
        fifteenPositions[levelPositionY][levelPositionX] = 0;
        fifteenPositions[levelPositionY][levelPositionX-1] = currentActiveLevel;
        
        
    } else if(fifteenPositions[levelPositionY][levelPositionX+1] == 0 && direction == 1){
        allowRightMove = YES;
        
        fifteenPositions[levelPositionY][levelPositionX] = 0;
        fifteenPositions[levelPositionY][levelPositionX+1] = currentActiveLevel;
        
    } else if(fifteenPositions[levelPositionY-1][levelPositionX] == 0 && direction == 2){
        fifteenPositions[levelPositionY][levelPositionX] = 0;
        fifteenPositions[levelPositionY-1][levelPositionX] = currentActiveLevel;
        
        allowUpMove = YES;
    } else if(fifteenPositions[levelPositionY+1][levelPositionX] == 0 && direction == 3){
        fifteenPositions[levelPositionY][levelPositionX] = 0;
        fifteenPositions[levelPositionY+1][levelPositionX] = currentActiveLevel;
        
        allowDownMove = YES;
    }
    
    switch (direction) {
        case 0:
            //left
            if(allowLeftMove){
                move = [CCActionMoveTo actionWithDuration:1.00f position:ccp(activeSprite.position.x-activeSprite.contentSize.width, activeSprite.position.y)];
                allowLeftMove = NO;
            } else {
                if(fifteenPositions[levelPositionY][levelPositionX-1] > 0){
                    [self.gameplayParrentDelegate startGameWithLevel:fifteenPositions[levelPositionY][levelPositionX-1]];
                }
            }
            
            break;
        
        case 1:
            //right
            if(allowRightMove){
                move = [CCActionMoveTo actionWithDuration:1.00f position:ccp(activeSprite.position.x+activeSprite.contentSize.width, activeSprite.position.y)];
                allowRightMove = NO;
                
            } else {
                if(fifteenPositions[levelPositionY][levelPositionX+1] > 0){
                    [self.gameplayParrentDelegate startGameWithLevel:fifteenPositions[levelPositionY][levelPositionX+1]];
                }
            }
            
            break;
            
        case 2:
            //up
            if(allowUpMove){
                move = [CCActionMoveTo actionWithDuration:1.00f position:ccp(activeSprite.position.x, activeSprite.position.y+activeSprite.contentSize.height)];
                allowUpMove = NO;
            } else {
                if(fifteenPositions[levelPositionY-1][levelPositionX] > 0){
                    [self.gameplayParrentDelegate startGameWithLevel:fifteenPositions[levelPositionY-1][levelPositionX]];
                }
            }
            
            break;
        
        case 3:
            //down
            if(allowDownMove){
                move = [CCActionMoveTo actionWithDuration:1.00f position:ccp(activeSprite.position.x, activeSprite.position.y-activeSprite.contentSize.height)];
                allowDownMove = NO;
            } else {
                if(fifteenPositions[levelPositionY+1][levelPositionX] > 0){
                    [self.gameplayParrentDelegate startGameWithLevel:fifteenPositions[levelPositionY+1][levelPositionX]];
                }
            }
            break;
            
            
        default:
            break;
    }
    
    if(move){
        CCActionCallFunc *callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(finishAnimation)];
        
        //[activeSprite runAction:move];
        
        [activeSprite runAction:
         [CCActionSequence actions:
          move, callFunc,
          nil]];
        
        
    } else {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(finishAnimation) userInfo:nil repeats:NO];
        
    }
    
    
    [self print15];
    //[self buildGrid];
    
    
    
}

-(void)finishAnimation{
    NSLog(@"Finish animation:%@", self.gameplayParrentDelegate);
    [self performSelector:@selector(buildGrid) withObject:self afterDelay:1.00f ];
    [self.gameplayParrentDelegate hideFifteen];
}


-(void)setActiveNumber:(int)activeNum{
    
    currentActiveLevel = activeNum;
    activeSprite.effect = [CCEffectBrightness effectWithBrightness:0];
    
    
    switch (activeNum)
    
    {
        case 1:
            
            activeSprite = _first;
            break;
            
        case 2:
            
            activeSprite = _second;
            break;
        
        case 3:
            
            activeSprite = _third;
            break;
        
        case 4:
            
            activeSprite = _fourth;
            break;
            
        case 5:
            
            activeSprite = _fifth;
            break;
            
        default:
            
            break;
            
    }
    
    activeSprite.effect = [CCEffectBrightness effectWithBrightness:0.3];
    
}


@end
