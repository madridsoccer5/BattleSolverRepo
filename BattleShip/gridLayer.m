//
//  gridLayer.m
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "gridLayer.h"
#import "mainMenu.h"
#import "Player.h"
extern const int TILESIZE;
extern const int MAXWIDTH;
extern const int MAXHEIGHT;
float offsetFraction=0;
int counter =0;

@implementation gridLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	gridLayer *layer3= [gridLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer3];
	
	// return the scene
	return scene;
}

-(id) init{
    
    if( (self=[super init])) {
        
        //Getting size of screen
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        //Go back Function
        CCMenuItemFont *main = [CCMenuItemFont itemFromString:@"Main Menu" target:self selector:@selector(mainMenu:)];
        [main setFontName:@"American Typewriter"];
        [main setFontSize:28];
        
        //Creat Grid menu
        CCMenu *mainMenu = [CCMenu menuWithItems:main, nil];
        mainMenu.position = CGPointMake(size.width/2, size.height/5);
        [mainMenu alignItemsVertically];
        
        //display container for ships
        CCSprite* dispRect = [CCSprite spriteWithFile:@"shipcontainer.png"];
        dispRect.position = CGPointMake(size.width/2, size.height/5);
        
        //All Three Ships
        movableSprites = [[NSMutableArray alloc] init];
        NSArray *images = [NSArray arrayWithObjects:@"CruiserShip.png", @"CruiserShip.png", @"Carrier.png", nil];
        for(int i = 0; i < images.count; ++i) {
            NSString *image = [images objectAtIndex:i];
            CCSprite *sprite = [CCSprite spriteWithFile:image];
            offsetFraction = offsetFraction+50;
            sprite.position = ccp(size.width/size.width+100, size.height/size.height+offsetFraction);
            [self addChild:sprite z:4];
            [movableSprites addObject:sprite];
            counter++;
        }
        
        
        //Tile map test run?
        tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"gridLayer.tmx"];
        CGPoint centerofScreen = CGPointMake(self.contentSizeInPixels.width/2, self.contentSizeInPixels.height/1.8);
        tileMap.positionInPixels = CGPointMake(centerofScreen.x - (tileMap.contentSizeInPixels.width/2), centerofScreen.y - (tileMap.contentSizeInPixels.height/1.8));
        
        [self addChild: dispRect z:2];
        [self addChild: mainMenu z:3];
        [self addChild: tileMap z:1];
        
        //TESTING GLOBALS PLAYER CLASS by displaying contents of getName()
        NSLog([Globals sharedGlobals].player1.getName);
        NSLog([Globals sharedGlobals].player2.getName);

        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
        
    }

	return self;
    
}
- (CGPoint) boundLayerPos:(CGPoint)newPos ofRect:(CGRect)tiledMap{
    NSLog(@"inBound is at %g, %g", newPos.x, newPos.y);
    //CGRect unionOf = CGRectUnion(window, selShip.sprite.boundingBox);
    CGPoint retval = newPos;
    if (!CGRectContainsRect(tiledMap, selSprite.boundingBox) ||
        !CGRectContainsPoint(tiledMap, newPos)){ //outside of window
        if (selSprite.boundingBox.origin.x < tiledMap.origin.x) { //x is too low
            retval.x = (selSprite) ? TILESIZE/2 : TILESIZE;
        }
        if (selSprite.boundingBox.origin.y < tiledMap.origin.y) { //y is too low
            retval.y = (selSprite) ? TILESIZE : TILESIZE/2;
        }
        if (selSprite.boundingBox.origin.x + selSprite.boundingBox.size.width > tiledMap.size.width) { //x is high
            retval.x = (selSprite) ? tiledMap.size.width - TILESIZE/2 : tiledMap.size.width - TILESIZE;
        }
        if (selSprite.boundingBox.origin.y + selSprite.boundingBox.size.height > tiledMap.size.height) { //y is high
            retval.y = (selSprite) ? tiledMap.size.height - TILESIZE : tiledMap.size.height - TILESIZE/2;
        }
        retval.x = abs(retval.x);
        retval.y = abs(retval.y);
    }
    return retval;
}


- (CGPoint) snapSpriteToGrid:(CGPoint)endPoint{
    int x = (int)selSprite.position.x;
    int y = (int)selSprite.position.y;
    CGPoint oldPostion = CGPointMake(x,y);
    if (!CGPointEqualToPoint(oldPostion, endPoint)){
        int x = (int)endPoint.x % TILESIZE;
        int y = (int)endPoint.y % TILESIZE;
        
        endPoint.x = (x > TILESIZE/2) ? endPoint.x - x + TILESIZE : endPoint.x - x;
        endPoint.y = endPoint.y - y + TILESIZE/2;
        
        oldPostion = ccp(endPoint.x, endPoint.y);
        return endPoint;
    }
    else {
        return selSprite.position = oldPostion;
    }
}

- (void)selectSpriteForTouch:(CGPoint)touchLocation {
    CCSprite * newSprite = nil;
    for (CCSprite *sprite in movableSprites) {
        if (CGRectContainsPoint(sprite.boundingBox, touchLocation)) {
            newSprite = sprite;
            break;
        }
        
    }
    if (newSprite != selSprite) {
        [selSprite stopAllActions];
        selSprite = newSprite;
    }

}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    [self selectSpriteForTouch:touchLocation];
    return TRUE;
}
- (void)panForTranslation:(CGPoint)translation {
    if (selSprite) {
        CGPoint newPos = ccpAdd(selSprite.position, translation);
        selSprite.position = newPos;
    }
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    [self panForTranslation:translation];
}
- (void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    
    selSprite.position = [self boundLayerPos:selSprite.position ofRect:tileMap.boundingBox];
    selSprite.position = [self snapSpriteToGrid:selSprite.position];
   
}

-(void) mainMenu:(id) sender{
    offsetFraction =0;
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFadeDown transitionWithDuration:1 scene:[mainMenuLayer node]]];

}

- (void) dealloc
{
    [movableSprites release];
    movableSprites = nil;

	[super dealloc];
}
@end
