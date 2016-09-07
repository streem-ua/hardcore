//
//  BossStory.m
//  Hardcore
//
//  Created by Pete Streem on 7/12/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "BossStory.h"

@implementation BossStory





-(void) didLoadFromCCB{
    
    
    
}


-(void) _goToBossClicked{
    
    
//    NSLog(@"self.newLevelId = %i", self.newLevelId);
    
    [self.gameplayParrentDelegate removeBossStory];
    [self.gameplayParrentDelegate startGameWithLevel:self.newLevelId withString:@"bossLevel"];
    
}

@end



