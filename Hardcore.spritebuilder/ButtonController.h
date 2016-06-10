//
//  ButtonController.h
//  Hardcore
//
//  Created by Pete Streem on 2/3/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface ButtonController : CCNode

-(void) triggerSpriteVisibility:(int)buttonId;

-(void) moveTouchLight:(float)positionX;

@end
