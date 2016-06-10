//
//  LeftMenu.h
//  Hardcore
//
//  Created by Pete Streem on 2/4/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Fifteen.h"


@interface LeftMenu : CCNode


@property GamePlay *gameplayParrentDelegate;
@property CCNode *fifteentutorialhighlight;

-(void) makeMovement:(CGPoint)mytouchPoint;
-(void) finishMovement:(int)direction;
-(void) totalHide:(int)direction;

-(void) setupData:(CCSprite *)originalFifteen withCurrentFifteen:(CCSprite *)currentFifteen;

@property BOOL leftMenuEnabled;

-(void) moveTutorialHighlight:(CGPoint) myPoint;




@end
