//
//  ship.m
//  BattleShip
//
//  Created by Sean Lewis on 3/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ship.h"
#import "Globals.h"

@implementation ship

@synthesize placementOnTiles, hitsTaken, length, sprite, rotated, startingPosition, shipIdentifier;

+(id) init {
    self = [super init];
    return self;
}
-(id) initWithFile:(NSString*)filename{
    self = [super init];
    self.sprite = [CCSprite spriteWithFile:filename];
    self.length = self.sprite.boundingBox.size.width / TILESIZE;
    self.rotated = NO;
    self.placementOnTiles = [[NSMutableArray alloc] init];
    self.hitsTaken = 0;
    [self addChild:sprite];
    
    return self;
}

@end
