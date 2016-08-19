//
//  Rusty.m
//  Untitled
//
//  Created by Admin on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Fifteen.h"
#import "Levels.h"
#import "FifteenResultsBar.h"
#import "FifteenItem.h"

#define kN 3
#define kM 3


@implementation Fifteen{
    float fifteenPositions[kN+2][kM+2];
    float fifteenPositionsShuffled[kN+2][kM+2];
    
    int currentActiveLevel;
    int activePuzzleNumber;
    CCSprite *activeSprite;
    
    
    
    CCSprite *fifteenSelectHolder;
    
    BOOL ifWin;
    
    CCNode *cellHighlighter;
    
    int newLevelId;
    
    
    FifteenResultsBar *resultsBar;
    FifteenItem *readItem;
    
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        for (int i = 0; i < kN + 2; i++) {
            fifteenPositions[i][0] = -1;
            fifteenPositions[i][kM + 1] = -1;
            
            fifteenPositionsShuffled[i][0] = -1;
            fifteenPositionsShuffled[i][kM + 1] = -1;
            
        }
        
        for (int j = 0; j < kM + 2; j++) {
            fifteenPositions[0][j] = -1;
            fifteenPositions[kN + 1][j] = -1;
            
            fifteenPositionsShuffled[0][j] = -1;
            fifteenPositionsShuffled[kN + 1][j] = -1;
        }
        
        //NSLog(@"asd = %d", [self.gameplayParrentDelegate getTestActivePuzzleNumber]);
        
        activePuzzleNumber = [self.gameplayParrentDelegate getTestActivePuzzleNumber];
        ifWin = NO;
        
        
        //memcpy(fifteenPositionsShuffled, fifteenPositions, sizeof(fifteenPositions));
        
        
        
    }
    
    
    [self print15];
    //[self buildGrid];
    
    
    
    
    resultsBar = (FifteenResultsBar*)[CCBReader load:@"fifteen/fifteenResultsRourceBar"];
    
    
    cellHighlighter = [CCBReader load:@"fifteen/fifteenHighlight"];
    
    
    return self;
}


-(void)setActivePuzzleNumber:(int)activeNum{
    activePuzzleNumber = activeNum;
    
    NSData *readItemData = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%d", activePuzzleNumber]];
    readItem = [NSKeyedUnarchiver unarchiveObjectWithData:readItemData];
    
    currentActiveLevel = [readItem.currentFifteenLevel intValue];
    
    
    [self manageArrays];
    
    [self buildOriginGrid];
    [self buildGrid];
}

-(void)print15 {
    if(1) {
        //printf("\n");
        for (int i = 0; i < kN+2; i++) {
            
            for (int j = 0; j < kM+2; j++) {
                /*
                 if(fifteenPositions[i][j]>0){
                 float ost = fifteenPositions[i][j] - (int) fifteenPositions[i][j];
                 NSLog(@"%f", ost);
                 }
                 */
//                printf(" %02f ", fifteenPositionsShuffled[i][j]);
            }
//            printf("\n");
        }
    }
    
}



-(void) buildAvailableFifteens {
    
    
    for (int i=1; i<=5; i++) {
        
        
        activePuzzleNumber = i;
        [self manageArrays];
        
        
        
        
    }
    
}


-(void) shuffleArray{
    
}


-(void)buildOriginGrid{
    
    
    int x_counter = 0;
    int y_counter = 0;
    
    for (int i=0; i<((kN+2)*(kM+2)); i++) {
        
        if(fifteenPositions[y_counter][x_counter] >= 0){
            CCSprite *myCellBack = [CCSprite spriteWithImageNamed:@"squareNew.png"];
            myCellBack.position = ccp(x_counter*40, 200-(y_counter)*40);
            myCellBack.scale = 0.2;
            
            myCellBack.opacity = 1;
            [self.fifteenOriginHolder addChild:myCellBack];
            
            
            if(fifteenPositions[y_counter][x_counter] > 0){
                float direction = fifteenPositions[y_counter][x_counter] - (int) fifteenPositions[y_counter][x_counter];
                
                //NSLog(@"direction = %d, before = %d", (int)(ceil(direction*10)), (int)roundf(direction*10));
                
                //CCSprite *myCell = [CCSprite spriteWithImageNamed:@"squareNew.png"];
                CCSprite *myCell = [CCSprite node];
                
                CCSprite *myCellBg = [CCSprite spriteWithImageNamed:@"fifteenHighlight.png"];
                myCellBg.opacity = 0.5;
                
                
                //                myCellBg.visible = NO;
                
                myCellBg.name = @"originFifteen";
                CCSprite *myLine;
                
//                else if (activePuzzleNumber == 11) {
//                    
//                
//                    CCNode *myCellBg = [CCBReader load:@"fifteen/tutorialFifHighlight"];
//
//                }
//           
                
                switch ((int)roundf(direction*10))
                
                {
                    case 1:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenLineNew.png"];
                        myLine.position = ccp(0, 0);
                        
                        break;
                        
                    case 2:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenLineNew2.png"];
                        myLine.position = ccp(-1, 0);
                        
                        //                        myLine.rotation = 90;
                        break;
                        
                    case 3:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenZagNew3.png"];
                        myLine.position = ccp(40, 40);
                        //                        myLine.rotation = 90;
                        break;
                        
                    case 4:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenZagNew4.png"];
                        myLine.position = ccp(40, -40);
                        //                        myLine.rotation = 180;
                        break;
                        
                    case 5:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenZagNew.png"];
                        myLine.position = ccp(-40, 40);
                        //                        myLine.rotation = 0;
                        break;
                        
                    case 6:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenZagNew6.png"];
                        myLine.position = ccp(-41, -41);
                        //                        myLine.rotation = -90;
                        break;
                        
                        
                }
                
                //                myCellBg.position = ccp(120, 120);
                
                //myCellBg.name = @"myCellBg";
                myCell.name = @"originFifteen";
                
                [myCell addChild:myCellBg];
                [myCell addChild:myLine];
                
                myCell.position = myCellBack.position;
                myCell.scale = 0.2;
                
                //myCell.name = [NSString stringWithFormat:@"%d", (int) fifteenPositions[y_counter][x_counter]];
                
                //NSLog(@"myCell name = %@", myCell.name);
                
                [self.fifteenOriginHolder addChild:myCell];
                
                
            }
            
            
        }
        
        
        
        
        if(x_counter < (kN+2)){
            x_counter++;
        } else {
            x_counter = 0;
            y_counter++;
        }
        
        
    }
}


