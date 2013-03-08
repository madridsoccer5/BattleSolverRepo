//
//  mainMenu.h
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "mainMenu.h"
#import "startMenu.h"
#import "gridLayer.h"
#import "gameController.h"
#import "SimpleAudioEngine.h"
#import "CDAudioManager.h"
#import "CocosDenshion.h"
#import "CCAnimation.h"


@implementation mainMenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	mainMenuLayer *layer2= [mainMenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer2];
	
	// return the scene
	return scene;
}

-(id) init{
    
    if( (self=[super init])) {
        
        //Getting size of screen
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        
        //Grid Example
        CCMenuItemFont *grid = [CCMenuItemFont itemFromString:@"Grid" target:self selector:@selector(grid:)];
        [grid setFontName:@"American Typewriter"];
        [grid setFontSize:28];
        
        //add 1st player to menu
        CCMenuItemFont *onePlayer = [CCMenuItemFont itemFromString:@"1 Player" target:self selector:@selector(onePlayer:)];
        [onePlayer setFontName:@"American Typewriter"];
        [onePlayer setFontSize:28];
        
        //add 2nd player to menu
        CCMenuItemFont *twoPlayer = [CCMenuItemFont itemFromString:@"2 Player" target:self selector:@selector(twoPlayer:)];
        [twoPlayer setFontName:@"American Typewriter"];
        [twoPlayer setFontSize:28];
        
        //create Tutorial button
        CCMenuItemFont *tutorial = [CCMenuItemFont itemFromString:@"Tutorial" target:self selector:@selector(tutorial:)];
        [tutorial setFontName:@"American Typewriter"];
        [tutorial setFontSize:28];
        
        //back to main menu button
        CCMenuItemFont *mainMenu = [CCMenuItemFont itemFromString:@"Main Menu" target:self selector:@selector(startMenu:)];
        [mainMenu setFontName:@"American Typewriter"];
        [mainMenu setFontSize:28];
        
        //High Scores Button
        CCMenuItemFont *highScores = [CCMenuItemFont itemFromString:@"High Scores" target:self selector:@selector(highScores:)];
        [highScores setFontName:@"American Typewriter"];
        [highScores setFontSize:28];
        
        //Creat Grid menu
        CCMenu *gridMenu = [CCMenu menuWithItems:grid, nil];
        gridMenu.position = CGPointMake(size.width/2, size.height/1.5);
        [gridMenu alignItemsVertically];
        
        //Create High Scores Menu
        CCMenu *highScoresMenu = [CCMenu menuWithItems:highScores, nil];
        highScoresMenu.position = CGPointMake(size.width/2, size.height/9);
        [highScoresMenu alignItemsVertically];
        
        //Create Left menu
        CCMenu *leftMainMenu = [CCMenu menuWithItems: onePlayer, twoPlayer, nil];
        leftMainMenu.position = CGPointMake(size.width/3.8, size.height/4);
        [leftMainMenu alignItemsVertically];
        
        //Create Right Menu
        CCMenu *rightMainMenu = [CCMenu menuWithItems: tutorial, mainMenu, nil];
        rightMainMenu.position = CGPointMake(size.width/1.4, size.height/4);
        [rightMainMenu alignItemsVertically];
        
        //Create background sprite
        CCSprite *mainMenuBackground = [CCSprite spriteWithFile:@"battlshipbackground.png"];
        mainMenuBackground.position = CGPointMake(size.width/2, size.height/1.5);
        
        //add menus to view
        [self addChild:highScoresMenu];
        [self addChild:rightMainMenu];
        [self addChild:leftMainMenu];
        [self addChild:mainMenuBackground];
        [self addChild:gridMenu];
        
    }
	return self;
}

-(void)onePlayer:(id) sender{
    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFlipX transitionWithDuration:1 scene:[gridLayer node]]];
    
    UIView* view = [[CCDirector sharedDirector] openGLView];
    
    UIAlertView* myAlertView = [[UIAlertView alloc] initWithTitle: @"Player One" message:@"Player One" delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: @"OK", nil];
    [view addSubview: myAlertView];
    UITextField* myTextField = [[UITextField alloc] initWithFrame: CGRectMake(12.0, 45.0, 260.0, 25.0)];
    [myTextField setBackgroundColor: [UIColor whiteColor]];
    [myAlertView addSubview: myTextField];
    [myAlertView show];
    [myAlertView release];
    
    
    
}

-(void)twoPlayer:(id) sender{
    
    UIView* viewTwo = [[CCDirector sharedDirector] openGLView];
    
    UIAlertView* alertViewTwo = [[UIAlertView alloc] initWithTitle: @"Player Two" message:@"Player Two" delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles: @"OK", nil];
    [viewTwo addSubview: alertViewTwo];
    UITextField* textFieldTwo = [[UITextField alloc] initWithFrame: CGRectMake(12.0, 45.0, 260.0, 25.0)];
    [textFieldTwo setBackgroundColor: [UIColor whiteColor]];
    [alertViewTwo addSubview: textFieldTwo];
    [alertViewTwo show];
    [alertViewTwo release];
    
}

-(void)grid:(id) sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFlipX transitionWithDuration:1 scene:[gridLayer node]]];
    
}

-(void)tutorial:(id) sender{
    
}

-(void)startMenu:(id) sender{
    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFlipX transitionWithDuration:2 scene:[startMenuLayer node]]];
}

-(void) highScores:(id) sender{
    
}

@end
