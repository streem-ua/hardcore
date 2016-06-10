//
//  TypewriteTxt.h
//  Hardcore
//
//  Created by Pete Streem on 2/24/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Levels.h"

@interface TypewriteTxt : CCLabelBMFont {
    
}


@property (nonatomic, assign) float passPositionX;
@property (nonatomic, assign) float passPositionY;
@property (nonatomic, assign) BOOL pauseRusty;
@property (nonatomic, assign) float freezeRustyTime;
@property (nonatomic, assign) float showDelay;
@property (nonatomic, assign) float hideDelay;


@property (nonatomic, assign) int txtNumber;

@property Levels *levelDelegate;


@end
