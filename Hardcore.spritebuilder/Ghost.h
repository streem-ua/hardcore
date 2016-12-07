//
//  Ghost.h
//  Hardcore
//
//  Created by Pete Streem on 9/22/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Ghost : CCNode




-(void) makeGhostAppear;
-(void) toggleVisible:(CGPoint)startPoint;
-(void) makeGhostDissapear;


@end
