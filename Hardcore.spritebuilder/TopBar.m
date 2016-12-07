//
//  TopBar.m
//  Hardcore
//
//  Created by Pete Streem on 11/16/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "TopBar.h"


@implementation TopBar


 
CCNode *myBar;
CCNodeColor *scissorRect;
float k;
int deathNum;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        k = 0.1;
        deathNum = 0;
        
    }
    return self;
}


-(void) didLoadFromCCB {
    
   
    
    myBar = [[CCNode alloc] init];
    [self addChild:myBar z:-5];
    
    scissorRect = [CCNodeColor nodeWithColor:[CCColor clearColor] width:110 height:50];
    [scissorRect setAnchorPoint:ccp(0,0.5f)];
    scissorRect.position = ccp(-60, scissorRect.position.y);
    
    CCClippingNode *scissor = [CCClippingNode clippingNodeWithStencil:scissorRect];
    [scissor setContentSize:self.contentSize];
    [scissor setPositionType:CCPositionTypeNormalized];
    
    [scissor setAlphaThreshold:0.0];
    

    [myBar addChild:scissor];
    CCSprite* spriteStencil = [CCSprite spriteWithImageNamed:@"zalivka.png"];
    spriteStencil.scale = .25;

    [scissor addChild:spriteStencil];
    
    
    
    myBar.position = ccp([CCDirector sharedDirector].viewSize.width - 63, -10);

    
    NSTimer *checkBar = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateHealthPosition) userInfo:nil repeats:YES];
    
    
}


-(void) updateHealthPosition {
    
    scissorRect.position = ccp(scissorRect.position.x-k, scissorRect.position.y);
    
    
}

-(void) updateTimerData: (NSString *)myStr {

    [self._fifteenTime setString:myStr];

}


-(void) updateDeath {
    
    deathNum++;
    [self._totalDeath setString:[NSString stringWithFormat:@"%d",deathNum]];
    scissorRect.position = ccp(scissorRect.position.x-5, scissorRect.position.y);
    
}


-(void) rustyMoveEnabled {
    scissorRect.position = ccp(scissorRect.position.x-5, scissorRect.position.y);
}



@end
