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
@interface gameController :NSObject{
    Player *playerOne, *playerTwo;
    CCTMXTiledMap *tileMap;
    CCTMXLayer *layerOne;
    
}

@end
