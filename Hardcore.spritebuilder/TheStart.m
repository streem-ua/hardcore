//
//  TheStart.m
//  Hardcore
//
//  Created by Pete Streem on 2/19/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "TheStart.h"
#import "CCBuilderReader.h"
#import "GamePlay.h"
#import "FifteenItem.h"

@implementation TheStart {
    
    
    BOOL devMode;
    
    
}

- (void)didLoadFromCCB
{
 
    NSLog(@"The Start loaded");
    devMode = NO;
    
    
}


-(void) startGame{
    
    
    
        for (int i=1; i<=11; i++) {
            
            
            
            
            NSData *readItemData = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%d", i]];
            FifteenItem *readItem = [NSKeyedUnarchiver unarchiveObjectWithData:readItemData];
            
            FifteenItem *item = [[FifteenItem alloc] init];
            
            
            if(readItem.isFifteenOpened.integerValue == 1){
                
                
                item.isFifteenOpened = @YES;
                item.isBossDefeated = @NO;
                
                //            item.fifteenNumber = readItem.fifteenNumber;
                item.fifteenDeath = readItem.fifteenDeath;
                item.fifteenMoves = readItem.fifteenMoves;
                item.fifteenMinutesPassed = readItem.fifteenMinutesPassed;
                item.fifteenSecondsPassed = readItem.fifteenSecondsPassed;
                
                item.fifteenPositions = readItem.fifteenPositions;
                
                
                if(devMode){
                    
                    item.currentFifteenLevel = @1;
                    [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:1.6]];
                    [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
                    [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.3]];
                    [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.1]];
                    [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.5]];
                    
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.3]];
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.1]];
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.5]];
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
                    [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.6]];
                    
                } else {
                    item.fifteenPositionsShuffled = readItem.fifteenPositionsShuffled;
                    item.currentFifteenLevel = readItem.currentFifteenLevel;
                }
                
                
            } else {
                
                
                
                //            item.fifteenNumber = readItem.fifteenNumber;
                item.fifteenDeath = [NSNumber numberWithInt:-1];
                item.fifteenMoves = [NSNumber numberWithInt:-1];
                item.fifteenMinutesPassed = [NSNumber numberWithInt:-1];
                item.fifteenSecondsPassed = [NSNumber numberWithInt:-1];
                item.isBossDefeated = @NO;
                
                item.currentFifteenLevel = @1;
                
                switch (i) {
                    case 1:
                        
                        
                        
                        
                        if(devMode){
                            item.isFifteenOpened = @YES;
                            
                            
                            [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:1.6]];
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
                            [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.3]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.1]];
                            [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.5]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.6]];
                            
                        } else {
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.1]];
                            [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.5]];
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
                            [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.6]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:3.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:5.6]];
                            
                        }
                        
                        
                        
                        
                        
                        break;
                        
                        
                    case 2:
                        
                        if(devMode){
                            item.isFifteenOpened = @YES;
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.1]];
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:3.6]];
                            [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.4]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:3.6]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.4]];
                        } else {
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.1]];
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:3.6]];
                            [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.4]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:3.6]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.4]];
                            
                        }
                        
                        
                        
                        break;
                        
                        
                        
                    case 3:
                        if(devMode){
                            item.isFifteenOpened = @YES;
                        
                        [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:1.3]];
                        [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.6]];
                        [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:3.4]];
                        [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.2]];
                        [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.2]];
                        
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.6]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.2]];

                            
                            
                            
                        } else {
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.6]];
                            [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.2]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.2]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.6]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.2]];
                        }
                        
                        break;
                        
                        
                        
                    case 4:
                        if(devMode){
                            item.isFifteenOpened = @YES;
                            
                        [item.fifteenPositions replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:1.1]];
                        [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.6]];
                        [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.2]];
                        [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:4.3]];
                        [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:5.5]];
                        
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.1]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.6]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:3.2]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.3]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.5]];
                        
                        } else {
                            
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:1.1]];
                            [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.6]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.2]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:4.3]];
                            [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:5.5]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.6]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:3.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.5]];
                            
                        }
                        
                        break;
                        
                        
                        
                    case 5:
                        if(devMode){
                            item.isFifteenOpened = @YES;
                        
                        [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.2]];
                        [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.5]];
                        [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:3.4]];
                        [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:4.3]];
                        [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.6]];
                        
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.2]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.5]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:3.4]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:4.3]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.6]];
                            
                        } else {
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.2]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.5]];
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:4.3]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.6]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:4.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:5.6]];
                        }
                        
                        break;
                        
                        
                    case 6:
                        if(devMode){
                            item.isFifteenOpened = @YES;
                        
                        [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.6]];
                        [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:2.3]];
                        [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:3.1]];
                        [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:4.5]];
                        [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:5.4]];
                        
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.6]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.3]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.5]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.4]];
                            
                        } else {
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.6]];
                            [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:2.3]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:3.1]];
                            [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:5.4]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.6]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.4]];
                        }
                        
                        break;
                        
                        
                    case 7:
                        if(devMode){
                            item.isFifteenOpened = @YES;
                        
                        [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.5]];
                        [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.4]];
                        [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                        [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.6]];
                        [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:5.2]];
                        
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.5]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.4]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:4.6]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.2]];
                            
                        } else {
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.5]];
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.4]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.6]];
                            [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:5.2]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.4]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:4.6]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.2]];
                        }
                        
                        break;
                        
                        
                    case 8:
                        
                        if(devMode){
                            item.isFifteenOpened = @YES;
                        
                        [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.2]];
                        [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.4]];
                        [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                        [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.5]];
                        [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.6]];
                        
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.2]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.4]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.1]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.5]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:5.6]];
                            
                        } else {
                            
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.2]];
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.4]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.1]];
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.6]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:2.4]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:5.6]];
                        }
                        
                        break;
                        
                        
                    case 9:
                        
                        if(devMode){
                            item.isFifteenOpened = @YES;
                        [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.1]];
                        [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.6]];
                        [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:3.3]];
                        [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:4.5]];
                        [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:5.2]];
                        
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.1]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:2.6]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.3]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:4.5]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.2]];
                            
                        } else {
                            item.isFifteenOpened = @NO;
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:1.1]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.6]];
                            [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:3.3]];
                            [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:5.2]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:2.6]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:4.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.2]];
                        }
                        
                        break;
                        
                        
                    case 10:
                        
                        if(devMode){
                            item.isFifteenOpened = @YES;

                        
                        [item.fifteenPositions replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:1.2]];
                        [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.3]];
                        [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.5]];
                        [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:4.4]];
                        [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.1]];
                        
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:1.2]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.3]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.5]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:4.4]];
                        [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:5.1]];
                            
                        } else {
                            item.isFifteenOpened = @NO;
                            
                            
                            [item.fifteenPositions replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:1.2]];
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.3]];
                            [item.fifteenPositions replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.5]];
                            [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:4.4]];
                            [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.1]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:1.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:2.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:3.5]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:4.4]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:5.1]];
                        }
                        
                        break;
                        
                        
                    case 11:
                        
                        if(devMode){
                            item.isFifteenOpened = @YES;
                            
                            [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.3]];
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.2]];
                            [item.fifteenPositions replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:4.1]];
                            [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:1.6]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:4.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:1.6]];
                            
                        } else {
                            
                            item.isFifteenOpened = @NO;
                            
                            [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositions replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.2]];
                            [item.fifteenPositions replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositions replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:4.1]];
                            [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.6]];
                            
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.3]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:11 withObject: [NSNumber numberWithFloat:2.2]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:6 withObject: [NSNumber numberWithFloat:3.4]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:4.1]];
                            [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:5.6]];
                            
                        }
                        
                        break;
                        
                        
                        
                        
                        
                        
                        
                    default:
                        break;
                }
                
                
                
                
            }
            
            
            
            switch (i) {
                case 1:
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    
                    break;
                    
                    
                case 2:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    break;
                    
                    
                    
                case 3:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    
                    break;
                    
                    
                    
                case 4:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    break;
                    
                    
                    
                case 5:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    break;
                    
                    
                case 6:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    
                    
                    break;
                    
                    
                case 7:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    break;
                    
                    
                case 8:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    
                    break;
                    
                    
                case 9:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    
                    break;
                    
                    
                case 10:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    
                    break;
                    
                case 11:
                    
                    item.fifteenEtaDeath = @10;
                    item.fifteenEtaMoves = @20;
                    item.fifteenEtaMinutesPassed = @10;
                    item.fifteenEtaSecondsPassed = @10;
                    
                    break;
                    
                    
                    
                    
                    
                    
                    
                default:
                    break;
            }
            
            
            NSData *itemData = [NSKeyedArchiver archivedDataWithRootObject:item];
            [[NSUserDefaults standardUserDefaults] setObject:itemData forKey:[NSString stringWithFormat:@"%d", i]];
            [[NSUserDefaults standardUserDefaults] synchronize];
    
        
    }
    
    
    
    [[CCDirector sharedDirector] replaceScene:[CCBReader loadAsScene:@"GamePlay"]];
}


