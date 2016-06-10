//
//  FifteenInfoBar.m
//  Hardcore
//
//  Created by Pete Streem on 4/21/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "FifteenInfoBar.h"

@implementation FifteenInfoBar{
    
    CCNodeColor *_bg;
    CCNodeColor *_backgroundOverlay;
    
    CCLabelTTF *_fifteenTimeTxt;
    CCLabelTTF *_fifteenDeathTxt;
    CCLabelTTF *_fifteenMovesTxt;
    
    CCLabelTTF *_fifteenEtaTimeTxt;
    CCLabelTTF *_fifteenEtaDeathTxt;
    CCLabelTTF *_fifteenEtaMovesTxt;
    
    CCButton *_myButton;
    CCButton *_continueButton;
    
    
    int currentLevelId;
}




- (void)didLoadFromCCB {
    _fifteenEtaTimeTxt.opacity = 0.3;
    _fifteenEtaDeathTxt.opacity = 0.3;
    _fifteenEtaMovesTxt.opacity = 0.3;
    
    _bg.position = ccp(_bg.position.x, -68);
    
    _backgroundOverlay.opacity = 0;
    
    _fifteenTimeTxt.position = ccp(_fifteenTimeTxt.position.x, _fifteenTimeTxt.position.y-68*2);
    _fifteenDeathTxt.position = ccp(_fifteenDeathTxt.position.x, _fifteenDeathTxt.position.y-68*2);
    _fifteenMovesTxt.position = ccp(_fifteenMovesTxt.position.x, _fifteenMovesTxt.position.y - 68*2);
    
    _fifteenEtaTimeTxt.position = ccp(_fifteenEtaTimeTxt.position.x, _fifteenEtaTimeTxt.position.y-68*2);
    _fifteenEtaDeathTxt.position = ccp(_fifteenEtaDeathTxt.position.x, _fifteenEtaDeathTxt.position.y-68*2);
    _fifteenEtaMovesTxt.position = ccp(_fifteenEtaMovesTxt.position.x, _fifteenEtaMovesTxt.position.y - 68*2);
    
    
    _myButton.position = ccp(_myButton.position.x, _myButton.position.y-68*2);
    _continueButton.position = ccp(_continueButton.position.x, _continueButton.position.y-68*2);
    currentLevelId = 0;
}


