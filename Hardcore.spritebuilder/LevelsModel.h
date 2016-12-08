//
//  LevelsModel.h
//  Hardcore
//
//  Created by Pete Streem on 11/10/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevelsModel : NSObject


-(NSString *) getLevelNameById: (int)levelId withActivePuzzleNumber:(int)activePuzzleNumber;


@property BOOL ifWeakDevice;

@end
