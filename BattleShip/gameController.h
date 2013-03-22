//
//  gameController.h
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "Globals.h"
#import "gridLayer.h"
@interface gameController :NSObject{
    int placementCounter;
    int turns;
    
}

//@property (retain) Player *player, *player2, *winner;
@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *layerOne;
@property int placementCounter, turns;
//@property GameMode mode;
+(gameController *)getInstance;
//resets game
-(void)startOver;
//runs game
-(void)handleGame;

@end