-(void)buildGrid {
    
    
    //ifStartScreen - show all 15-ths
    
    
    int x_counter = 0;
    int y_counter = 0;
    
    for (int i=0; i<((kN+2)*(kM+2)); i++) {
        
        if(fifteenPositionsShuffled[y_counter][x_counter] >= 0){
            CCSprite *myCellBack = [CCSprite spriteWithImageNamed:@"squareNew.png"];
            
            
            
            //            NSString *score = [[NSNumber numberWithFloat:roundf(fifteenPositionsShuffled[y_counter][x_counter])] stringValue];
            
            
            
            
            //            CCLabelTTF *testFont = [CCLabelTTF alloc] initWith
            
//            myCellBack.position = ccp(150+(x_counter)*40, 320-(y_counter)*40);
            myCellBack.position = ccp(175+(x_counter)*40.2, 275-(y_counter)*40.2);
            myCellBack.scale = 0.2;
            myCellBack.opacity = 0.8;
            myCellBack.name = @"asd";
            
            
            
            [self.fifteenShuffleHolder addChild:myCellBack];
            //[self.fifteenShuffleHolderLittle addChild:[CCSprite spriteWithTexture:[myCellBack texture]]];
            
            
            
            
            
            if(fifteenPositionsShuffled[y_counter][x_counter] > 0){
                float direction = fifteenPositionsShuffled[y_counter][x_counter] - (int) fifteenPositionsShuffled[y_counter][x_counter];
                
                //NSLog(@"direction = %d, before = %d", (int)(ceil(direction*10)), (int)roundf(direction*10));
                
                CCSprite *myCell = [CCSprite spriteWithImageNamed:@"squareNew.png"];
                CCSprite *myCellBg = [CCSprite spriteWithImageNamed:@"fifteenHighlight.png"];
                
                
                CCSprite *myLine;
                
                
                switch ((int)roundf(direction*10))
                
                {
                    case 1:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenLineNew.png"];
                        myLine.position = ccp(103, 101);
                        myLine.scale = 0.98;
                        break;
                        
                    case 2:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenLineNew2.png"];
                        myLine.position = ccp(101, 102);
                        myLine.scale = 0.98;
                        //                            myLine.rotation = 90;
                        break;
                        
                    case 3:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenZagNew3.png"];
                        myLine.position = ccp(143, 143);
                        
                        //                            myLine.rotation = 90;
                        break;
                        
                    case 4:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenZagNew4.png"];
                        myLine.position = ccp(143, 62);
                        
                        //                            myLine.rotation = 180;
                        break;
                        
                    case 5:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenZagNew.png"];
                        myLine.position = ccp(62, 143);
                        
                        //                            myLine.rotation = 0;
                        break;
                        
                    case 6:
                        myLine = [CCSprite spriteWithImageNamed:@"fifteenZagNew6.png"];
                        myLine.position = ccp(62, 62);
                        
                        //                            myLine.rotation = -90;
                        break;
                        
                        
                }
                
                
                myCellBg.position = ccp(120, 120);
                
                myCellBg.name = @"myCellBg";
                
                
                CCLabelTTF *scorelabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"lvl: %f",fifteenPositionsShuffled[y_counter][x_counter]] fontName:@"Verdana-Bold" fontSize:30.0f];
                scorelabel.position = ccp(myCell.boundingBox.size.width/2, myCell.boundingBox.size.height/2);
                
                
                
                
                [myCell addChild:myLine];
                //                    [myCell addChild:myLine];
                
                
                //[myCell addChild:scorelabel];
                
//                myCell.position = ccp(150+(x_counter)*40, 320-(y_counter)*40);
                myCell.position = ccp(175+(x_counter)*40.2, 275-(y_counter)*40.2);
                myCell.scale = 0.2;
                myCell.opacity = 0.8;
                
                myCell.name = [NSString stringWithFormat:@"%d", (int) fifteenPositionsShuffled[y_counter][x_counter]];
                
                
                
                
                [self.fifteenShuffleHolder addChild:myCell];
                
                
//                if(fifteenPositionsShuffled[y_counter][x_counter] >= 1 && fifteenPositionsShuffled[y_counter][x_counter] < 2){
                if(fifteenPositionsShuffled[y_counter][x_counter] >= [readItem.currentFifteenLevel intValue] && fifteenPositionsShuffled[y_counter][x_counter] < [readItem.currentFifteenLevel intValue]+1){
                    currentActiveLevel = [readItem.currentFifteenLevel intValue];
                    activeSprite = myCell;
                    //myCellBg.opacity = 1;
                } else {
                    //myCellBg.opacity = 0;
                }
                
                
                myCellBg.visible = NO;
                
                
                
            }
            
            
        }
        
        
        
        
        if(x_counter < (kN+2)){
            x_counter++;
        } else {
            x_counter = 0;
            y_counter++;
        }
        
        
    }
    
    //self.fifteenShuffleHolderLittle = [CCSprite spriteWithTexture:[self.fifteenShuffleHolder texture]];
    
    
    [self.fifteenShuffleHolder addChild:cellHighlighter];
    cellHighlighter.position = ccp(activeSprite.position.x+1.7, activeSprite.position.y+1.7);
    cellHighlighter.scale = 0.8;
    
    
    
    
    
    
}

