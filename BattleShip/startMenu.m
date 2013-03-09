//
//  HelloWorldLayer.m
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "AppDelegate.h"
#import "startMenu.h"
#import "mainMenu.h"
#import "SimpleAudioEngine.h"
#import "CDAudioManager.h"
#import "CocosDenshion.h"
#import "RootViewController.h"
// HelloWorldLayer implementation
@implementation startMenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	startMenuLayer *layer = [startMenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        //Get window size with CGSIZE
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        //Create and add background sprite.
		CCMenuItemImage *background = [CCMenuItemImage itemFromNormalImage:@"battleship_splash.jpg" selectedImage:@"battleship_splash.jpg"];
        background.position = CGPointMake(size.width/2, size.height/1.8);
		[self addChild: background];
        
        //Create Sprite to flash
        CCSprite *tapToContinue =[CCSprite spriteWithFile:@"tap-to-continue.png"];
        CCSprite *tapToContinueSelected =[CCSprite spriteWithFile:@"tap-to-continue.png"];
        
        //Create Menu Item With sprite
        CCMenuItemSprite *spriteItem = [CCMenuItemSprite itemFromNormalSprite:tapToContinue selectedSprite:tapToContinueSelected target:self selector:@selector(mainMenuButton:)];
        CCMenu *mainMenu = [CCMenu menuWithItems:spriteItem, nil];
        
        //Creat menu to hold sprite
        mainMenu.position = CGPointMake(size.width/2, size.height/7.8);
        
        //Creat action for sprite
        CCBlink *blink = [CCBlink actionWithDuration:40 blinks:20];
        [tapToContinue runAction:blink];
        
        //add menu to the child
        [self addChild:mainMenu];
        
        
        
        //Start BackGround Music
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"Empire_of_the_Gun_015_sec_preview.mp3"];
        
	}
	return self;
}



-(void)mainMenuButton:(id) sender{
    
    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFadeDown transitionWithDuration:1 scene:[mainMenuLayer node]]];
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
