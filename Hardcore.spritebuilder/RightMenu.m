//
//  Rusty.m
//  Untitled
//
//  Created by Admin on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "RightMenu.h"
#import "CCColor+HexString.h"

@implementation RightMenu{
    
    CCNodeColor *backGroundNode;
    
    CCNode *_content;
    
    CCLabelTTF *_timeTxt;
    CCLabelTTF *_bestTimeTxt;
    CCLabelTTF *_deathTxt;
    
    CCNode *gradientBg;
    float currentPercentValue;
    
    int levelSeconds;
    int levelMinutes;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        gradientBg = [CCBReader load:@"RightMenu/gradientBg"];
        gradientBg.rotation = 180;
//        gradientBg.anchorPoint = ccp(0, 0);
        //gradientBg.position = ccp(gradientBg.boundingBox.size.width, 0);
        
        gradientBg.position = ccp([[CCDirector sharedDirector] viewSize].width, [[CCDirector sharedDirector] viewSize].height);
        [self addChild:gradientBg];
        
        
        
        backGroundNode = [[CCNodeColor node] initWithColor:[CCColor colorWithRed:0.21 green:0.18 blue:0.31 alpha:0.75] width:150 height:384];
        [self addChild:backGroundNode];
        self.rightMenuEnabled = NO;
        
      
        
        levelSeconds = 0;
        levelMinutes = 0;
        
        
        
        
        
    }
    return self;
}

- (void)didLoadFromCCB {
    
    _content.position = ccp(75, 0);
//    _content.visible = NO;
    
    
    //_timeTxt.fontColor = [CCColor colorWithHexString:@"#6950CF"];
    
    
//    _timeTxt.fontColor = [CCColor colorWithHexString:@"#112233"];
//    _timeTxt.fontColor = [CCColor colorWithRed:0.105 green:0.80 blue:0.207];
    
    _timeTxt.fontColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
    _timeTxt.shadowColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
    _timeTxt.shadowBlurRadius = 3;
    
    
    
    _bestTimeTxt.fontColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
    _bestTimeTxt.shadowColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
    _bestTimeTxt.shadowBlurRadius = 3;
    
    _deathTxt.fontColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
    _deathTxt.shadowColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
    _deathTxt.shadowBlurRadius = 3;

    
    NSTimer *gameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showTime:) userInfo:nil repeats:YES];
    [_timeTxt setString:@"00:00"];
    
    
    [self updateData];
}

-(void)showTime:(NSTimer *)sender
{
    if(!self.rightMenuEnabled && !self.leftMenuDelegate.leftMenuEnabled){
        
        levelSeconds++;
        if (levelSeconds == 60)
        {
            levelSeconds = 0;
            levelMinutes++;
            
        }
    }
    
    
    NSString *_myStr = [NSString stringWithFormat:@"%02i:%02i", levelMinutes, levelSeconds];
    [_timeTxt setString:_myStr];
    
}


-(void) makeMovement:(CGPoint)mytouchPoint{
    
    if(mytouchPoint.x > ([[CCDirector sharedDirector] viewSize].width - 150)){
        self.position = ccp(mytouchPoint.x, 0);
    } else {
        //self.rightMenuEnabled = YES;
    }
    
    
}


-(void) update:(CCTime)delta{
    
    float onePercentValue = 150.0/100.0;
    currentPercentValue = ([[CCDirector sharedDirector] viewSize].width-self.position.x)/onePercentValue;
    gradientBg.position = ccp(150+[[CCDirector sharedDirector] viewSize].width-512.0/100.0 * currentPercentValue, [[CCDirector sharedDirector] viewSize].height);
    
    
}

-(void) updateData {
    NSString *_deathStr = [NSString stringWithFormat:@"Death: %i", self.gameplayParrentDelegate.rustyDeathNum];
    [_deathTxt setString:_deathStr];
}

-(void) exitToMain{
    
    [self.gameplayParrentDelegate exitToMain];
    //NSLog(@"asd");
    
    
}

-(void) finishMovement:(int)direction{
    
    CCActionMoveTo *moveMenu;
    
    if(direction == 1){
        //Back
        moveMenu = [CCActionMoveTo actionWithDuration:0.2 position:ccp([[CCDirector sharedDirector] viewSize].width, 0)];
        self.rightMenuEnabled = NO;
        [self.gameplayParrentDelegate resumeGamePlayScene];
        
    } else if(direction ==2){
        //forward
        moveMenu = [CCActionMoveTo actionWithDuration:0.2 position:ccp([[CCDirector sharedDirector] viewSize].width-150, 0)];
        self.rightMenuEnabled = YES;
        [self.gameplayParrentDelegate pauseGamePlayScene];
        
    }
    
    [self runAction:moveMenu];
    
}

-(void) totalHide:(int)direction{
    CCActionMoveTo *moveMenu;
    
    if(direction == 1){
        //Back
        moveMenu = [CCActionMoveTo actionWithDuration:0.2 position:ccp([[CCDirector sharedDirector] viewSize].width, 0)];
        self.rightMenuEnabled = NO;
    } else if(direction ==2){
        //forward
        moveMenu = [CCActionMoveTo actionWithDuration:0.2 position:ccp([[CCDirector sharedDirector] viewSize].width-150, 0)];
        self.rightMenuEnabled = YES;
        
    }
    
    [self runAction:moveMenu];
}


@end
