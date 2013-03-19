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
    //[self addChild:sprite];
    
    return self;
}

- (id) initWithFile:(NSString*)file andDir:(int)dir overPoints:(NSMutableArray*)tiles {
    self = [super init];
    self.sprite = [CCSprite spriteWithFile:file];
    self.length = self.sprite.boundingBox.size.width / TILESIZE;
    self.rotated = (dir == 1) ? YES : NO;
    self.placementOnTiles = tiles;
    NSLog(@"Has length %d and dir %d,", length, dir);
    //[self printLocation];
    self.hitsTaken = 0;
    [self addChild:sprite];
    int x, y;
    CGPoint tile = [[placementOnTiles objectAtIndex:0] CGPointValue];
    switch (rotated){ //unpack tiles, store in onTiles, set position
        case NO:
            x = tile.x * TILESIZE + TILESIZE;
            y = (9 - tile.y) * TILESIZE + TILESIZE/2 - TILESIZE;
            NSLog(@"%d, %d", (int)x, (int)y);
            break;
        case YES:
            [sprite runAction:[CCRotateBy actionWithDuration:0.0 angle:-90.0]];
            x = tile.x * TILESIZE + TILESIZE/2;
            y = (9 - tile.y) * TILESIZE - TILESIZE;
            NSLog(@"%d, %d", (int)x, (int)y);
            break;
    }
    sprite.position = ccp(x, y);
    return self;
}
@end
