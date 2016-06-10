//
//  TypewriteTxt.m
//  Hardcore
//
//  Created by Pete Streem on 2/24/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "TypewriteTxt.h"

@implementation TypewriteTxt {
    
    BOOL ifRustyPassed;
    CCLabelBMFont *_txt;
   
    CCNode *handTapRight;
    CCNode *handTapLeft;
    CCNode *handSwipeRight;
    CCNode *handSwipeLeft;
    CCNode *arrow1;
    CCNode *arrow2;
    CCNode *deathTxt;
    
//    CCNode *arrow3;
//    CCNode *light;
    
   
    BOOL txtEnabled;
    BOOL leftTxtEnabled;
    BOOL leftRightDone;
    
    BOOL leftSwipeEnabled;
    BOOL leftSwipeDone;
    
    BOOL rightSwipeEnabled;
    BOOL rightSwipeDone;
    
    BOOL descriptionEnabled;
    BOOL descriptionEnabledDone;
    
    BOOL jumpTxtEnabled;
    BOOL jumpTxtDone;
    BOOL doubleJumpTxtEnabled;
    
    BOOL jumpTxtHide;
    BOOL jumpHighEnabled;
    BOOL jumpHighDone;
    BOOL portalTxtEnabled;
    
    BOOL firstTxtEnabled;
    
    
    BOOL level2FirstTxtEnabled;
    BOOL level2FirstTxtDone;
    
    BOOL level2SecondTxtEnabled;
    BOOL level2SecondTxtDone;
    BOOL level2ThirdTxtEnabled;
    
    BOOL level3FirstTxtEnabled;
    BOOL level3SecondTxtEnabled;
    BOOL level3FirstTxtDone;
    
    BOOL level3ThirdTxtEnabled;
    
    BOOL level4FirstTxtEnabled;
    
    BOOL level5FirstTxtEnabled;
    BOOL level5SecondTxtEnabled;
    
   
    BOOL deathTxtTriger;
    
    BOOL rightTxtEnabled;
    
    
}





- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        
        
        txtEnabled = NO;
        leftTxtEnabled = NO;
        leftRightDone = NO;
        leftSwipeEnabled = NO;
        leftSwipeDone = NO;
        
        rightSwipeEnabled = NO;
        rightSwipeDone = NO;
        jumpTxtEnabled = NO;
        descriptionEnabled = NO;
        descriptionEnabledDone = NO;
        jumpTxtDone = NO;
        
        jumpHighEnabled = NO;
        jumpHighDone = NO;
        portalTxtEnabled = NO;
        doubleJumpTxtEnabled = NO;
        
        firstTxtEnabled = NO;
        
        level2FirstTxtEnabled = NO;
        
        level2FirstTxtDone = NO;
        
        level2SecondTxtEnabled = NO;
        level2SecondTxtDone = NO;
        level2ThirdTxtEnabled = NO;
        
        level3SecondTxtEnabled = NO;
        level3FirstTxtDone = NO;
        
        level3ThirdTxtEnabled = NO;
        
        level4FirstTxtEnabled = NO;
        
        level5FirstTxtEnabled = NO;
        
        level5SecondTxtEnabled = NO;
        
        
        
        
        
    }
    
    return self;
}

