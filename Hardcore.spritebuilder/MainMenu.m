//
//  MainMenu.m
//  Hardcore
//
//  Created by Pete Streem on 11/26/15.
//  Copyright © 2015 Apportable. All rights reserved.
//

#import "MainMenu.h"
#import "FifteenCustomTab.h"
#import "FifteenItem.h"
#import "FifteenInfoBar.h"



@implementation MainMenu{
    CCNode *_fifteenStartSelect;
    CCButton *_fifteenBtnTxt;
    CCButton *_levelsBtnTxt;

    FifteenInfoBar *infoBar;

    
    
    /* FIFTEENS */
    
}




- (void)didLoadFromCCB {
    _fifteenStartSelect.visible = NO;
    
//    fifteenTab1.gameplayParrentDelegate = self.gameplayParrentDelegate;
    
    
    
    
    //вот тут читаю
    //немного отвелкстут звонил папа
    //тут уже
    // ага ок
    
//    NSDictionary *retrievedDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"fifteen"];
    
    
    
    
//    NSData *readItemData = [[NSUserDefaults standardUserDefaults] objectForKey:@"1"];
//    FifteenItem *readItem = [NSKeyedUnarchiver unarchiveObjectWithData:readItemData];
    
    
//    NSLog(@"%@", readItem.isFifteenOpened);
    
    
    
 
    int x_counter = 0;
    int y_counter = 0;
    
    for(int i=1; i<=10; i++){
     
        
        
        
        //NSInteger availBool = [[retrievedDictionary valueForKey:[NSString stringWithFormat:@"%d", i]] integerValue];
        
        NSData *readItemData = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%d", i]];
        FifteenItem *readItem = [NSKeyedUnarchiver unarchiveObjectWithData:readItemData];
        
        
        FifteenCustomTab *myFifteenTab = [FifteenCustomTab node];
        [myFifteenTab initWithId:i fifteenItem:readItem];
        
        myFifteenTab.mainMenuDelegate = self;
        
//        myFifteenTab.position = ccp(60+97*x_counter, 120+140*y_counter);
        myFifteenTab.position = ccp(60+97*x_counter, 260-140*y_counter);
        
        myFifteenTab.userInteractionEnabled = YES;
        
        
        [_fifteenStartSelect addChild:myFifteenTab];
        
        
       
        x_counter++;
        if(x_counter==5){
            x_counter = 0;
            y_counter++;
        }
        
        
    }
    
    
    
    
    infoBar = (FifteenInfoBar*)[CCBReader load:@"fifteen/fifteenResultsInfoBar"];
    infoBar.mainMenuDelegate = self;
    infoBar.visible = NO;
    
    [self addChild:infoBar];
    
}


-(void) doneShow{
    infoBar.visible = YES;
    
}

-(void) doneHide{
    infoBar.visible = NO;
    
}



-(void) showStats:(FifteenItem *)currentFifteenData andWithId:(int)levelId{
    
    
    
    CCActionMoveTo *moveFifteen;
    CCActionEaseInOut *moveFifteenEase;
    CCActionCallFunc *callMe;
    
    if(infoBar.visible == NO){
        infoBar.visible = YES;
        moveFifteen = [CCActionMoveTo actionWithDuration:0.5 position:ccp(_fifteenStartSelect.position.x, _fifteenStartSelect.position.y + 100)];
        
        callMe = [CCActionCallFunc actionWithTarget:self selector:@selector(doneShow)];
        moveFifteenEase = [CCActionEaseInOut actionWithAction:moveFifteen rate:4];
        
        [infoBar startShow:currentFifteenData andLevelId:levelId];
        
    } else {
        
        moveFifteen = [CCActionMoveTo actionWithDuration:0.5 position:ccp(_fifteenStartSelect.position.x, _fifteenStartSelect.position.y - 100)];
        moveFifteenEase = [CCActionEaseInOut actionWithAction:moveFifteen rate:4];
        callMe = [CCActionCallFunc actionWithTarget:self selector:@selector(doneHide)];
        
        [infoBar startHide];
    }
    
    
    [_fifteenStartSelect runAction:[CCActionSequence actions:moveFifteenEase, callMe, nil]];
    
}


-(void) levelsPressed {
    
    
    [self.gameplayParrentDelegate startupMenuFunc:YES with15id:0];
    

}


-(void) fifteenPressed {
    
    _fifteenStartSelect.visible = YES;
    _fifteenBtnTxt.visible = NO;
    _levelsBtnTxt.visible = NO;
    
    
   //[self.gameplayParrentDelegate startupMenuFunc:NO];
    
}

-(void) replayBtn:(int)newLevel {
    
    
    _fifteenStartSelect.visible = NO;
    [self.gameplayParrentDelegate startupMenuFunc:NO with15id:newLevel];
}

-(void) _fifteenBtn:(CCButton *)sender{
    

    
    if([sender.name  isEqual: @"0"]){
        
        _fifteenStartSelect.visible = NO;
        _fifteenBtnTxt.visible = YES;
        _levelsBtnTxt.visible = YES;
      
        
    } else {
  
        _fifteenStartSelect.visible = NO;
        [self.gameplayParrentDelegate startupMenuFunc:NO with15id:sender.name.intValue];
   
    }
    
}



-(void) removeLevelFromView {
    [self.gameplayParrentDelegate exitToMain];
}

@end
