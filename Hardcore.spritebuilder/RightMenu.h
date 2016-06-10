//
//  Rusty.h
//  Untitled
//
//  Created by Admin on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "GamePlay.h"
#import "LeftMenu.h"

@interface RightMenu : CCNode

-(void) makeMovement:(CGPoint)mytouchPoint;
-(void) finishMovement:(int)direction;
-(void) totalHide:(int)direction;
-(void) updateData;

@property BOOL rightMenuEnabled;

@property GamePlay *gameplayParrentDelegate;
@property LeftMenu *leftMenuDelegate;

@end
