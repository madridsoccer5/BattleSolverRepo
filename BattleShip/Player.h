//
//  Player.h
//  BattleShip
//
//  Created by Student on 3/13/13.
// Sean Lewis and Michael Graf
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ship.h"



@interface Player : NSObject
{
    ship *selectedShip;
    NSString *name;
    NSInteger *score;
    NSInteger *numCorr;
    NSInteger *numIncorr;
    Boolean *shipSunk;
    NSMutableArray *allShips;
}
@property (retain) ship *selectedShip;
@property (nonatomic, retain) NSMutableArray* allShips;
/*
@property NSString *name;
@property NSInteger *score;
@property NSInteger *numCorr;
@property NSInteger *numIncorr;
@property Boolean *shipsSunk;*/

-(id)PlayerInit;
-(id)PlayerInitWithName:(NSString *)playerName;
-(void)setName:(NSString *)playerName;
-(void)setScore:(NSInteger *)playerScore;
-(void)setNumCorr:(NSInteger *)playerNumCorr;
-(void)setNumIncorr:(NSInteger *)playerNumIncorr;
-(NSString*)getName;
-(NSInteger*)getScore;
-(NSInteger*)getNumCorr;
-(NSInteger*)getNumIncorr;
-(void)resetAll;
-(void)resetScore;
-(void)resetNumCorr;
-(void)resetAllButName;



@end
