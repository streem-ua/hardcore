//
//  ButtonController.m
//  Hardcore
//
//  Created by Pete Streem on 2/3/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "ButtonController.h"

@implementation ButtonController{
    CCSprite *idleSprite;
    CCSprite *leftSprite;
    CCSprite *rightSprite;
    CCSprite *jumpSpriteIdle;
    CCSprite *jumpSprite;
    
    CCSprite *touchSprite;
    
}




- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        CGSize viewSize = [[CCDirector sharedDirector] viewSize];
        
        
        
        idleSprite = [[CCSprite alloc] initWithImageNamed:@"standby.png"];
        leftSprite = [[CCSprite alloc] initWithImageNamed:@"leftclick.png"];
        rightSprite = [[CCSprite alloc] initWithImageNamed:@"rightclick.png"];
        touchSprite = [[CCSprite alloc] initWithImageNamed:@"vroven.png"];
        //touchSprite.visible = NO;
        
        
        idleSprite.anchorPoint = ccp(0,0);
        idleSprite.scaleX = 0.4;
        idleSprite.scaleY = 0.5;
        idleSprite.position = ccp(10, idleSprite.position.y);
        [self addChild:idleSprite];
        
        leftSprite.anchorPoint = ccp(0,0);
        leftSprite.scaleX = 0.4;
        leftSprite.scaleY = 0.5;
        leftSprite.position = idleSprite.position;
        leftSprite.visible = NO;
        [self addChild:leftSprite];
        
        
        rightSprite.anchorPoint = ccp(0,0);
        rightSprite.scaleX = 0.4;
        rightSprite.scaleY = 0.5;
        rightSprite.position = idleSprite.position;
        rightSprite.visible = NO;
        [self addChild:rightSprite];
        
        
        jumpSpriteIdle = [[CCSprite alloc] initWithImageNamed:@"jump1.png"];
        jumpSpriteIdle.anchorPoint = ccp(1,0);
        jumpSpriteIdle.scale = 0.5;
        jumpSpriteIdle.position = ccp(viewSize.width-10, 0);
        [self addChild:jumpSpriteIdle];
        
        jumpSprite = [[CCSprite alloc] initWithImageNamed:@"jump2.png"];
        jumpSprite.anchorPoint = ccp(1,0);
        jumpSprite.scale = 0.5;
        jumpSprite.visible = NO;
        jumpSprite.position = jumpSpriteIdle.position;
        [self addChild:jumpSprite];
        
        
        
        
        touchSprite.anchorPoint = ccp(0.5,0);
        touchSprite.scale = 0.5;
        touchSprite.position = ccp(idleSprite.position.x+idleSprite.boundingBox.size.width/2, idleSprite.position.y);
        [self addChild:touchSprite];
    
    }
    return self;
}

-(void) moveTouchLight:(float)positionX {
    
    
//    if(positionX < (idleSprite.contentSize.width/2-5) && positionX > 10){
//        touchSprite.position = ccp(positionX, touchSprite.position.y);
//        
//    }
    
}


-(void) triggerSpriteVisibility:(int)buttonId{
    
    
    switch (buttonId) {
        
        case 0:
            
            //Left
            idleSprite.visible = YES;
            leftSprite.visible = NO;
            rightSprite.visible = NO;
            
           
            
            
            break;

            
        case 1:
            
            //Left
            idleSprite.visible = NO;
            rightSprite.visible = NO;
            leftSprite.visible = YES;
            
            break;
            
        case 2:
            
            //Right
            idleSprite.visible = NO;
            leftSprite.visible = NO;
            rightSprite.visible = YES;
            break;
            
        case 3:
            
            //Up
            jumpSpriteIdle.visible = NO;
            jumpSprite.visible = YES;
            
            break;
        
        case 4:
            
            jumpSpriteIdle.visible = YES;
            jumpSprite.visible = NO;
            
            break;
            
        default:
            break;
    }
    
    
}


@end
