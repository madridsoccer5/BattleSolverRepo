//
//  gridLayer.m
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "gridLayer.h"
#import "mainMenu.h"


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
        
        //Tile map test run?
        tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"gridLayer.tmx"];
        CGPoint centerofScreen = CGPointMake(self.contentSizeInPixels.width/2, self.contentSizeInPixels.height/2);
        tileMap.positionInPixels = CGPointMake(centerofScreen.x - (tileMap.contentSizeInPixels.width/2), centerofScreen.y - (tileMap.contentSizeInPixels.height/3.3));
        [self addChild:mainMenu];
        [self addChild: tileMap];
        
    }
	return self;
}

-(void) mainMenu:(id) sender{
    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFadeDown transitionWithDuration:1 scene:[mainMenuLayer node]]];
}
@end