- (void) devMode:(CCButton *)sender{

    if(devMode){
        devMode = NO;
        sender.title = @"Dev mode is: OFF";
    } else {
        devMode = YES;
        sender.title = @"Dev mode is: ON";
    }
    
}


-(void) resetData {
    
    
        NSString *domainName = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    
    
        FifteenItem *item = [[FifteenItem alloc] init];
    
        item.isFifteenOpened = @YES;
        item.isBossDefeated = @NO;
    
        item.fifteenDeath = @1;
        item.fifteenMoves = @12;
        item.fifteenMinutesPassed = @3;
        item.fifteenSecondsPassed = @4;
    
    [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.3]];
    [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.1]];
    [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.5]];
    [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
    [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:5.6]];
    
    [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:1.3]];
    [item.fifteenPositionsShuffled replaceObjectAtIndex:12 withObject: [NSNumber numberWithFloat:2.1]];
    [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:3.5]];
    [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
    [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:5.6]];
    

    
    
    
//    [item.fifteenPositions replaceObjectAtIndex:8 withObject: [NSNumber numberWithFloat:1.6]];
//    [item.fifteenPositions replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
//    [item.fifteenPositions replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.3]];
//    [item.fifteenPositions replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.1]];
//    [item.fifteenPositions replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.5]];
//    
//    [item.fifteenPositionsShuffled replaceObjectAtIndex:16 withObject: [NSNumber numberWithFloat:5.3]];
//    [item.fifteenPositionsShuffled replaceObjectAtIndex:17 withObject: [NSNumber numberWithFloat:2.1]];
//    [item.fifteenPositionsShuffled replaceObjectAtIndex:18 withObject: [NSNumber numberWithFloat:3.5]];
//    [item.fifteenPositionsShuffled replaceObjectAtIndex:13 withObject: [NSNumber numberWithFloat:4.2]];
//    [item.fifteenPositionsShuffled replaceObjectAtIndex:7 withObject: [NSNumber numberWithFloat:1.6]];
    
    
    
    
    item.currentFifteenLevel = @1;
    
    
        NSData *itemData = [NSKeyedArchiver archivedDataWithRootObject:item];
        [[NSUserDefaults standardUserDefaults] setObject:itemData forKey:@"1"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    
}



@end
