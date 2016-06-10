//
//  LeftMenu.m
//  Hardcore
//
//  Created by Pete Streem on 2/4/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "LeftMenu.h"
#import "CCColor+HexString.h"


@implementation LeftMenu{
    
    
    CCNodeColor *backGroundNode;
    CCNode *textData;
    
    CCLabelTTF *youTxt;
    CCLabelTTF *hintTxt;

    
    CCNode *gradientBg;
    
    float currentPercentValue;
}



- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.fifteentutorialhighlight = [CCBReader load:@"fifteen/tutorialFifHighlight"];
        
        
        
        gradientBg = [CCBReader load:@"RightMenu/gradientBg"];
        gradientBg.position = ccp(-gradientBg.boundingBox.size.width, 0);
        [self addChild:gradientBg];
        
        
        backGroundNode = [[CCNodeColor node] initWithColor:[CCColor colorWithRed:0.21 green:0.18 blue:0.31 alpha:0.75] width:150 height:384];
        //R - 21 G - 18 B - 31 и 75 процентов опасити
        backGroundNode.anchorPoint = ccp(1, 0);
        
        [self addChild:self.fifteentutorialhighlight];
        self.fifteentutorialhighlight.position = ccp(-113, 213);
        
        [self addChild:backGroundNode];
        self.leftMenuEnabled = NO;
        
        

        
        textData = [CCBReader load:@"LeftMenu"];
        textData.position = ccp(-75, textData.position.y);
        [self addChild:textData];
        
        youTxt = [[CCLabelTTF alloc] init];
        youTxt = (CCLabelTTF *)[textData getChildByName:@"_youTxt" recursively:NO];
        
        hintTxt = [[CCLabelTTF alloc] init];
        hintTxt = (CCLabelTTF *)[textData getChildByName:@"_hintTxt" recursively:NO];
        
        
        youTxt.fontColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
        youTxt.shadowColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
        youTxt.shadowBlurRadius = 3;
        
        hintTxt.fontColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
        hintTxt.shadowColor = [CCColor colorWithCcColor3b:ccc3(105, 80, 207)];
        hintTxt.shadowBlurRadius = 3;
        
        
//        _hintTxt.fontColor = self.gameplayParrentDelegate.myFontColor;
//        _hintTxt.shadowColor = self.gameplayParrentDelegate.myFontColor;
//        _hintTxt.shadowBlurRadius = 3;
        
      
        
    }
    return self;
}

-(void) didLoadFromCCB{
    
    
    
}


-(void) setupData:(CCSprite *)originalFifteen withCurrentFifteen:(CCSprite *)currentFifteen{
    
    
//    CCSprite *newCurrentFifteen  = [CCSprite spriteWithTexture:[currentFifteen texture]];
    
    
    
    
    [backGroundNode removeChildByName:@"originalFifteen" cleanup:YES];
    [backGroundNode removeChildByName:@"shuffleFifteen" cleanup:YES];
    
    CCSprite *origFifteen = originalFifteen;
    
    origFifteen.name = @"originalFifteen";
    origFifteen.position = ccp(-2, -40);
    
    [backGroundNode addChild:origFifteen];
    
    
    int contentScale = 0;
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]
        && [[UIScreen mainScreen] scale] >= 2.0) {
        // Retina
        contentScale = 4;
    } else {
        // Not Retina
        contentScale = 2;
    }
    
    UIImage *img = [self screenshotWithStartNode:currentFifteen];
    CCTexture *test = [[CCTexture alloc] initWithCGImage:img.CGImage contentScale:contentScale];
    CCSprite *sprite = [CCSprite spriteWithTexture:test];
    
    sprite.name = @"shuffleFifteen";
    
    sprite.position = ccp(backGroundNode.position.x+77, backGroundNode.position.y+250);
    
    [backGroundNode addChild:sprite];
    
}



-(UIImage*) screenshotWithStartNode:(CCNode*)stNode
{
    [CCDirector sharedDirector].nextDeltaTimeZero = YES;
    
    CGSize winSize = [[CCDirector sharedDirector] viewSize];
    CCRenderTexture* renTxture =
    [CCRenderTexture renderTextureWithWidth:winSize.width
                                     height:winSize.height];
    [renTxture begin];
    [stNode visit];
    [renTxture end];
    
    
    return [renTxture getUIImage];
    
}

-(void) makeMovement:(CGPoint)mytouchPoint{
    
    
    
    
    
    if(mytouchPoint.x < 150){
        
        self.position = ccp(mytouchPoint.x, 0);
    
    } else {
   
    
    }
    
    
}


-(void) update:(CCTime)delta{
    float onePercentValue = 150.0/100.0;
    currentPercentValue = self.position.x/onePercentValue;
    gradientBg.position = ccp(-150-512+512.0/100.0 * currentPercentValue, 0);
}


-(void) finishMovement:(int)direction{
    
    CCActionMoveTo *moveMenu;
    
    if(direction == 1){
        //Back
        moveMenu = [CCActionMoveTo actionWithDuration:0.2 position:ccp(0, 0)];
        self.leftMenuEnabled = NO;
        [self.gameplayParrentDelegate resumeGamePlayScene];
    } else if(direction ==2){
        //forward
        moveMenu = [CCActionMoveTo actionWithDuration:0.2 position:ccp(150, 0)];
        self.leftMenuEnabled = YES;
        [self.gameplayParrentDelegate pauseGamePlayScene];
        
    }
    
    [self runAction:moveMenu];
    
}

-(void) totalHide:(int)direction{
    CCActionMoveTo *moveMenu;
    
    if(direction == 1){
        //Back
        moveMenu = [CCActionMoveTo actionWithDuration:0.2 position:ccp(0, 0)];
        self.leftMenuEnabled = NO;
    } else if(direction ==2){
        //forward
        moveMenu = [CCActionMoveTo actionWithDuration:0.2 position:ccp(150, 0)];
        self.leftMenuEnabled = YES;
        
    }
    
    [self runAction:moveMenu];
}


-(void) moveTutorialHighlight:(CGPoint) myPoint{
    
    
    CGPoint newPoint = ccp(-330+myPoint.x, 57+myPoint.y);
    
    CCActionMoveTo *moveHighlightTutorial = [CCActionMoveTo actionWithDuration:1 position:newPoint];
    [self.fifteentutorialhighlight runAction:moveHighlightTutorial];
}


@end
