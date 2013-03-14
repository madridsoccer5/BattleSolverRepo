//
//  Player.m
//  BattleShip
//
//  Created by Student on 3/13/13.
//
//

#import "Player.h"

@implementation Player

-(id)PlayerInitWithName:(NSString *)playerName
{
    if( (self=[super init]))
    {        
        [self setName:playerName];
        score = 0;
        numCorr = 0;
        numIncorr = 0;
    }
    return self;
}

-(id)PlayerInit
{
    if( (self=[super init]))
    {
        score = 0;
        numCorr = 0;
        numIncorr = 0;
    }
    return self;
}
-(void)setName:(NSString *)playerName
{
    name = playerName;
}
-(void)setScore:(NSInteger *)playerScore
{
    score = playerScore;
}
-(void)setNumCorr:(NSInteger *)playerNumCorr
{
    numCorr = playerNumCorr;
}
-(void)setNumIncorr:(NSInteger *)playerNumIncorr
{
    numIncorr = playerNumIncorr;
}
-(NSString*)getName
{
    return name;
}
-(NSInteger*)getScore
{
    return score;
}
-(NSInteger*)getNumCorr
{
    return numCorr;
}
-(NSInteger*)getNumIncorr
{
    return numIncorr;
}
-(void)resetAll;
{
    name = NULL;
    score = 0;
    numCorr = 0;
    numIncorr = 0;
}
-(void)resetScore;
{
    score = 0;
}
-(void)resetNumCorr;
{
    numCorr = 0;
    numIncorr = 0;

}
-(void)resetAllButName;
{
    score = 0;
    numCorr = 0;
    numIncorr = 0;

}

@end
