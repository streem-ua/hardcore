//
//  Rusty.h
//  Untitled
//
//  Created by Admin on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
//#import "GamePlay.h"

@interface Rusty : CCSprite
//@interface Rusty : CCNode <CCPhysicsCollisionDelegate>


//@property (nonatomic, assign) CGPoint velocity;


//@property GamePlay *gamePlayDelegate;



-(void) makeMovement:(int) movementDirection;
-(void) touchStopped;
-(void) tryAnimation: (int) direction;


@property BOOL animationRunning;

@end