-(void) manageArrays{
    
    
    //Прочитать
    
    
    
    
    
    for (int i = 0; i < kN + 2; i++) {
        for (int j = 0; j < kM + 2; j++) {
            fifteenPositionsShuffled[i][j] = 0;
            fifteenPositions[i][j] = 0;
        }
    }
    
    
    for (int i = 0; i < kN + 2; i++) {
        
        fifteenPositions[i][0] = -1;
        fifteenPositions[i][kM + 1] = -1;
        
        fifteenPositionsShuffled[i][0] = -1;
        fifteenPositionsShuffled[i][kM + 1] = -1;
        
    }
    
    for (int j = 0; j < kM + 2; j++) {
        
        fifteenPositions[0][j] = -1;
        fifteenPositions[kN + 1][j] = -1;
        
        fifteenPositionsShuffled[0][j] = -1;
        fifteenPositionsShuffled[kN + 1][j] = -1;
    }
    
    
    [self print15];
    
    //Массив не очищаеться
    // Очищаються только крайние, очистить надо все
    
   
    
//    currentActiveLevel = [readItem.currentFifteenLevel intValue];
    

   
       int counter = 0;
       
       for (int i = 0; i < kN+2; i++) {
           
           for (int j = 0; j < kM+2; j++) {
               
               fifteenPositions[i][j] = [[readItem.fifteenPositions objectAtIndex:counter] floatValue];
               fifteenPositionsShuffled[i][j] = [[readItem.fifteenPositionsShuffled objectAtIndex:counter] floatValue];
               
//               NSLog(@"ololo = %f", [[readItem.fifteenPositionsShuffled objectAtIndex:counter] floatValue]);
               
               counter++;
           }
       }
   
    
    
    
    
    
    
    [self print15];
    
}

//1 - линия горизонтальная
//2 - линия вертикальная
//3 - поворот L
//4 - поворот Г
//5 - воворот _|
//6 - поворот ""|



- (void)didLoadFromCCB {
    
    [self addChild:resultsBar];
    resultsBar.fifteenDelegate = self;
    
    
    self.fifteenOriginHolder = [[CCSprite alloc] init];
    //[self addChild:self.fifteenOriginHolder];
    
    self.fifteenShuffleHolder = [[CCSprite alloc] init];
    [self addChild:self.fifteenShuffleHolder z:10];
    
    
    self.fifteenShuffleHolderLittle = [[CCSprite alloc] init];
    
    
    //    [self manageArrays];
    //
    //    [self buildOriginGrid];
    //    [self buildGrid];
    
    //[self arrayShuffle];
}

