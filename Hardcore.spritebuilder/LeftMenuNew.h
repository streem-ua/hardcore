//
//  LeftMenuNew.h
//  Hardcore
//
//  Created by Pete Streem on 11/21/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "GamePlay.h"

@interface LeftMenuNew : CCNode


@property GamePlay *gameplayParrentDelegate;
-(void) expandButtonClicked;

@end