-(void) didLoadFromCCB{
    ifRustyPassed = NO;
    
    
    
    
//    NSLog(@"self.name = %@", self.name);
    
    
    //NSLog(@"")
    
//    if (self.passPositionX > 0 || self.passPositionY > 0) {
//        
//        
//        
//        
//    } else {
//        
//        
//        [self enableTimers];
//        
//        
//        
//    }
    self.visible = false;
    
    
    
    
  
    
    
    
    
    
    
    switch (self.txtNumber) {
        
        case 1:
            
            
            deathTxt = [CCBReader load:@"tutorialAnimatios/dead"];
            deathTxt.position = ccp(100, 150);
            deathTxt.visible = NO;
            [self addChild:deathTxt];
            
            self.visible = true;
//            [self enableTimers];
            
            break;
            
        case 2:
            
           
            if(self.txtNumber == 2)
            {
//                NSTimer *myTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(showTxt) userInfo:nil repeats:NO];
                
            }
    
            break;
            
        case 21:
            
            deathTxt = [CCBReader load:@"tutorialAnimatios/dead"];
            deathTxt.position = ccp(100, 28);
            deathTxt.visible = NO;
            [self addChild:deathTxt];
            
            break;
            
        case 31:
            
            deathTxt = [CCBReader load:@"tutorialAnimatios/dead"];
            deathTxt.position = ccp(359, 150);
            deathTxt.visible = NO;
            [self addChild:deathTxt];
            
            break;
            
        case 41:
            
            deathTxt = [CCBReader load:@"tutorialAnimatios/dead"];
            deathTxt.position = ccp(390, 190);
            deathTxt.visible = NO;
            [self addChild:deathTxt];
            
            break;
            
        case 51:
            
            deathTxt = [CCBReader load:@"tutorialAnimatios/dead"];
            deathTxt.position = ccp(150, 225);
            deathTxt.visible = NO;
            [self addChild:deathTxt];
            
            
            break;
            
                   
        default:
            break;
    }
    
    
    

}


-(void) showTxt {

    switch (self.txtNumber) {
            
        case 1:
            
            
            break;
            
        case 2:
            
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            self.visible = YES;
            [self enableTimers];
            
            break;
            
        
        default:
            break;
    }
    
}






