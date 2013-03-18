//
//  Player.m
//  BattleShip
//
//  Created by Student on 3/13/13.
//
//

#import "Player.h"
#import "ship.h"


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
//set the name of the player
-(void)setName:(NSString *)playerName
{
    name = playerName;
}
//sets the score of the game
-(void)setScore:(NSInteger *)playerScore
{
    score = playerScore;
}
//set the number that are correct
-(void)setNumCorr:(NSInteger *)playerNumCorr
{
    numCorr = playerNumCorr;
}
//set the number incorrect
-(void)setNumIncorr:(NSInteger *)playerNumIncorr
{
    numIncorr = playerNumIncorr;
}
//get the name of the player
-(NSString*)getName
{
    return name;
}
//gets score of the game
-(NSInteger*)getScore
{
    return score;
}
//get the number correct
-(NSInteger*)getNumCorr
{
    return numCorr;
}
//get the number incorrect
-(NSInteger*)getNumIncorr
{
    return numIncorr;
}
//reset all of the attributes of Player
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
