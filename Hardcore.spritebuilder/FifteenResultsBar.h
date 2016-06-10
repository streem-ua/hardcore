//
//  FifteenResultsBar.h
//  Hardcore
//
//  Created by Pete Streem on 3/29/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Fifteen.h"

@interface FifteenResultsBar : CCNode







@property int fifteenTimeMinutes;
@property int fifteenTimeSeconds;
@property int fifteenMoves;
@property int fifteenDeath;


@property Fifteen *fifteenDelegate;
//@property Fifteen *fifteenDelegate;


-(void) updateTime:(int)minutes andSeconds:(int)seconds;
-(void) startAnimation:(int)currentFifteenId;


@end
