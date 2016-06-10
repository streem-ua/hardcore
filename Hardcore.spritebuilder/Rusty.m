//
//  Rusty.m
//  Untitled
//
//  Created by Admin on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Rusty.h"


@implementation Rusty {
    
    CCNode *mainBody;
    
    CCSprite *rustyMain;
    
    CCSprite *rustyBack;
    CCSprite *rustyEye;
    CCSprite *rustyAppleEye;
    
    CCActionMoveTo *moveEyes;
    CCActionMoveTo *moveEyesApples;

    
    CCLightNode *lightNode;
    
    
    
}


-(void) didLoadFromCCB{
    //не вызывается
    self.physicsBody.collisionType = @"rusty";
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)initTrololo
{
    
        
        
        
        
        
        self.animationRunning = NO;
        
//        CCPhysicsBody* staticBody = [CCPhysicsBody bodyWithRect:CGRectMake(0,0, size.width, size.height) cornerRadius:0];
//        staticBody.type = CCPhysicsBodyTypeStatic;
        
        
       // mainBody = [[CCNode alloc] init];
       // [self addChild:mainBody];
        
        
        rustyMain = [CCSprite node];
//        lightNode = [[CCLightNode alloc] init];
//        lightNode.type = CCLightPoint;
//        
//         lightNode.intensity = 1;
//        lightNode.specularIntensity = 1 / 2;  //Karamelnost
//            lightNode.specularIntensity = 0.05;
//            lightNode.depth = 50;
//        
//            lightNode.ambientIntensity = 0.15;
//        
//            lightNode.halfRadius = 0.7;
//            lightNode.cutoffRadius = 130.4;
        
        
        
        
        [self addChild:rustyMain];
//        [rustyMain addChild:lightNode];
        
        float bubbleRadius = self.contentSize.width/2;
        CCPhysicsBody *dynamicBody = [CCPhysicsBody bodyWithCircleOfRadius:7.50 andCenter:ccp(bubbleRadius, bubbleRadius)];
        dynamicBody.type = CCPhysicsBodyTypeDynamic;
        
//        self.physicsBody.collisionType = @"rusty";
        
        
        
        self.physicsBody.affectedByGravity = YES;
        
        self.physicsBody = dynamicBody;
        self.physicsBody.density = 1.0;
        self.physicsBody.friction = 1.0;
        self.physicsBody.allowsRotation = NO;
        
        rustyBack = [[CCSprite alloc] initWithImageNamed:@"rusty_no_eyes.png"];
        rustyBack.scale = 0.25;
        rustyBack.anchorPoint = ccp(0.5,0);
        [rustyMain addChild:rustyBack];
       
        rustyAppleEye = [[CCSprite alloc] initWithImageNamed:@"eyes.png"];
        rustyAppleEye.scale = 0.25;
        rustyAppleEye.position = ccp(rustyAppleEye.position.x, rustyAppleEye.position.y-0.3 - rustyAppleEye.boundingBox.size.height/2 + rustyBack.boundingBox.size.height/2);
        rustyAppleEye.anchorPoint = ccp(0.5,0);
        [rustyMain addChild:rustyAppleEye];
        
        rustyEye = [[CCSprite alloc] initWithImageNamed:@"apple_eye.png"];
        rustyEye.scale = 0.25;
        rustyEye.position = ccp(rustyEye.position.x, rustyEye.position.y-0.3 - rustyEye.boundingBox.size.height/2 + rustyBack.boundingBox.size.height/2);
        rustyEye.anchorPoint = ccp(0.5,0);
        [rustyMain addChild:rustyEye];
        
        
        
        rustyMain.position = ccp(rustyMain.position.x, rustyMain.position.y - rustyBack.boundingBox.size.height/2);
        
//        rustyMain.anchorPoint = ccp(0.0f, 0.0f);
//        
//        [self setAnchorPoint:ccp(1,1) forSprite:rustyMain];
        
        
        
   
}






