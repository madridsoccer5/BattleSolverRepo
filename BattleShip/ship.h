//
//  ship.h
//  BattleShip
//
//  Created by Sean Lewis on 3/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ship : CCNode {
    
    //Where ship is located on the tile grid
    NSMutableArray *placementOnTiles;
    
    //how many hits on specific ship
    int hitsTaken;
    
    //length of the ship and
    int length;
    
    //Marking each ship as a different ship
    int shipIdentifier;
    
    //ship rotation
    BOOL rotated;
    
    //Sprite to add ships to an array
    CCSprite *sprite;
    
    //Original Location of the Ship
    CGPoint startingPosition;

}

- (id) initWithFile:(NSString*)filename;
- (id) initWithFile:(NSString*)file andDir:(int)dir overPoints:(NSMutableArray*)tiles;
- (BOOL) existsOnTile:(CGPoint)point;
- (BOOL) hasShipSunk;

@property (nonatomic, retain) NSMutableArray *placementOnTiles;
@property (nonatomic, retain) CCSprite* sprite;
@property int hitsTaken, length, shipIdentifier;
@property BOOL rotated;
@property CGPoint startingPosition;
@end