-(void)moveCell:(int)direction{
    
    
    resultsBar.fifteenMoves++;
    
    CCActionMoveTo *move;
    CCActionMoveTo *moveHighlight;
    
    int levelPositionX = 0;
    int levelPositionY = 0;
    
    BOOL allowLeftMove = NO;
    BOOL allowRightMove = NO;
    BOOL allowUpMove = NO;
    BOOL allowDownMove = NO;
    
    CGPoint currentCGpoint;
    
//    CCNode *myCurrentCellBg = [activeSprite getChildByName:@"myCellBg" recursively:NO];
    
    
    /*
     
     0 - left
     1 - right
     2 - up
     3 - down
     
     */
    
    NSLog(@"MOVE CELL direction = %d", direction);
    
    for (int i = 0; i < kN+2; i++) {
        for (int j = 0; j < kM+2; j++) {
            
            if ((int)fifteenPositionsShuffled[i][j] == currentActiveLevel) {
                
                levelPositionX = j;
                levelPositionY = i;
                break;
            }
        }
    }
    
    
    if(fifteenPositionsShuffled[levelPositionY][levelPositionX-1] == 0 && direction == 0){
        allowLeftMove = YES;
        fifteenPositionsShuffled[levelPositionY][levelPositionX] = 0;
        fifteenPositionsShuffled[levelPositionY][levelPositionX-1] = currentActiveLevel;
        
        
        float tst = levelPositionY + levelPositionX/10.0;
        float tst_next = levelPositionY + (levelPositionX-1)/10.0;
        NSNumber *currentValue = [NSNumber numberWithFloat:[[readItem.fifteenPositionsShuffled objectAtIndex:[self getCurrentIntForFloat:tst]] floatValue]];
        
        [readItem.fifteenPositionsShuffled replaceObjectAtIndex:[self getCurrentIntForFloat:tst] withObject: [NSNumber numberWithFloat:0.0]];
        [readItem.fifteenPositionsShuffled replaceObjectAtIndex:[self getCurrentIntForFloat:tst_next] withObject: [NSNumber numberWithFloat:[currentValue floatValue]]];

        
        
    } else if(fifteenPositionsShuffled[levelPositionY][levelPositionX+1] == 0 && direction == 1){
        allowRightMove = YES;
        
        fifteenPositionsShuffled[levelPositionY][levelPositionX] = 0;
        fifteenPositionsShuffled[levelPositionY][levelPositionX+1] = currentActiveLevel;
        
        
        float tst = levelPositionY + levelPositionX/10.0;
        float tst_next = levelPositionY + (levelPositionX+1)/10.0;
        NSNumber *currentValue = [NSNumber numberWithFloat:[[readItem.fifteenPositionsShuffled objectAtIndex:[self getCurrentIntForFloat:tst]] floatValue]];
       
        [readItem.fifteenPositionsShuffled replaceObjectAtIndex:[self getCurrentIntForFloat:tst] withObject: [NSNumber numberWithFloat:0.0]];
        [readItem.fifteenPositionsShuffled replaceObjectAtIndex:[self getCurrentIntForFloat:tst_next] withObject: [NSNumber numberWithFloat:[currentValue floatValue]]];
        
        
        
    } else if(fifteenPositionsShuffled[levelPositionY-1][levelPositionX] == 0 && direction == 2){
        fifteenPositionsShuffled[levelPositionY][levelPositionX] = 0;
        fifteenPositionsShuffled[levelPositionY-1][levelPositionX] = currentActiveLevel;
        
        float tst = levelPositionY + levelPositionX/10.0;
        float tst_next = levelPositionY-1 + (levelPositionX)/10.0;
        NSNumber *currentValue = [NSNumber numberWithFloat:[[readItem.fifteenPositionsShuffled objectAtIndex:[self getCurrentIntForFloat:tst]] floatValue]];
        
        [readItem.fifteenPositionsShuffled replaceObjectAtIndex:[self getCurrentIntForFloat:tst] withObject: [NSNumber numberWithFloat:0.0]];
        [readItem.fifteenPositionsShuffled replaceObjectAtIndex:[self getCurrentIntForFloat:tst_next] withObject: [NSNumber numberWithFloat:[currentValue floatValue]]];
        
        allowUpMove = YES;
    } else if(fifteenPositionsShuffled[levelPositionY+1][levelPositionX] == 0 && direction == 3){
        fifteenPositionsShuffled[levelPositionY][levelPositionX] = 0;
        fifteenPositionsShuffled[levelPositionY+1][levelPositionX] = currentActiveLevel;
        
        float tst = levelPositionY + levelPositionX/10.0;
        float tst_next = (levelPositionY+1) + levelPositionX/10.0;
        NSNumber *currentValue = [NSNumber numberWithFloat:[[readItem.fifteenPositionsShuffled objectAtIndex:[self getCurrentIntForFloat:tst]] floatValue]];
        
        [readItem.fifteenPositionsShuffled replaceObjectAtIndex:[self getCurrentIntForFloat:tst] withObject: [NSNumber numberWithFloat:0.0]];
        [readItem.fifteenPositionsShuffled replaceObjectAtIndex:[self getCurrentIntForFloat:tst_next] withObject: [NSNumber numberWithFloat:[currentValue floatValue]]];
        
        allowDownMove = YES;
    }
    
    
    switch (direction) {
        case 0:
            //left
            currentCGpoint = ccp(cellHighlighter.position.x-40, cellHighlighter.position.y);
            
            if(allowLeftMove){
                
                move = [CCActionMoveTo actionWithDuration:1.00f position:ccp(activeSprite.position.x-40, activeSprite.position.y)];
                allowLeftMove = NO;
                moveHighlight = [CCActionMoveTo actionWithDuration:1.00f position:currentCGpoint];
                
                readItem.currentFifteenLevel = [NSNumber numberWithInteger:currentActiveLevel];
                [self updateNSUserDefault];
                
                
                //myCurrentCellBg.opacity = 1;
                
            } else {
                if(fifteenPositionsShuffled[levelPositionY][levelPositionX-1] > 0){
                    
                    
                    //тут надо сделать более плавный переход альфы с кубика на кубик
                    
                    self.currentDirectionString = @"left";
                    
                    newLevelId = (int)fifteenPositionsShuffled[levelPositionY][levelPositionX-1];
                    
                    readItem.currentFifteenLevel = [NSNumber numberWithInteger:newLevelId];
                    [self updateNSUserDefault];
                    
                    moveHighlight = [CCActionMoveTo actionWithDuration:1 position:currentCGpoint];
                    id moveHighlightWithEase = [CCActionEaseInOut actionWithAction:moveHighlight rate:2];
                    
                    //                    [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveHighlightWithEase, [CCActionCallFunc actionWithTarget:self selector:@selector(initGamePlayLevel)], nil]];
                    //
                    
                    [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveHighlightWithEase, nil]];
                    [self initGamePlayLevel];
                    
                    
                    //  [self.gameplayParrentDelegate startGameWithLevel:(int)fifteenPositionsShuffled[levelPositionY][levelPositionX-1] withString:@"fifteen"];
                    //  myCurrentCellBg.opacity = 0;
                    
                    
                } else {
                    NSLog(@"Wall");
                    [self shakeFifteen];
                }
            }
            
            break;
            
        case 1:
            //right
            currentCGpoint =ccp(cellHighlighter.position.x+40, cellHighlighter.position.y);
            
            if(allowRightMove){
                move = [CCActionMoveTo actionWithDuration:1.00f position:ccp(activeSprite.position.x+40, activeSprite.position.y)];
                allowRightMove = NO;
                
                moveHighlight = [CCActionMoveTo actionWithDuration:1.00f position:currentCGpoint];
                
                
                
//                readItem
                
                readItem.currentFifteenLevel = [NSNumber numberWithInteger:currentActiveLevel];
                [self updateNSUserDefault];
                
                
                
                
                
                
                //   myCurrentCellBg.opacity = 1;
            } else {
                if(fifteenPositionsShuffled[levelPositionY][levelPositionX+1] > 0){
                    
                    //NSLog(@"Load right level with id = %d", (int)fifteenPositionsShuffled[levelPositionY][levelPositionX+1]);
                    self.currentDirectionString = @"right";
                    
                    
                    newLevelId = (int)fifteenPositionsShuffled[levelPositionY][levelPositionX+1];
                    
                    readItem.currentFifteenLevel = [NSNumber numberWithInteger:newLevelId];
                    NSLog(@"LLLLLLLLLLLLLLL readItem.currentFifteenLevel = %@", readItem.currentFifteenLevel);
                    
                    [self updateNSUserDefault];
                    
                    
                    moveHighlight = [CCActionMoveTo actionWithDuration:1 position:currentCGpoint];
                    id moveHighlightWithEase = [CCActionEaseInOut actionWithAction:moveHighlight rate:2];
                    
                    //                    [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveHighlightWithEase, [CCActionCallFunc actionWithTarget:self selector:@selector(initGamePlayLevel)], nil]];
                    //
                    
                    [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveHighlightWithEase, nil]];
                    [self initGamePlayLevel];
                    
                    
                    //CCActionFadeOut *fadeActiveOut = [CCActionFadeOut actionWithDuration:1];
                    //[myCurrentCellBg runAction:fadeActiveOut];
                    
                    //                    [myCurrentCellBg runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], [CCActionFadeOut actionWithDuration:1], [CCActionCallFunc actionWithTarget:self selector:@selector(cowryAppearWithString:data:) data:cowryString], nil]];
                    //
                    
                    
                    
                    //myCurrentCellBg.opacity = 0;
                } else {
                    NSLog(@"Wall");
                    [self shakeFifteen];
                }
            }
            
            break;
            
        case 2:
            //up
            currentCGpoint =ccp(cellHighlighter.position.x, cellHighlighter.position.y+40);
            
            if(allowUpMove){
                move = [CCActionMoveTo actionWithDuration:1.00f position:ccp(activeSprite.position.x, activeSprite.position.y+40)];
                allowUpMove = NO;
                //myCurrentCellBg.opacity = 1;
                moveHighlight = [CCActionMoveTo actionWithDuration:1.00f position:currentCGpoint];
                
                
                readItem.currentFifteenLevel = [NSNumber numberWithInteger:currentActiveLevel];
                [self updateNSUserDefault];
                
            } else {
                if(fifteenPositionsShuffled[levelPositionY-1][levelPositionX] > 0){
                    self.currentDirectionString = @"up";
                    
                    
                    newLevelId = (int)fifteenPositionsShuffled[levelPositionY-1][levelPositionX];
                    readItem.currentFifteenLevel = [NSNumber numberWithInteger:newLevelId];
                    [self updateNSUserDefault];
                    
                    
                    moveHighlight = [CCActionMoveTo actionWithDuration:1 position:currentCGpoint];
                    id moveHighlightWithEase = [CCActionEaseInOut actionWithAction:moveHighlight rate:2];
                    
                    //                    [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveHighlightWithEase, [CCActionCallFunc actionWithTarget:self selector:@selector(initGamePlayLevel)], nil]];
                    //
                    [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveHighlightWithEase, nil]];
                    [self initGamePlayLevel];
                    
                    //                    [self.gameplayParrentDelegate startGameWithLevel:(int)fifteenPositionsShuffled[levelPositionY-1][levelPositionX] withString:@"fifteen"];
                    //                    myCurrentCellBg.opacity = 0;
                } else {
                    NSLog(@"Wall");
                    [self shakeFifteen];
                }
            }
            
            break;
            
        case 3:
            //down
            currentCGpoint =ccp(cellHighlighter.position.x, cellHighlighter.position.y-40);
            
            if(allowDownMove){
                move = [CCActionMoveTo actionWithDuration:1.00f position:ccp(activeSprite.position.x, activeSprite.position.y-40)];
                allowDownMove = NO;
                
                
                moveHighlight = [CCActionMoveTo actionWithDuration:1.00f position:currentCGpoint];
                readItem.currentFifteenLevel = [NSNumber numberWithInteger:currentActiveLevel];
                [self updateNSUserDefault];
                
                //myCurrentCellBg.opacity = 1;
                
                
            } else {
                if(fifteenPositionsShuffled[levelPositionY+1][levelPositionX] > 0){
                    
                    
                    self.currentDirectionString = @"down";
                    
                    
                    newLevelId = (int)fifteenPositionsShuffled[levelPositionY+1][levelPositionX];
                    readItem.currentFifteenLevel = [NSNumber numberWithInteger:newLevelId];
                    [self updateNSUserDefault];
                    
                    moveHighlight = [CCActionMoveTo actionWithDuration:1 position:currentCGpoint];
                    id moveHighlightWithEase = [CCActionEaseInOut actionWithAction:moveHighlight rate:2];
                    
                    //                    [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveHighlightWithEase, [CCActionCallFunc actionWithTarget:self selector:@selector(initGamePlayLevel)], nil]];
                    [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:1], moveHighlightWithEase, nil]];
                    [self initGamePlayLevel];
                    
                } else {
                    NSLog(@"Wall");
                    [self shakeFifteen];
                }
            }
            break;
            
            
        default:
            break;
    }
    
    if(move){
        CCActionCallFunc *callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(finishAnimation)];
        
        id moveHighlightWithEase = [CCActionEaseInOut actionWithAction:moveHighlight rate:2];
        id moveSimpleWithEase = [CCActionEaseInOut actionWithAction:move rate:2];
        
        //[activeSprite runAction:move];
        
        [cellHighlighter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:0.1], moveHighlightWithEase, nil]];
        
        [self.gameplayParrentDelegate moveFifteenHighlightTutorial:currentCGpoint];
        
        
        [activeSprite runAction:
         [CCActionSequence actions:
          moveSimpleWithEase, callFunc,
          nil]];
        
        
    } else {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(finishAnimation) userInfo:nil repeats:NO];
        [self.gameplayParrentDelegate moveFifteenHighlightTutorial:currentCGpoint];
        
    }
    [self checkForWin];
    
}