-(void) makeMovement:(int) movementDirection{
    
    //if(rustyVelocity.x > 0){
        
      //  NSLog(@"velocity.x = %f", rustyVelocity.x);
        
    //}
    
    
    switch (movementDirection) {
        case 1:
            //Left
            
            if(rustyEye.position.x >= -0.7){
                moveEyes = [CCActionMoveTo actionWithDuration:0.2 position:ccp(-0.7, rustyEye.position.y)];
                moveEyesApples = [CCActionMoveTo actionWithDuration:0.2 position:ccp(-0.2, rustyAppleEye.position.y)];
            }
            break;
        
        case 2:
            //Right
            if(rustyEye.position.x <= 0.7){
                moveEyes = [CCActionMoveTo actionWithDuration:0.2 position:ccp(0.7, rustyEye.position.y)];
                moveEyesApples = [CCActionMoveTo actionWithDuration:0.2 position:ccp(0.2, rustyAppleEye.position.y)];
            }
            
            break;
        
        case 3:
            //Up
            if(rustyEye.position.y <= (rustyAppleEye.position.y-0.3 - rustyAppleEye.boundingBox.size.height/2 + rustyBack.boundingBox.size.height/2)){
                moveEyes = [CCActionMoveTo actionWithDuration:0.2 position:ccp(rustyEye.position.x, rustyEye.position.y+0.7)];
                moveEyesApples = [CCActionMoveTo actionWithDuration:0.2 position:ccp(rustyAppleEye.position.x, rustyAppleEye.position.y + 0.2)];
            }
            
            break;
            
        default:
            break;
    }
    
    if(moveEyes){
        CCActionEaseInOut *moveEyesWithEase = [CCActionEaseInOut actionWithAction:moveEyes rate:2];
        [rustyEye runAction:moveEyesWithEase];
        
        
        
        CCActionEaseInOut *moveAppleEyesWithEase = [CCActionEaseInOut actionWithAction:moveEyesApples rate:2];
        [rustyAppleEye runAction:moveAppleEyesWithEase];
    }
    
    
}


-(void) touchStopped {
    
    moveEyes = [CCActionMoveTo actionWithDuration:0.2 position:ccp(0, -0.3 - rustyEye.boundingBox.size.height/2 + rustyBack.boundingBox.size.height/2)];
    moveEyesApples = [CCActionMoveTo actionWithDuration:0.2 position:ccp(0, -0.3 - rustyAppleEye.boundingBox.size.height/2 + rustyBack.boundingBox.size.height/2)];
    
    
    CCActionEaseInOut *moveEyesWithEase = [CCActionEaseInOut actionWithAction:moveEyes rate:2];
    [rustyEye runAction:moveEyesWithEase];
    
    CCActionEaseInOut *moveAppleEyesWithEase = [CCActionEaseInOut actionWithAction:moveEyesApples rate:2];
    [rustyAppleEye runAction:moveAppleEyesWithEase];
}


-(void) tryAnimation: (int) direction{
    
    
    switch (direction) {
        case 1:
            if(!self.animationRunning){
                self.animationRunning = YES;
                
                
               
                
                //rustyEye.anchorPoint = ccp(0.5,0);
                //rustyAppleEye.anchorPoint = ccp(0.5,0);
                //rustyBack.anchorPoint = ccp(0.5,0);
                
                
                CCActionScaleTo *scale = [CCActionScaleTo actionWithDuration:0.1 scaleX:1 scaleY:0.8];
                CCActionEaseOut *myEase = [CCActionEaseOut actionWithAction:scale rate:2];
                
                CCActionScaleTo *scale2 = [CCActionScaleTo actionWithDuration:0.1 scaleX:1 scaleY:1];
                CCActionEaseOut *myEase2 = [CCActionEaseOut actionWithAction:scale2 rate:2];
                
                [rustyMain runAction:[CCActionSequence actions:myEase, myEase2, nil]];
                
                [self touchStopped];
                
//                NSLog(@"BOOTM ANIMATION");
                
            }
            //Down
            break;
            
            
        case 2:
            //left
            
            
            
            break;
            
        default:
            break;
    }
    
    
}


-(void) update:(CCTime)delta{
    
//    if(rustyEye.position.x >= 0.7){
//        rustyEye.position = ccp(0.7, rustyEye.position.y);
//        rustyAppleEye.position = ccp(0.2, rustyAppleEye.position.y);
//    }
//    
//    if(rustyEye.position.x <= -0.7){
//        rustyEye.position = ccp(-0.7, rustyEye.position.y);
//        rustyAppleEye.position = ccp(-0.2, rustyAppleEye.position.y);
//        
//    }
    

    
}


@end
