//
//  LevelsModel.m
//  Hardcore
//
//  Created by Pete Streem on 11/10/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "LevelsModel.h"
#import "UIDeviceHardware.h"

@implementation LevelsModel



- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        UIDeviceHardware *uiDeviceHardware = [[UIDeviceHardware alloc] init];
        
        
        NSLog(@"deviceType = %@" , uiDeviceHardware.platformString);
        
        if([uiDeviceHardware.platformString isEqualToString:@"iPad 2 (GSM)"]){
            self.ifWeakDevice = YES;
        } else {
            self.ifWeakDevice = NO;
        }
        
        
        
        
        
    }
    return self;
}






-(NSString *) getLevelNameById: (int)levelId withActivePuzzleNumber:(int)activePuzzleNumber{
    
    NSString *levelName = @"";
    
    
    
    
    switch (levelId) {
        case 1:
            
            
            
            
            if(activePuzzleNumber == 1){
                
                
                levelName = @"newLevels/level3/level3";
                
            } else if(activePuzzleNumber == 4){
                
                levelName = @"newLevels/level30/level30";
                
            } else if(activePuzzleNumber == 3){
                
                levelName = @"newLevels/level8/level8";
                
            } else if(activePuzzleNumber == 2){
                
                levelName = @"newLevels/level28/level28";
                
            } else if(activePuzzleNumber == 5){
                
                levelName = @"newLevels/level13/level13";
                
            } else if(activePuzzleNumber == 6){
                
                levelName = @"newLevels/level10/level10";
                
            } else if(activePuzzleNumber == 7){
                
                levelName = @"newLevels/level52/level52";
                
            } else if(activePuzzleNumber == 8){
                
                levelName = @"newLevels/level41/level41";
                
            } else if(activePuzzleNumber == 9){
                
                levelName = @"newLevels/level55/level55";
                
            } else if (activePuzzleNumber == 10){
                
                levelName = @"newLevels/level59/level59";
                
                
            } else if (activePuzzleNumber == 11){
                
                
                levelName = @"newLevels/level15/level15";
                
                
            }
            
            
            
            break;
            
        case 2:
            
            
            
            if(activePuzzleNumber == 1){
                
                levelName = @"newLevels/level24/level24";
                
            } else if(activePuzzleNumber == 4){
                
                levelName = @"newLevels/level5/level5";
                
            } else if(activePuzzleNumber == 3){
                
                levelName = @"newLevels/level9/level9";
                
            } else if(activePuzzleNumber == 2){
                
                levelName = @"newLevels/level20/level20";
                
            } else if(activePuzzleNumber == 5){
                
                levelName = @"newLevels/level36/level36";
                
            } else if(activePuzzleNumber == 6){
                
                levelName = @"newLevels/level18/level18";
                
            } else if(activePuzzleNumber == 7){
                
                levelName = @"newLevels/level12/level12";
                
            } else if(activePuzzleNumber == 8){
                
                levelName = @"newLevels/level32/level32";
                
            } else if(activePuzzleNumber == 9){
                
                levelName = @"newLevels/level17/level17";
                
            } else if (activePuzzleNumber == 10){
                
                levelName = @"newLevels/level58/level58";
                
            } else if (activePuzzleNumber == 11){
                
                levelName = @"newLevels/level22/level22";
                
                
            }
            
            
            break;
            
        case 3:
            
            
            
            if(activePuzzleNumber == 1){
                
                levelName = @"newLevels/level4/level4";
                
            } else if(activePuzzleNumber == 4){
                
                levelName = @"newLevels/level53/level53";
                
            } else if(activePuzzleNumber == 3){
                
                levelName = @"newLevels/level11/level11";
                
            } else if(activePuzzleNumber == 2){
                
                levelName = @"newLevels/level19/level19";
                
            } else if(activePuzzleNumber == 5){
                
                levelName = @"newLevels/level25/level25";
                
            } else if(activePuzzleNumber == 6){
                
                levelName = @"newLevels/level38/level38";
                
            } else if(activePuzzleNumber == 7){
                
                levelName = @"newLevels/level43/level43";
                
            } else if(activePuzzleNumber == 8){
                
                levelName = @"newLevels/level26/level26";
                
            } else if(activePuzzleNumber == 9){
                
                levelName = @"newLevels/level56/level56";
                
            } else if (activePuzzleNumber == 10){
                
                levelName = @"newLevels/level57/level57";
                
            } else if (activePuzzleNumber == 11){
                

                levelName = @"newLevels/level23/level23";
                
            }
            
            
            break;
            
        case 4:
            
            
            
            if(activePuzzleNumber == 1){
                
                levelName = @"newLevels/level21/level21";
                
            } else if(activePuzzleNumber == 4){
                
                levelName = @"newLevels/level7/level7";
                
                
            } else if(activePuzzleNumber == 3){
                
                levelName = @"newLevels/level14/level14";
                
            } else if(activePuzzleNumber == 2){
                
                levelName = @"newLevels/level44/level44";
                
            } else if(activePuzzleNumber == 5){
                
                levelName = @"newLevels/level45/level45";
                
            } else if(activePuzzleNumber == 6){
                
                levelName = @"newLevels/level31/level31";
                
            } else if(activePuzzleNumber == 7){
                
                levelName = @"newLevels/level49/level49";
                
            } else if(activePuzzleNumber == 8){
                
                levelName = @"newLevels/level48/level48";
                
            } else if(activePuzzleNumber == 9){
                
                levelName = @"newLevels/level61/level61";
                
            } else if (activePuzzleNumber == 10){
                
                levelName = @"newLevels/level50/level50";
                
            } else if (activePuzzleNumber == 11){
                
                levelName = @"newLevels/level27/level27";
                
            }
            
            
            
            break;
            
        case 5:
            
            
            if(activePuzzleNumber == 1){
                
                levelName = @"newLevels/level46/level46";
                
            } else if(activePuzzleNumber == 4){
                
                levelName = @"newLevels/level16/level16";
                
            } else if(activePuzzleNumber == 3){
                
                levelName = @"newLevels/level40/level40";
                
            } else if(activePuzzleNumber == 2){
                
                levelName = @"newLevels/level2/level2";
                
            } else if(activePuzzleNumber == 5){
                
                levelName = @"newLevels/level47/level47";
                
            } else if(activePuzzleNumber == 6){
                
                levelName = @"newLevels/level1/level1";
                
            } else if(activePuzzleNumber == 7){
                
                levelName = @"newLevels/level35/level35";
                
            } else if(activePuzzleNumber == 8){
                
                levelName = @"newLevels/level29/level29";
                
            } else if(activePuzzleNumber == 9){
                
                levelName = @"newLevels/level51/level51";
                
            } else if (activePuzzleNumber == 10){
                
                levelName = @"newLevels/level39/level39";
                
            } else if (activePuzzleNumber == 11){
                

                levelName = @"newLevels/level6/level6";
                
            }
            
            
            break;
            
            
        case 6:
            
            
            if(activePuzzleNumber == 1){
                
                levelName = @"newLevels/level37/level37";
                
                
            } else if(activePuzzleNumber == 4){
                
                levelName = @"newLevels/level67/level67";
                
            } else if(activePuzzleNumber == 3){
                
                levelName = @"newLevels/level62/level62";
                
            } else if(activePuzzleNumber == 2){
                
                levelName = @"newLevels/level65/level65";
                
                
            } else if(activePuzzleNumber == 5){
                
                levelName = @"newLevels/level63/level63";
                
            } else if(activePuzzleNumber == 6){
                
                levelName = @"newLevels/level70/leve70";
                
            } else if(activePuzzleNumber == 7){
                
                levelName = @"newLevels/level60/level60";
                
            } else if(activePuzzleNumber == 8){
                
                levelName = @"newLevels/level54/level54";
                
            } else if(activePuzzleNumber == 9){
                
                levelName = @"newLevels/level64/level64";
                
            } else if (activePuzzleNumber == 10){
                
                levelName = @"newLevels/level33/level33";
                
            } else if (activePuzzleNumber == 11){
                

                levelName = @"newLevels/level66/level66";
                
            }
            
            
            break;
            
            
            
    }
    







    return levelName;
}



@end
