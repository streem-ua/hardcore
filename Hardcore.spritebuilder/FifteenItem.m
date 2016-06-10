//
//  FifteenItem.m
//  Hardcore
//
//  Created by Pete Streem on 4/20/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "FifteenItem.h"
#define kN 3
#define kM 3

@implementation FifteenItem


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    
        self.isFifteenOpened = @NO;
        
        self.fifteenSecondsPassed = @0;
        self.fifteenMinutesPassed = @0;
        self.fifteenDeath = @0;
        self.fifteenMoves = @0;
        
        self.fifteenEtaSecondsPassed = @0;
        self.fifteenEtaMinutesPassed = @0;
        self.fifteenEtaDeath = @0;
        self.fifteenEtaMoves = @0;
        
        self.currentFifteenLevel = @1;
        
        
        
        NSMutableArray *tmpArray;
        tmpArray = [NSMutableArray arrayWithCapacity:25];
        
        for (int col=0; col<5; col++) {
            
            
            for (int row=0; row<5; row++) {
                
                float tstFloat = 0;
                
                if(col == 0 || col == 4){
                    tstFloat = -1;
                }
                
                if(row == 0 || row == 4){
                    tstFloat = -1;
                }
                
                
                [tmpArray addObject:[NSNumber numberWithFloat:tstFloat]];
            }
            
        }
        self.fifteenPositions = [NSMutableArray arrayWithArray:tmpArray];
        self.fifteenPositionsShuffled = [NSMutableArray arrayWithArray:tmpArray];

        
        //NSLog(@"myArray = %@", myArray);
        
        
        self.fifteenNumber = @0;
    
    
    }
    return self;
}
// так не должно быть ) чет я завтыкал ) сейчас найду

-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    
    [aCoder encodeObject:self.isFifteenOpened forKey:@"isFifteenOpened"];
    
    [aCoder encodeObject:self.fifteenSecondsPassed forKey:@"fifteenSecondsPassed"];
    [aCoder encodeObject:self.fifteenMinutesPassed forKey:@"fifteenMinutesPassed"];
    [aCoder encodeObject:self.fifteenDeath forKey:@"fifteenDeath"];
    [aCoder encodeObject:self.fifteenMoves forKey:@"fifteenMoves"];
    
    [aCoder encodeObject:self.fifteenEtaSecondsPassed forKey:@"fifteenEtaSecondsPassed"];
    [aCoder encodeObject:self.fifteenEtaMinutesPassed forKey:@"fifteenEtaMinutesPassed"];
    [aCoder encodeObject:self.fifteenEtaDeath forKey:@"fifteenEtaDeath"];
    [aCoder encodeObject:self.fifteenEtaMoves forKey:@"fifteenEtaMoves"];
    
    [aCoder encodeObject:self.fifteenNumber forKey:@"fifteenNumber"];
    
    
    [aCoder encodeObject:self.fifteenPositions forKey:@"fifteenPositions"];
    [aCoder encodeObject:self.fifteenPositionsShuffled forKey:@"fifteenPositionsShuffled"];
    [aCoder encodeObject:self.currentFifteenLevel forKey:@"currentFifteenLevel"];
    
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        
        
        self.isFifteenOpened = [aDecoder decodeObjectForKey:@"isFifteenOpened"];
        
        self.fifteenSecondsPassed = [aDecoder decodeObjectForKey:@"fifteenSecondsPassed"];
        self.fifteenMinutesPassed = [aDecoder decodeObjectForKey:@"fifteenMinutesPassed"];
        self.fifteenDeath = [aDecoder decodeObjectForKey:@"fifteenDeath"];
        self.fifteenMoves = [aDecoder decodeObjectForKey:@"fifteenMoves"];
        
        self.fifteenEtaSecondsPassed = [aDecoder decodeObjectForKey:@"fifteenEtaSecondsPassed"];
        self.fifteenEtaMinutesPassed = [aDecoder decodeObjectForKey:@"fifteenEtaMinutesPassed"];
        self.fifteenEtaDeath = [aDecoder decodeObjectForKey:@"fifteenEtaDeath"];
        self.fifteenEtaMoves = [aDecoder decodeObjectForKey:@"fifteenEtaMoves"];
        
        
        self.fifteenNumber = [aDecoder decodeObjectForKey:@"fifteenNumber"];
        
        self.fifteenPositions = [aDecoder decodeObjectForKey:@"fifteenPositions"];
        self.fifteenPositionsShuffled = [aDecoder decodeObjectForKey:@"fifteenPositionsShuffled"];
        self.currentFifteenLevel = [aDecoder decodeObjectForKey:@"currentFifteenLevel"];
        
        
    }
    return self;
}


@end
