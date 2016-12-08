
//
//  Rusty.m
//  Untitled
//
//  Created by Admin on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Rusty.h"


@implementation Rusty {
    
    CCLightNode *lightNode;
    
    CCNode *rustyIdle;
    CCNode *rustyJump;
    
    CCPhysicsBody *rustyPhysicsBody;
    
    
    
}





- (instancetype)init
{
    self = [super init];
    if (self) {
        
        rustyPhysicsBody = [CCPhysicsBody bodyWithCircleOfRadius:7.5 andCenter:ccp(0, 0)];
        rustyPhysicsBody.type = CCPhysicsBodyTypeDynamic;
        rustyPhysicsBody.allowsRotation = NO;
        rustyPhysicsBody.affectedByGravity = YES;
        rustyPhysicsBody.density = 1;
        rustyPhysicsBody.friction = 1;
        rustyPhysicsBody.elasticity = 0;
        rustyPhysicsBody.collisionType = @"rusty";
        
        self.physicsBody = rustyPhysicsBody;
        
        
        
        
        rustyIdle = [CCBReader load:@"rusty/rustyIdle"];
        [self addChild:rustyIdle];
        
        rustyJump = [CCBReader load:@"rusty/rustyJump"];
        [self addChild:rustyJump];
        rustyJump.visible = NO;
        
        
        
        
    }
    return self;
}



-(void) initLight {
    
    
        lightNode = [[CCLightNode alloc] init];

        lightNode.type = CCLightPoint;
        lightNode.intensity = 0.8;
        lightNode.specularIntensity = 1 / 2;  //Karamelnost
        lightNode.specularIntensity = 0.05;
        lightNode.depth = 50;
        lightNode.ambientIntensity = 0.65;
        lightNode.halfRadius = 0.50;
        lightNode.cutoffRadius = 0;
        
        [self addChild:lightNode];
    
    
}
-(void) startJump {
    
    NSLog(@"startJump");
    rustyIdle.visible = NO;
    [rustyJump.animationManager jumpToSequenceNamed:@"timeline" time:0];
    rustyJump.visible = YES;
    
}

-(void) finishJump {
    
    NSLog(@"finishJump");
    rustyIdle.visible = YES;
    rustyJump.visible = NO;
    
    
}


@end