-(void) initGamePlayLevel {
    
//    NSLog(@"newLevelId = %i", newLevelId);
    
    [self.gameplayParrentDelegate startGameWithLevel:newLevelId withString:@"fifteen"];
}


-(void) shakeFifteen{
    
    id menuItem1ActRight= [CCActionMoveBy actionWithDuration:0.07 position:ccp(self.fifteenShuffleHolder.position.x-7,self.fifteenShuffleHolder.position.y)];
    id menuItem1ActLeft= [CCActionMoveBy actionWithDuration:0.07 position:ccp(self.fifteenShuffleHolder.position.x+7,self.fifteenShuffleHolder.position.y)];
    
    
    id moveHighlightWithEase1 = [CCActionEaseInOut actionWithAction:menuItem1ActRight rate:2];
    id moveHighlightWithEase2 = [CCActionEaseInOut actionWithAction:menuItem1ActLeft rate:2];
    
    id seq1 = [CCActionSequence actions: moveHighlightWithEase1, moveHighlightWithEase2, nil];
    
    [self.fifteenShuffleHolder runAction:[CCActionRepeat actionWithAction:seq1 times:5]];
    
 
}



-(void) updateNSUserDefault{
    
    
    FifteenItem *item = [[FifteenItem alloc] init];
    
    item.isFifteenOpened = @YES;
    item.fifteenDeath = [NSNumber numberWithInt:resultsBar.fifteenDeath];
    item.fifteenMoves = [NSNumber numberWithInt:resultsBar.fifteenMoves];
    item.fifteenMinutesPassed = [NSNumber numberWithInt:self.gameplayParrentDelegate.levelMinutes];
    item.fifteenSecondsPassed = [NSNumber numberWithInt:self.gameplayParrentDelegate.levelSeconds];
    
    item.fifteenEtaDeath = readItem.fifteenEtaDeath;
    item.fifteenEtaMoves = readItem.fifteenEtaMoves;
    item.fifteenEtaMinutesPassed = readItem.fifteenEtaMinutesPassed;
    item.fifteenEtaSecondsPassed = readItem.fifteenEtaSecondsPassed;
    
    item.fifteenPositions = readItem.fifteenPositions;
    item.fifteenPositionsShuffled = readItem.fifteenPositionsShuffled;
    item.currentFifteenLevel = readItem.currentFifteenLevel;
    
    item.isBossDefeated = readItem.isBossDefeated;
    
    NSData *itemData = [NSKeyedArchiver archivedDataWithRootObject:item];
    [[NSUserDefaults standardUserDefaults] setObject:itemData forKey:[NSString stringWithFormat:@"%d", activePuzzleNumber]];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}




