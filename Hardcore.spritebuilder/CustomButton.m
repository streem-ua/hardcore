//
//  CustomButton.m
//  Hardcore
//
//  Created by Admin on 12/02/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton


- (instancetype)init{
    
    
    return self;
    
}

- (void)touchBegan:(CCTouch*)touch withEvent:(CCTouchEvent*)event
{
    
    
    CGPoint touchLocation = [touch locationInWorld];
    
    
    if ([self.name isEqualToString:@"callMenu"]) {
        [self.delegate menuTouch];
        
    } else {
        
        if ([self.name isEqualToString:@"moveUp"]) {
            [self.delegate upTouch];
        }
        else {
            if (touchLocation.x > 90 && [self.name isEqual:@"moveLeftRight"]) {
                [self.delegate rightTouch];
            }
            else if (touchLocation.x < 85 && [self.name isEqual:@"moveLeftRight"]) {
                [self.delegate leftTouch];
            }
        }
        
        
    }
    
    //
    //NSLog(@"touch.x = %f", touchLocation.x);
    
    [self.delegate manageButtonTouchLight:touchLocation.x];
}


/*
 
 
 file 'os_types.h' has been modified since the precompiled header 'Prefix.pch.pch' was built
 
 
 */


- (void)touchMoved:(CCTouch*)touch withEvent:(CCTouchEvent*)event
{
    CGPoint touchLocation = [touch locationInWorld];
    if (touchLocation.x > 90 && [self.name isEqual:@"moveLeftRight"]) {
        [self.delegate rightTouch];
    }
    else if (touchLocation.x < 85 && [self.name isEqual:@"moveLeftRight"]) {
        [self.delegate leftTouch];
    }
    
    
//    NSLog(@"touch.x = %f", touchLocation.x);
    [self.delegate manageButtonTouchLight:touchLocation.x];
}
- (void)touchEnded:(CCTouch*)touch withEvent:(CCTouchEvent*)event
{
    if ([self.name isEqual:@"moveLeftRight"]) {
        
        [self.delegate stopTouch];
    
    } else if ([self.name isEqualToString:@"moveUp"]) {
     
//        [self.delegate ]
        
        [self.delegate buttonControllerSwitchJump];
        
    }
    
    //[self.delegate stopTouch];
}

@end
