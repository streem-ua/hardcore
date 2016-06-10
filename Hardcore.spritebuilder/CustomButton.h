//
//  CustomButton.h
//  Hardcore
//
//  Created by Admin on 12/02/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol CustomButtonProtocol
- (void)leftTouch;
- (void)rightTouch;
- (void)upTouch;
- (void)menuTouch;
-(void)stopTouch;
-(void)buttonControllerSwitchJump;
-(void)manageButtonTouchLight:(float)positionX;

@end

@interface CustomButton : CCSprite {
}

@property NSString* testName;
@property id<CustomButtonProtocol> delegate;

@end
