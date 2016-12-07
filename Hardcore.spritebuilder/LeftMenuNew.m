//
//  LeftMenuNew.m
//  Hardcore
//
//  Created by Pete Streem on 11/21/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "LeftMenuNew.h"

@implementation LeftMenuNew

BOOL expanded;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        expanded = NO;
        
        
    }
    return self;
}



-(void) didLoadFromCCB{
    
    
//    self.anchorPoint = ccp(0,0);
    
    self.position = ccp(-30, 384/2);
    
}


-(void) expandButtonClicked{
    NSLog(@"Expand left menu");
    
    CCActionMoveTo *moveAction;
    
    
    if(expanded){
    
        expanded = NO;
        moveAction = [CCActionMoveTo actionWithDuration:0.4 position:ccp(-30, 384/2)];
        
        
    } else {
        
        expanded = YES;
        moveAction = [CCActionMoveTo actionWithDuration:0.4 position:ccp(85, 384/2)];
        
    }
    
    id ease1 = [CCActionEaseInOut actionWithAction:moveAction rate:4];
    [self runAction:ease1];
    
}


-(void) exitToMain {
    
    NSLog(@"asdasdad");
    
    [self.gameplayParrentDelegate exitToMain];
}


@end
