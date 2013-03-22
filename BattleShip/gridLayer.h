//
//  gridLayer.h
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "gameController.h"

@class gameController;

@interface gridLayer : CCLayer
{
    CCTMXTiledMap *tileMap;
    CCTMXLayer *layerOne;
    CCSprite * background;
    CCSprite * selSprite;
    NSMutableArray * movableSprites;
    CGPoint oldPos;
    gameController *instance;
}
+(CCScene *) sceneWithPlayer/*:(Player*)Player*/;
@property CGPoint oldPos;
@property (retain) gameController *instance;
@end
