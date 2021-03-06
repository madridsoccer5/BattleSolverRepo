//
//  gridLayer.m
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "gridLayer.h"
#import "mainMenu.h"
#import "Globals.h"


float offsetFraction=0;
int counter =0;

@implementation gridLayer
@synthesize instance;

+(CCScene *) sceneWithPlayer/*:(Player*)Player*/
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	gridLayer *layer= [gridLayer nodeWithPlayer/*:Player*/];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

+ (id) nodeWithPlayer/*:(Player*)Player*/{
    return [[[self alloc] initWithPlayer/*:Player*/] autorelease];
}

-(id) initWithPlayer/*:(Player*)Player*/ {
    
    if( (self=[super init])) {
        
        instance = [gameController getInstance];
        
        //Getting size of screen
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        //Go back Function
        CCMenuItemFont *main = [CCMenuItemFont itemFromString:@"Finshed Placing" target:self selector:@selector(continueGame:)];
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
        /*
        movableSprites = [[NSMutableArray alloc] init];
        NSArray *images = [NSArray arrayWithObjects:@"Carrier.png", @"bship4.jpg", @"CruiserShip.png", nil];
        for(int i = 0; i < images.count; ++i) {
            NSString *image = [images objectAtIndex:i];
            CCSprite *sprite = [CCSprite spriteWithFile:image];
            offsetFraction = offsetFraction+50;
            sprite.position = ccp(size.width/size.width+100, size.height/size.height+offsetFraction);
            [self addChild:sprite z:4];
            [movableSprites addObject:sprite];
            counter++;
        }
        */
        
        //Tile map test run?
        tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"gridLayer.tmx"];

        //log prints of different statuses
        NSLog(@"in gridlayer");
      
        NSLog(@"%d",[Globals sharedGlobals].player1.allShips.count);
        
        //init sprite array
        movableSprites = [[NSMutableArray alloc] init];
        
        //prints out the ships, adds sprites to movable sprites
        for (ship *selShip in [Globals sharedGlobals].player1.allShips){
            NSLog(@"Trying to Print in Gridlayer");
            [movableSprites addObject:selShip.sprite];
            [self addChild: selShip.sprite z:4];
        }
        NSLog(@"%d", movableSprites.count);
        
        //ADDING "player1 is placing" message on grid with some opacity
        NSMutableString *player1String = [Globals sharedGlobals].player1.getName;
        [player1String appendString:@" is Placing"];
        CCMenuItemFont *player1Message = [CCMenuItemFont itemFromString: player1String target:self selector:NULL];
        [player1Message setFontName:@"American Typewriter"];
        [player1Message setFontSize:32];
        CCMenu *placingMessage = [CCMenu menuWithItems:player1Message, nil];
        placingMessage.position = CGPointMake(size.width/2, 2 * (size.height/5));
        placingMessage.opacity = 100;
        //placingMessage.color = [CIColor];
        
        [self addChild: placingMessage z:4];
        [self addChild: dispRect z:2];
        [self addChild: mainMenu z:3];
        [self addChild: tileMap z:1];

        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
        
    }
	return self;
    
}
- (CGPoint) boundLayerPos:(CGPoint)newPos ofRect:(CGRect)tiledMap{
    NSLog(@"inBound is at %g, %g", newPos.x, newPos.y);
    //CGRect unionOf = CGRectUnion(window, selShip.sprite.boundingBox);
    CGPoint returnval = newPos;
    if (!CGRectContainsRect(tiledMap, selSprite.boundingBox) ||
        !CGRectContainsPoint(tiledMap, newPos)){ //outside of window
        if (selSprite.boundingBox.origin.x < tiledMap.origin.x) { //x is too low
            returnval.x = (selSprite) ? TILESIZE/2 : TILESIZE;
        }
        if (selSprite.boundingBox.origin.y < tiledMap.origin.y) { //y is too low
            returnval.y = (selSprite) ? TILESIZE : TILESIZE/2;
        }
        if (selSprite.boundingBox.origin.x + selSprite.boundingBox.size.width > tiledMap.size.width) { //x is high
            returnval.x = (selSprite) ? tiledMap.size.width - TILESIZE/2 : tiledMap.size.width - TILESIZE;
        }
        if (selSprite.boundingBox.origin.y + selSprite.boundingBox.size.height > tiledMap.size.height) { //y is high
            returnval.y = (selSprite) ? tiledMap.size.height - TILESIZE : tiledMap.size.height - TILESIZE/2;
        }
        returnval.x = abs(returnval.x);
        returnval.y = abs(returnval.y);
    }
    return returnval;
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

//gets starting positions and sends game to game controller
-(void)continueGame:(id) sender
{
    
    //sends game to gamecontroller
    [instance handleGame];
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
