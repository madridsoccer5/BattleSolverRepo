//
//  gameController.m
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "gameController.h"


@implementation gameController
@synthesize /*player, player2, winner,*/ tileMap, layerOne, placementCounter, turns/*, mode*/;


+(gameController*) getInstance
{
    static gameController* instance;
    @synchronized(self){
        if (!instance){
            instance = [[gameController alloc] init];
            instance.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"gridLayer.tmx"];
            instance.layerOne = [instance.tileMap layerNamed:@"Tile Layer 1"];
         //   instance.player = [Player initWithName:@"Player 1" andLayer:instance.layerOne];
         //   instance.player2 = [RoboPlayer initWithName:@"Player 2" andLayer:instance.layerOne];
        //    instance.winner = nil;
         //   instance.mode = tutorial;
            instance.placementCounter = 0; instance.turns = 0;
        }
        return instance;
    }
}


@end