-(void) update:(CCTime)delta{
    
    
    if(self.levelDelegate.gameplayParrentDelegate.rustyDeadFirstTime && self.levelDelegate.gameplayParrentDelegate.rustyIsDead && !deathTxtTriger && !self.levelDelegate.gameplayParrentDelegate.rustyDeadFirstTimeGlobal){
        
        
        self.levelDelegate.gameplayParrentDelegate.rustyDeadFirstTimeGlobal = YES;
        
        switch (self.txtNumber) {
                
            case 1:
                
                
                
                deathTxtTriger = YES;
                deathTxt.visible = YES;
                [deathTxt.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
                [deathTxt.animationManager runAnimationsForSequenceNamed:@"timeline"];
                
                NSLog(@"DEAD DEAD DEAD Level 1");
                
                break;
                
           
                
            case 21:
                
                deathTxtTriger = YES;
                deathTxt.visible = YES;
                [deathTxt.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
                [deathTxt.animationManager runAnimationsForSequenceNamed:@"timeline"];
                
                NSLog(@"DEAD DEAD DEAD Level 2");
                
                break;
                
            case 31:
                
                deathTxtTriger = YES;
                deathTxt.visible = YES;
                [deathTxt.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
                [deathTxt.animationManager runAnimationsForSequenceNamed:@"timeline"];
                
                NSLog(@"DEAD DEAD DEAD Level 3");
                
                break;
                
            case 41:
                
                deathTxtTriger = YES;
                deathTxt.visible = YES;
                [deathTxt.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
                [deathTxt.animationManager runAnimationsForSequenceNamed:@"timeline"];
                
                NSLog(@"DEAD DEAD DEAD Level 4");
                
                break;
                
            case 51:
                
                deathTxtTriger = YES;
                deathTxt.visible = YES;
                [deathTxt.animationManager jumpToSequenceNamed:@"timeline" time:0.0];
                [deathTxt.animationManager runAnimationsForSequenceNamed:@"timeline"];
                
                NSLog(@"DEAD DEAD DEAD Level 5");
                
                break;
                
                
            default:
                break;
        }

        
        
    
    }
    
    
 

    
     if(self.txtNumber == 1 && !firstTxtEnabled && !self.levelDelegate.rightFirstPressed){
       
         
         firstTxtEnabled = YES;
         self.levelDelegate.allowRustyMoveTutorial = NO;
         [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
         
         NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
         NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
         
         self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = NO;
         
         
     }
    
    if(self.txtNumber == 2 && !self.levelDelegate.rightFirstPressed && !rightTxtEnabled && self.levelDelegate.lastWordAppear){
        
        self.levelDelegate.allowRustyMoveTutorial = NO;
        
        rightTxtEnabled = YES;
        
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        
        self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = NO;
        
        
    }
    
    
    if(self.levelDelegate.rightFirstPressed){
        
        if(!txtEnabled){
            if(self.txtNumber == 2){
                
                self.levelDelegate.allowRustyMoveTutorial = NO;
                
                 NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(trigerRustyDead) userInfo:nil repeats:NO];
                
                self.levelDelegate.lastWordAppear = NO;
                
                txtEnabled = YES;
                self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = NO;
                NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
                
                handTapRight.visible = NO;
                
            }
            
        }
        
    }
    
    
    if(self.txtNumber == 3 && self.levelDelegate.lastWordAppear){
        
        if(self.levelDelegate.rightFirstPressed && !leftTxtEnabled){
            
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            
            self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = NO;
            
//            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
            
            self.levelDelegate.allowRustyMoveTutorial = NO;
            
            leftTxtEnabled = YES;
            self.visible = YES;
            
//            [self enableTimers];0
            
            NSLog(@"Dance dance dance - 1");
            
        }
    }
    
    
    if(self.levelDelegate.rightFirstPressed && self.levelDelegate.leftFirstPressed){
        
        
        if(self.txtNumber == 3 && !leftRightDone){
                leftRightDone = YES;
                    NSLog(@"Dance dance dance - 2");
                [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            
                self.levelDelegate.allowRustyMoveTutorial = NO;
            
                NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
                handTapLeft.visible = NO;
                self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = YES;
        }
    }
    
    
    
    if(self.levelDelegate.rightFirstPressed && self.levelDelegate.leftFirstPressed && self.levelDelegate.lastWordAppear){
    
        if(self.txtNumber == 4 && !leftSwipeEnabled){
            
            self.levelDelegate.allowRustyMoveTutorial = NO;
            self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = YES;
            
            leftSwipeEnabled = YES;
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            self.visible = YES;
            [self enableTimers];
        }
        
        
    
    }
    
    
    if(self.levelDelegate.leftMenuFirstStart){
        
        if(self.txtNumber == 4 && !leftSwipeDone){
        
            
            
            leftSwipeDone = YES;
            NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
            handSwipeRight.visible = NO;
            self.levelDelegate.leftMenuFirstClosed = NO;
            self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = NO;
            
        
        }
        
        if(self.txtNumber == 5 && !descriptionEnabled){
            
            descriptionEnabled = YES;
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
            
            self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = NO;
            
            //NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:self.hideDelay target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
            
        }
        
    }
    
    
    if(self.levelDelegate.leftMenuFirstStart && self.levelDelegate.leftMenuFirstClosed){
        
        if(self.txtNumber == 5 && !descriptionEnabledDone){
            descriptionEnabledDone = YES;
            self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = NO;
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
            
            
        }
        
        if(self.txtNumber == 6 && !rightSwipeEnabled){
            rightSwipeEnabled = YES;
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
            
        }
    
    }
    
    
    
    if(self.levelDelegate.rightMenuFirstStart){
        
        if(self.txtNumber == 6 && !rightSwipeDone){
            rightSwipeDone = YES;
            handSwipeLeft.visible = NO;
            NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
            
        }
        
        if(self.txtNumber == 7 && !jumpTxtEnabled){
            jumpTxtEnabled = YES;
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            self.levelDelegate.allowRustyMoveTutorial = YES;
            
            self.levelDelegate.inv_wall.physicsBody.sensor = YES;
            
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
            
        }
        
    }
    
    
    
    if(self.levelDelegate.firstDoubleJump && self.levelDelegate.gameplayParrentDelegate.rusty.position.x > 200){
        
        if(self.txtNumber == 7 && !jumpTxtHide){
            jumpTxtHide = YES;
            NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
            arrow1.visible = NO;
        }
        
        
        if(self.txtNumber == 8 && !jumpTxtDone){
            jumpTxtDone = YES;
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
            NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
            
            
            
            self.levelDelegate.allowRustyMoveTutorial = NO;
            
        }
        
        if(self.txtNumber == 81 && !doubleJumpTxtEnabled){
            doubleJumpTxtEnabled = YES;
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
            NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
            
            self.levelDelegate.allowRustyMoveTutorial = NO;
            
        }

        
    }
    
    
    if(self.levelDelegate.gameplayParrentDelegate.rusty.position.x > 300 && self.levelDelegate.gameplayParrentDelegate.rusty.position.x < 350){
        
        
        if(self.txtNumber == 9 && !jumpHighEnabled){
            jumpHighEnabled = YES;
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
     
            self.levelDelegate.allowRustyMoveTutorial = NO;
        }
        
    }
    
    if(self.levelDelegate.gameplayParrentDelegate.rusty.position.x > 370){
        if(self.txtNumber == 9 && !jumpHighDone){
            jumpHighDone = YES;
            arrow2.visible = NO;
            NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        }
        if(self.txtNumber == 10 && !portalTxtEnabled){
            portalTxtEnabled = YES;
            [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
            NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
            
        }
    }
    
    
    
    
    
    
    
    if(self.txtNumber == 21 && !level2FirstTxtEnabled){
        level2FirstTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        
    }
    
    
    
    if(self.txtNumber == 21 && self.levelDelegate.portalFirstReached && !level2FirstTxtDone){
       
        level2FirstTxtDone = YES;
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        arrow2.visible = NO;
    }
    
    
    if(self.levelDelegate.gameplayParrentDelegate.rusty.position.y > 250 && !level2SecondTxtEnabled && self.txtNumber == 22){
        level2SecondTxtEnabled = YES;
        self.levelDelegate.arrow1.visible = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];

     
        
    }
    
    if(self.txtNumber == 22 && self.levelDelegate.gameplayParrentDelegate.rusty.position.x < 430 && self.levelDelegate.gameplayParrentDelegate.rusty.position.y > 250 && !level2SecondTxtDone){
        level2SecondTxtDone = YES;
//        self.levelDelegate.arrow1.visible = NO;
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(hideSpikeLight:) userInfo:_txt repeats:NO];

    }
    
    
    if(self.txtNumber == 23 && self.levelDelegate.gameplayParrentDelegate.rusty.position.x < 244 && self.levelDelegate.gameplayParrentDelegate.rusty.position.y > 200 && !level2ThirdTxtEnabled){
        level2ThirdTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
    }
    
    
    
    
    if(self.txtNumber == 31 && !level3FirstTxtEnabled){
        level3FirstTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        
        self.levelDelegate.gameplayParrentDelegate.rustyIsDead = YES;
        
    }
    
    if(self.txtNumber == 31 && self.levelDelegate.leftMenuFirstStart && !level3FirstTxtDone){
        
        level3FirstTxtDone = YES;
        handSwipeRight.visible = NO;
        
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        
        
        
    }
    
    
    
    if(self.txtNumber == 32 && self.levelDelegate.leftMenuFirstStart && !level3SecondTxtEnabled){
        self.levelDelegate.leftMenuFirstClosed = NO;
        level3SecondTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        
    }
    
    
    
    if(self.txtNumber == 33 && self.levelDelegate.leftMenuFirstClosed && self.levelDelegate.leftMenuFirstStart && !level3ThirdTxtEnabled){
     
        self.levelDelegate.arrow1.visible = YES;
        
        self.levelDelegate.gameplayParrentDelegate.rustyIsDead = NO;
        level3ThirdTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        
        
        NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(hideSpikeLight:) userInfo:_txt repeats:NO];
        
        
    }
    
    
    if(self.txtNumber == 34 && self.levelDelegate.gameplayParrentDelegate.rusty.position.y < 200 && !level2ThirdTxtEnabled) {
        level2ThirdTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        
        
    }
    
    if(self.txtNumber == 42 && !level2ThirdTxtEnabled && self.levelDelegate.gameplayParrentDelegate.rusty.position.y < 215){
        level2ThirdTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        
        
    }
        
    
    
    if(self.txtNumber == 41 && !level4FirstTxtEnabled){
        level4FirstTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        
        
    }
    
    
    
    if(self.txtNumber == 51 && !level5FirstTxtEnabled && self.levelDelegate.rightPortallFirstReached){
        
        level5FirstTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        
    }
    
    
    
    if(self.txtNumber == 52 && !level5SecondTxtEnabled && self.levelDelegate.gameplayParrentDelegate.firstTutorialWin){
        self.visible = YES;
        level5SecondTxtEnabled = YES;
        [self.animationManager runAnimationsForSequenceNamed:@"timeline"];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
        
    } else if(self.txtNumber == 52 && !level5SecondTxtEnabled && !self.levelDelegate.gameplayParrentDelegate.firstTutorialWin){
        self.visible = NO;
    }
    
    
    
}



-(void) enableTimers{
    
    
    
    //if(self.showDelay > 0){
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.showDelay target:self selector:@selector(animateTextDelay:) userInfo:_txt repeats:NO];
    //}
    
    if(self.hideDelay > 0.5){
        NSLog(@"self.hideDelay = %f", self.hideDelay);
        NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:self.hideDelay target:self selector:@selector(animateHideTextDelay:) userInfo:_txt repeats:NO];
    }
}


-(void) animateTextDelay:(NSTimer*)theTimer {
    self.levelDelegate.lastWordAppear = NO;
    self.visible = YES;
    [self animateText:[theTimer userInfo]];
}

-(void) animateText:(CCLabelBMFont *)myTxt{
    
    
    if(myTxt){
        myTxt.visible = YES;
        float delay = 0.0;
       
        int i=0;
        int numberChildren = [[myTxt children] count];
        
        for (CCNode *letter in myTxt.children) {
            
            letter.opacity = 0;
            
            i++;
            delay += 0.03;
            
            
            
            
            
            if(numberChildren == i){
                
                CCActionCallFunc *callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(lastWordAppearTrigger)];
                [letter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:delay], [CCActionFadeIn actionWithDuration:0.3], callFunc, nil]];
                //последняя буква исчезает
                
            } else {
                [letter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:delay], [CCActionFadeIn actionWithDuration:0.3], nil]];
            }
            
            
            
        }
        
        
        
    }
}


