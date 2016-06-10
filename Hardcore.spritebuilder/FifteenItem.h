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

// все таки нужно нскодинг )

//Есть класс FifteenItem в котором будет хранится минимальная информация
//За сколько игрок прошел по времени, по ходам и по смертям
//В идеале эти классы хранить в DefaultUser, но я так понял что это вообще бред собачий и лучше просто хранить там параметры
// хранить в дефюзерс норм в данном случае, просто тебе надо хранить более комплексный объект
// fifteenItem -- это новый объект, верно? который ты хочешь сохраняьт
// да, только что создал
// ок, отлично
// первое -- нельзя сохранять примитивные типы, только объекты, меняем твой следующим образом
// везде делай nsnumber *
//ok
// теперь просто попробуем его сохранить, проверим
//а именно:

//@"1" : [открыта ли пятнашка BOOL, минуты затраченые (int), секунды затраченые(int), к-во смтей и т.д.],

//прочти)
//


@end