-(void)finishAnimation{
    //NSLog(@"Finish animation:%@", [self gameplayParrentDelegate]);
    //[self performSelector:@selector(buildGrid) withObject:self afterDelay:1.00f ];
    
    if(ifWin){
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        BOOL showBossLevel = YES;
        
        
        if(showBossLevel){
        
        
            
            newLevelId = 6;
            self.currentDirectionString = @"down";
//            [self.gameplayParrentDelegate startGameWithLevel:newLevelId withString:@"bossLevel"];
            [self.gameplayParrentDelegate hideFifteen];
           
  
            
            [self.gameplayParrentDelegate showBossStory:newLevelId];
            
            
            
            
        } else {
            
            [self.gameplayParrentDelegate pauseGamePlayScene];
            
            
            [resultsBar startAnimation: activePuzzleNumber];
            [resultsBar updateTime:self.gameplayParrentDelegate.levelMinutes andSeconds:self.gameplayParrentDelegate.levelSeconds];
            
            
            for (CCNode *tmpNode in self.fifteenShuffleHolder.children) {
                
                if(tmpNode.name.intValue > 0 && tmpNode.name.intValue <= 5){
                    CCNode *bgNode = [tmpNode getChildByName:@"myCellBg" recursively:YES];
                    
                    float myTime = 0.0;
                    float scaleTime = 0.0;
                    
                    //                    myTime = tmpNode.name.intValue/7.;
                    //                    scaleTime = tmpNode.name.intValue/7. + 1.0;
                    //
                    
                    if(tmpNode.name.intValue == 1){
                        myTime = 0.1;
                        scaleTime = 1.1;
                    } else if(tmpNode.name.intValue == 2){
                        myTime = 0.2;
                        scaleTime = 1.2;
                    } else if(tmpNode.name.intValue == 3){
                        myTime = 0.3;
                        scaleTime = 1.3;
                    } else if(tmpNode.name.intValue == 4){
                        myTime = 0.4;
                        scaleTime = 1.4;
                    } else if(tmpNode.name.intValue == 5){
                        myTime = 0.5;
                        scaleTime = 1.5;
                    }
                    
                    CCActionFadeIn *fadeInAction = [CCActionFadeIn actionWithDuration:.2];
                    CCActionDelay *delayTime = [CCActionDelay actionWithDuration:myTime];
                    
                    id sequence = [CCActionSequence actions: delayTime, fadeInAction, nil];
                    [bgNode runAction:sequence];
                    
                    CCActionScaleTo *ccScale = [CCActionScaleTo actionWithDuration:.2 scale:.3];
                    CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:.2];
                    CCActionDelay *scaleDelay = [CCActionDelay actionWithDuration:scaleTime];
                    CCActionEaseBackInOut *ease = [CCActionEaseBackInOut actionWithAction:ccScale];
                    
                    [tmpNode runAction:[CCActionSequence actions: scaleDelay, ease, fadeOut, nil]];
                    [bgNode runAction:[CCActionSequence actions: scaleDelay, fadeOut, nil]];
                    
                    
                    
                    
                    
                    
                }
                
            }
            
        }
        
        
        
        
        FifteenItem *item = [[FifteenItem alloc] init];
        
        item.isFifteenOpened = @YES;
        item.fifteenDeath = [NSNumber numberWithInt:resultsBar.fifteenDeath];
        item.fifteenMoves = [NSNumber numberWithInt:resultsBar.fifteenMoves];
        item.fifteenMinutesPassed = [NSNumber numberWithInt:self.gameplayParrentDelegate.levelMinutes];
        item.fifteenSecondsPassed = [NSNumber numberWithInt:self.gameplayParrentDelegate.levelSeconds];
        
        item.fifteenEtaDeath = readItem.fifteenEtaDeath;
        item.fifteenEtaMoves = readItem.fifteenEtaMoves;
        item.fifteenEtaMinutesPassed = readItem.fifteenEtaMinutesPassed;
        item.fifteenEtaSecondsPassed = readItem.fifteenEtaSecondsPassed;
        
        item.fifteenPositions = readItem.fifteenPositions;
        
        item.isBossDefeated = readItem.isBossDefeated;
        
//        item.fifteenPositionsShuffled = readItem.fifteenPositionsShuffled;
        
        
        
        switch (activePuzzleNumber) {
            case 1:
                
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.3]];
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.1]];
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:3.5]];
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:5.6]];
                
                break;
                
                
            case 2:
                
                
                [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.3]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.1]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:3.6]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:4.5]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.4]];
                
                break;
                
                
                
            case 3:
                
                [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:1.3]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.6]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:3.4]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.2]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.2]];
                
                break;
                
                
                
            case 4:
                
                
                [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.1]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.6]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:3.2]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.3]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.5]];
                
                break;
                
                
                
            case 5:
                
                
                [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.2]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.5]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:3.4]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:4.3]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.6]];
                
                break;
                
                
            case 6:
                
                
                [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.6]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.3]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.5]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.4]];
                
                break;
                
                
            case 7:
                
                
                [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.5]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.4]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:4.6]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.2]];
                
                break;
                
                
            case 8:
                
               
                [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.2]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.4]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.1]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.5]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:5.6]];
                
                break;
                
                
            case 9:
                
                
                [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.1]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:2.6]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.3]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:4.5]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.2]];
                
                break;
                
                
            case 10:
                
                  
                [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:1.2]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.3]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.5]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:4.4]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:5.1]];
                
                break;
                
            case 11:
                
                
                [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.3]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.2]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:3.4]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:4.1]];
                [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:5.6]];
                
                break;
                
                
                
                
                
                
                
            default:
                break;
        }
        
        
        
        
        
        item.currentFifteenLevel = @1;
        
        NSData *itemData = [NSKeyedArchiver archivedDataWithRootObject:item];
        [[NSUserDefaults standardUserDefaults] setObject:itemData forKey:[NSString stringWithFormat:@"%d", activePuzzleNumber]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        
        
        
//        NSLog(@"readItemTest.fifteenMoves = %@", readItemTest.fifteenMoves);
        
        NSData *readItemDataNext = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%d", activePuzzleNumber+1]];
        FifteenItem *readItemNext = [NSKeyedUnarchiver unarchiveObjectWithData:readItemDataNext];
        
        
        FifteenItem *itemNext = [[FifteenItem alloc] init];
        
        itemNext.isFifteenOpened = @YES;
        
        
        
        
        if(readItemNext.fifteenDeath.integerValue < 0){
            
            itemNext.fifteenDeath = [NSNumber numberWithInt:-1];
            itemNext.fifteenMoves = [NSNumber numberWithInt:-1];
            itemNext.fifteenMinutesPassed = [NSNumber numberWithInt:-1];
            itemNext.fifteenSecondsPassed = [NSNumber numberWithInt:-1];
        
        } else {
            
            itemNext.fifteenDeath = readItemNext.fifteenDeath;
            itemNext.fifteenMoves = readItemNext.fifteenMoves;
            itemNext.fifteenMinutesPassed = readItemNext.fifteenMinutesPassed;
            itemNext.fifteenSecondsPassed = readItemNext.fifteenSecondsPassed;

        }
        
        
        
        itemNext.fifteenPositions = readItemNext.fifteenPositions;
        itemNext.fifteenPositionsShuffled = readItemNext.fifteenPositionsShuffled;
        itemNext.fifteenEtaDeath = readItemNext.fifteenEtaDeath;
        itemNext.fifteenEtaMoves = readItemNext.fifteenEtaMoves;
        itemNext.fifteenEtaMinutesPassed = readItemNext.fifteenEtaMinutesPassed;
        itemNext.fifteenEtaSecondsPassed = readItemNext.fifteenEtaSecondsPassed;
        
        itemNext.fifteenPositions = readItemNext.fifteenPositions;
        itemNext.fifteenPositionsShuffled = readItemNext.fifteenPositionsShuffled;
        itemNext.currentFifteenLevel = readItemNext.currentFifteenLevel;
        
        
        NSData *itemDataNext = [NSKeyedArchiver archivedDataWithRootObject:itemNext];
        [[NSUserDefaults standardUserDefaults] setObject:itemDataNext forKey:[NSString stringWithFormat:@"%d", activePuzzleNumber+1]];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        
        
        self.gameplayParrentDelegate.levelSeconds = 0;
        self.gameplayParrentDelegate.levelMinutes = 0;
        
        self.gameplayParrentDelegate.firstTutorialWin = YES;
        
        
        
        
        
        
        
        
        
        
        
    } else {
        [self.gameplayParrentDelegate hideFifteen];
    }
    
    
    
}