-(void) startShow:(FifteenItem *)currentFifteenData andLevelId:(int)levelId{
    
    
    if([currentFifteenData.currentFifteenLevel intValue] == 1){
        _continueButton.visible = NO;
        _myButton.visible = YES;
    } else {
        _myButton.visible = NO;
        _continueButton.visible = YES;
    }
    
    
    NSString *_myStr;
    
    currentLevelId = levelId;
    
    _myStr = [NSString stringWithFormat:@"Time: %02i:%02i", currentFifteenData.fifteenMinutesPassed.integerValue, currentFifteenData.fifteenSecondsPassed.integerValue];
    [_fifteenTimeTxt setString:_myStr];
    
    _myStr = [NSString stringWithFormat:@"Death: %i", currentFifteenData.fifteenDeath.integerValue];
    [_fifteenDeathTxt setString:_myStr];
    
    _myStr = [NSString stringWithFormat:@"Portal moves: %i", currentFifteenData.fifteenMoves.integerValue];
    [_fifteenMovesTxt setString:_myStr];
    
    
    
    _myStr = [NSString stringWithFormat:@"Time: %02i:%02i", currentFifteenData.fifteenEtaMinutesPassed.integerValue, currentFifteenData.fifteenEtaSecondsPassed.integerValue];
    [_fifteenEtaTimeTxt setString:_myStr];
    
    _myStr = [NSString stringWithFormat:@"Death: %i", currentFifteenData.fifteenEtaDeath.integerValue];
    [_fifteenEtaDeathTxt setString:_myStr];
    
    _myStr = [NSString stringWithFormat:@"Portal moves: %i", currentFifteenData.fifteenEtaMoves.integerValue];
    [_fifteenEtaMovesTxt setString:_myStr];
    
    
    
    CCActionFadeIn *bgFadeIn = [CCActionFadeTo actionWithDuration:0.5 opacity:0.5];
    [_backgroundOverlay runAction:bgFadeIn];
    
    
    
    
    

    
    
    if(currentFifteenData.fifteenMinutesPassed.integerValue >= 0 && currentFifteenData.fifteenMinutesPassed.integerValue < currentFifteenData.fifteenEtaMinutesPassed.integerValue){
        
        
        _fifteenTimeTxt.color = [CCColor colorWithCcColor3b:ccc3(65, 156, 137)];
        
        
    } else if(currentFifteenData.fifteenMinutesPassed.integerValue >= 0 && currentFifteenData.fifteenMinutesPassed.integerValue == currentFifteenData.fifteenEtaMinutesPassed.integerValue){
        
        
        
        if(currentFifteenData.fifteenSecondsPassed.integerValue <= currentFifteenData.fifteenEtaSecondsPassed.integerValue){
            
            _fifteenTimeTxt.color = [CCColor colorWithCcColor3b:ccc3(65, 156, 137)];
            
        } else {
            _fifteenTimeTxt.color = [CCColor colorWithCcColor3b:ccc3(221, 87, 81)];
        }
        
    } else {
        _fifteenTimeTxt.color = [CCColor colorWithCcColor3b:ccc3(221, 87, 81)];
    }
    
    
    
    
    if(currentFifteenData.fifteenDeath.integerValue >= 0 && currentFifteenData.fifteenDeath.integerValue <= currentFifteenData.fifteenEtaDeath.integerValue){
        //Прошел по смертям
        _fifteenDeathTxt.color = [CCColor colorWithCcColor3b:ccc3(65, 156, 137)];
    } else {
        //Не прошел по смертям
        _fifteenDeathTxt.color = [CCColor colorWithCcColor3b:ccc3(221, 87, 81)];
    }
    
    if(currentFifteenData.fifteenMoves.integerValue >= 0 && currentFifteenData.fifteenMoves.integerValue <= currentFifteenData.fifteenMoves.integerValue){
        //Прошел по ходам
        _fifteenMovesTxt.color = [CCColor colorWithCcColor3b:ccc3(65, 156, 137)];
    } else {
        //Не прошел по ходам
        _fifteenMovesTxt.color = [CCColor colorWithCcColor3b:ccc3(221, 87, 81)];
        
    }

    
    
    
    
    
    
    
    
    
    CCActionMoveTo *myMoveTo = [CCActionMoveTo actionWithDuration:1 position:ccp(_bg.position.x, 0)];
    CCActionEaseInOut *myEase = [CCActionEaseInOut actionWithAction:myMoveTo rate:4];
    
    [_bg runAction:myEase];
    
    CCActionDelay *myTimeDelay = [CCActionDelay actionWithDuration:0.1];
    
    CCActionMoveTo *myTimeMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenTimeTxt.position.x, 34)];
    CCActionEaseInOut *myTimeEase = [CCActionEaseInOut actionWithAction:myTimeMove rate:4];
    [_fifteenTimeTxt runAction:[CCActionSequence actions:myTimeDelay, myTimeEase, nil]];
    
    
    
    CCActionDelay *myDeathDelay = [CCActionDelay actionWithDuration:0.2];
    
    CCActionMoveTo *myDeathMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenDeathTxt.position.x, 34)];
    CCActionEaseInOut *myDeathEase = [CCActionEaseInOut actionWithAction:myDeathMove rate:4];
    [_fifteenDeathTxt runAction:[CCActionSequence actions:myDeathDelay, myDeathEase, nil]];
    
    
    CCActionDelay *myMoveDelay = [CCActionDelay actionWithDuration:0.3];
    
    CCActionMoveTo *myMovesMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenMovesTxt.position.x, 34)];
    CCActionEaseInOut *myMoveEase = [CCActionEaseInOut actionWithAction:myMovesMove rate:4];
    [_fifteenMovesTxt runAction:[CCActionSequence actions:myMoveDelay, myMoveEase, nil]];
    
    
    
    
   
    
    
    CCActionDelay *myEtaTimeDelay = [CCActionDelay actionWithDuration:0.15];
    
    CCActionMoveTo *myEtaTimeMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenEtaTimeTxt.position.x, 15.5)];
    CCActionEaseInOut *myEtaTimeEase = [CCActionEaseInOut actionWithAction:myEtaTimeMove rate:4];
    [_fifteenEtaTimeTxt runAction:[CCActionSequence actions:myEtaTimeDelay, myEtaTimeEase, nil]];
    
    
    CCActionDelay *myEtaDeathDelay = [CCActionDelay actionWithDuration:0.25];
    
    CCActionMoveTo *myEtaDeathMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenEtaDeathTxt.position.x, 15.5)];
    CCActionEaseInOut *myEtaDeathEase = [CCActionEaseInOut actionWithAction:myEtaDeathMove rate:4];
    [_fifteenEtaDeathTxt runAction:[CCActionSequence actions:myEtaDeathDelay, myEtaDeathEase, nil]];
    
    
    CCActionDelay *myEtaMoveDelay = [CCActionDelay actionWithDuration:0.35];
    
    CCActionMoveTo *myEtaMovesMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_fifteenEtaMovesTxt.position.x, 15.5)];
    CCActionEaseInOut *myEtaMoveEase = [CCActionEaseInOut actionWithAction:myEtaMovesMove rate:4];
    [_fifteenEtaMovesTxt runAction:[CCActionSequence actions:myEtaMoveDelay, myEtaMoveEase, nil]];
    
    
    
    CCActionDelay *myReplayButtonDelay = [CCActionDelay actionWithDuration:0.45];
    
    CCActionMoveTo *myReplayButtonMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_myButton.position.x, 34)];
    CCActionEaseInOut *myReplayButtonEase = [CCActionEaseInOut actionWithAction:myReplayButtonMove rate:4];
    [_myButton runAction:[CCActionSequence actions:myReplayButtonDelay, myReplayButtonEase, nil]];
    
    CCActionMoveTo *myContinueButtonMove = [CCActionMoveTo actionWithDuration:1 position:ccp(_continueButton.position.x, 34)];
    CCActionEaseInOut *myContinueButtonEase = [CCActionEaseInOut actionWithAction:myContinueButtonMove rate:4];
    [_continueButton runAction:[CCActionSequence actions:myReplayButtonDelay, myContinueButtonEase, nil]];
    
    
}