-(void) lastWordAppearTrigger {
    if(self.txtNumber == 2){
        self.levelDelegate.allowRustyMoveTutorial = YES;
    }
    
    if(self.txtNumber == 9){
        self.levelDelegate.allowRustyMoveTutorial = YES;
    }
    
    if(self.txtNumber == 5){
        self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = YES;
    }
    
}

-(void) lastWordHideTrigger{
    self.levelDelegate.lastWordAppear = YES;
    self.levelDelegate.allowRustyMoveTutorial = YES;
    
    if(self.txtNumber == 5){
        self.levelDelegate.gameplayParrentDelegate.allowRightLeftMenu = YES;
    }
    
}



-(void) animateHideTextDelay:(NSTimer*)theTimer {
    [self animateHideText:(CCLabelBMFont*)[theTimer userInfo]];
}

-(void) animateHideText:(CCLabelBMFont *)myTxt{
    
    if(myTxt){
        
        float delay = 0.0;
        
        int i=0;
        int numberChildren = [[myTxt children] count];
        
        
        
        for (CCNode *letter in myTxt.children) {
            
            delay += 0.03;
            
            i++;
            
            if(numberChildren == i){
                
                CCActionCallFunc *callFunc = [CCActionCallFunc actionWithTarget:self selector:@selector(lastWordHideTrigger)];
                [letter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:delay], [CCActionFadeOut actionWithDuration:0.3], callFunc, nil]];
                
                //последняя буква исчезает
                
            } else {
                [letter runAction:[CCActionSequence actions:[CCActionDelay actionWithDuration:delay], [CCActionFadeOut actionWithDuration:0.3], nil]];
            }
            
            
            
        }
        
        
    }
}

-(void) hideSpikeLight:(NSTimer*)theTimer{
    self.levelDelegate.arrow1.visible = NO;
}

-(void) trigerRustyDead{
    
    self.levelDelegate.allowRustyMoveTutorial = YES;
    
    
}

@end