-(void)checkForWin {
    
    //
    //    if(memcmp(fifteenPositions, fifteenPositionsShuffled, sizeof(fifteenPositions)) == 0){
    //        //match
    //        NSLog(@"WIN WIN WIN WIN");
    //    } else {
    //        //not match
    //    }
    
    ifWin = FALSE;
    
    for (int i = 0; i < kN+2; i++) {
        for (int j = 0; j < kM+2; j++) {
            
            
            if((int)fifteenPositions[i][j] != (int)fifteenPositionsShuffled[i][j]){
                ifWin = FALSE;
                break;
            } else {
                ifWin = TRUE;
            }
            
        }
        
        if (!ifWin) break;
    }
    
    if(ifWin){
        
        //        activePuzzleNumber++;
        
        //activePuzzleNumber++;
        
        
        //[self.gameplayParrentDelegate reloadFifteen:1];
        
        
        //[self buildOriginGrid];
        
        
        //        [fifteenOriginHolder removeFromParentAndCleanup: YES];
        //        [fifteenShuffleHolder removeFromParentAndCleanup: YES];
        
        //[self didLoadFromCCB];
        
        //        for (CCNode *child in self.children) {
        //            //[self removeChild:child cleanup:YES];
        //            [self removeChild:child cleanup:YES];
        //        }
        
        //        for (CCSprite *child in self.children) {
        //            //[self removeChild:child cleanup:YES];
        //            [self removeChild:child cleanup:YES];
        //        }
        
        
        //[self initParams];
    }
    
    
    
}




