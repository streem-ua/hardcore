//
//  FifteenItem.h
//  Hardcore
//
//  Created by Pete Streem on 4/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FifteenItem : NSObject <NSCoding>


@property NSNumber *isFifteenOpened;
@property NSNumber *isBossDefeated;

@property NSNumber *fifteenSecondsPassed;
@property NSNumber *fifteenMinutesPassed;
@property NSNumber *fifteenDeath;
@property NSNumber *fifteenMoves;

@property NSNumber *fifteenEtaSecondsPassed;
@property NSNumber *fifteenEtaMinutesPassed;
@property NSNumber *fifteenEtaDeath;
@property NSNumber *fifteenEtaMoves;



@property NSMutableArray *fifteenPositions;
@property NSMutableArray *fifteenPositionsShuffled;
@property NSNumber *currentFifteenLevel;





@property NSNumber *fifteenNumber;

@end
