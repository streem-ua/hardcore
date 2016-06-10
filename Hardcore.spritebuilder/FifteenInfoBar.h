//
//  FifteenInfoBar.h
//  Hardcore
//
//  Created by Pete Streem on 4/21/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "FifteenItem.h"
#import "MainMenu.h"

@interface FifteenInfoBar : CCNode

-(void) startShow:(FifteenItem *)currentFifteenData andLevelId:(int)levelId;
-(void) startHide;

@property MainMenu *mainMenuDelegate;

@end