-(void)setActiveNumber:(int)activeNum{
    currentActiveLevel = activeNum;
    
    
    
    for (int i=0; i<[self.fifteenShuffleHolder.children count]; i++) {
        
        CCSprite *item = [self.fifteenShuffleHolder children][i];
        if(activeNum == item.name.intValue){
            activeSprite = item;
            break;
        }
    }
    
    CCNode *myCurrentCellBg = [activeSprite getChildByName:@"myCellBg" recursively:NO];
    myCurrentCellBg.opacity = 1;
}

-(int)getActiveLevelNumber{
    return currentActiveLevel;
}

-(int)getActivePuzzleNumber{
    return activePuzzleNumber;
}

-(void) removeLevelFromView {

//    NSLog(@"removeLevelFromView");
    [self.gameplayParrentDelegate exitToMain];
//    [self.gameplayParrentDelegate clearLevels];
    
    

}



-(void) updateSomeData {
    resultsBar.fifteenDeath++;
}




-(int) getCurrentIntForFloat: (float)oldFloat{
    
    int returnInt = 0;
    
    float myFloat = [[NSString stringWithFormat:@"%.1f", oldFloat] floatValue];
    
    
    if(myFloat >= 1.09 && myFloat <= 1.15){
        returnInt = 6;
    } else if(myFloat >= 1.19 && myFloat <= 1.25){
        returnInt = 7;
    } else if(myFloat >= 1.29 && myFloat <= 1.35){
        returnInt = 8;
    } else if(myFloat >= 2.09 && myFloat <= 2.15){
        returnInt = 11;
    } else if(myFloat >= 2.19 && myFloat <= 2.25){
        returnInt = 12;
    } else if(myFloat >= 2.29 && myFloat <= 2.35){
        returnInt = 13;
    } else if(myFloat >= 3.09 && myFloat <= 3.15){
        returnInt = 16;
    } else if(myFloat >= 3.19 && myFloat <= 3.25){
        returnInt = 17;
    } else if(myFloat >= 3.29 && myFloat <= 3.35){
        returnInt = 18;
    }
    
    return returnInt;
    
}

@end