-(void) startHide{
    
    CCActionFadeTo *bgFadeOut = [CCActionFadeTo actionWithDuration:0.5 opacity:0];
    [_backgroundOverlay runAction:bgFadeOut];
    
    
    
    CCActionDelay *myBgDelay = [CCActionDelay actionWithDuration:0.35];
    
    CCActionMoveTo *myMoveTo = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_bg.position.x, -68)];
    CCActionEaseInOut *myEase = [CCActionEaseInOut actionWithAction:myMoveTo rate:4];
    [_bg runAction:[CCActionSequence actions:myBgDelay, myEase, nil]];
    
   
    CCActionDelay *myTimeDelay = [CCActionDelay actionWithDuration:0.1];
    
    CCActionMoveTo *myTimeMove = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_fifteenTimeTxt.position.x, _fifteenTimeTxt.position.y-68*2)];
    CCActionEaseInOut *myTimeEase = [CCActionEaseInOut actionWithAction:myTimeMove rate:4];
    [_fifteenTimeTxt runAction:[CCActionSequence actions:myTimeDelay, myTimeEase, nil]];
    
    
    
    CCActionDelay *myDeathDelay = [CCActionDelay actionWithDuration:0.2];
    
    CCActionMoveTo *myDeathMove = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_fifteenDeathTxt.position.x, _fifteenDeathTxt.position.y-68*2)];
    CCActionEaseInOut *myDeathEase = [CCActionEaseInOut actionWithAction:myDeathMove rate:4];
    [_fifteenDeathTxt runAction:[CCActionSequence actions:myDeathDelay, myDeathEase, nil]];
    
    
    CCActionDelay *myMoveDelay = [CCActionDelay actionWithDuration:0.25];
    
    CCActionMoveTo *myMovesMove = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_fifteenMovesTxt.position.x, _fifteenMovesTxt.position.y-68*2)];
    CCActionEaseInOut *myMoveEase = [CCActionEaseInOut actionWithAction:myMovesMove rate:4];
    [_fifteenMovesTxt runAction:[CCActionSequence actions:myMoveDelay, myMoveEase, nil]];
    
    
    
    
    
    
    
    CCActionDelay *myEtaTimeDelay = [CCActionDelay actionWithDuration:0.15];
    
    CCActionMoveTo *myEtaTimeMove = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_fifteenEtaTimeTxt.position.x, _fifteenEtaTimeTxt.position.y-68*2)];
    CCActionEaseInOut *myEtaTimeEase = [CCActionEaseInOut actionWithAction:myEtaTimeMove rate:4];
    [_fifteenEtaTimeTxt runAction:[CCActionSequence actions:myEtaTimeDelay, myEtaTimeEase, nil]];
    
    
    CCActionDelay *myEtaDeathDelay = [CCActionDelay actionWithDuration:0.25];
    
    CCActionMoveTo *myEtaDeathMove = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_fifteenEtaDeathTxt.position.x, _fifteenEtaDeathTxt.position.y-68*2)];
    CCActionEaseInOut *myEtaDeathEase = [CCActionEaseInOut actionWithAction:myEtaDeathMove rate:4];
    [_fifteenEtaDeathTxt runAction:[CCActionSequence actions:myEtaDeathDelay, myEtaDeathEase, nil]];
    
    
    CCActionDelay *myEtaMoveDelay = [CCActionDelay actionWithDuration:0.35];
    
    CCActionMoveTo *myEtaMovesMove = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_fifteenEtaMovesTxt.position.x, _fifteenEtaMovesTxt.position.y-68*2)];
    CCActionEaseInOut *myEtaMoveEase = [CCActionEaseInOut actionWithAction:myEtaMovesMove rate:4];
    [_fifteenEtaMovesTxt runAction:[CCActionSequence actions:myEtaMoveDelay, myEtaMoveEase, nil]];
    
    
    
    CCActionDelay *myReplayButtonDelay = [CCActionDelay actionWithDuration:0.35];
    
    CCActionMoveTo *myReplayButtonMove = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_myButton.position.x, _myButton.position.y-68*2)];
    CCActionEaseInOut *myReplayButtonEase = [CCActionEaseInOut actionWithAction:myReplayButtonMove rate:4];
    [_myButton runAction:[CCActionSequence actions:myReplayButtonDelay, myReplayButtonEase, nil]];
    
    CCActionMoveTo *myContinueButtonMove = [CCActionMoveTo actionWithDuration:0.25 position:ccp(_continueButton.position.x, _continueButton.position.y-68*2)];
    CCActionEaseInOut *myContinueButtonEase = [CCActionEaseInOut actionWithAction:myContinueButtonMove rate:4];
    [_continueButton runAction:[CCActionSequence actions:myReplayButtonDelay, myContinueButtonEase, nil]];
    
    
}



-(void) playAgainClicked{
    
    
    [self.mainMenuDelegate replayBtn:currentLevelId];
    
    
    
}


@end
