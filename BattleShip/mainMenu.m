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
#import "Player.h"

int playerCount = 0;
bool twoPlayers;
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
//UIAlertview for one player.
-(void)onePlayer:(id) sender{
    
    //TESTING PLAYER CLASS
    NSString *testName = @"Michael";
    NSInteger *testInt = 10;
    Player *testPlayer = [[Player alloc] PlayerInitWithName:testName];
    [testPlayer setScore:testInt];
    NSString *testString = testPlayer.getName;
    //NSInteger *testSetters = testPlayer.getScore;
    //  NSString *testSetters = [NSString stringWithFormat:@"%d", 12/*testPlayer.getScore*/];
    NSLog(testString);

    
    playerCount = 1;
    UIAlertView *playerOne = [[UIAlertView alloc] init];
	[playerOne setTitle:@"Player One"];
	[playerOne setMessage:@"player One"];
	[playerOne setDelegate:self];
	[playerOne addButtonWithTitle:@"Cancel"];
	[playerOne addButtonWithTitle:@"Confirm"];
    UITextField* myTextField = [[UITextField alloc] initWithFrame: CGRectMake(12.0, 45.0, 260.0, 25.0)];
    [myTextField setBackgroundColor: [UIColor whiteColor]];
    [playerOne addSubview:myTextField];
	[playerOne show];
	[playerOne release];
    

    
}
//This method creates an action for the UIAlert View. If button one "Cancel" is pressed
//nothing happens. If button two "Confirm" is pressed then add name to player one and go to
//placement layer.
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
    }
    
    if (buttonIndex == 1)
    {
        //if player count is one player
        if (playerCount == 1) {
            [[CCDirector sharedDirector]replaceScene:[CCTransitionFlipX transitionWithDuration:1 scene:[gridLayer scene]]];
            
        }
        //if player count is two player
        else if (playerCount == 2){
             [self performSelector:@selector(onePlayer:)];
            
        }
    }

}
//UiAlertview for two player
-(void)twoPlayer:(id) sender{
    playerCount =2;
    UIAlertView *playerOne = [[UIAlertView alloc] init];
	[playerOne setTitle:@"Player Two"];
	[playerOne setMessage:@"Player two"];
	[playerOne setDelegate:self];
	[playerOne addButtonWithTitle:@"Cancel"];
	[playerOne addButtonWithTitle:@"Confirm"];
    UITextField* myTextField = [[UITextField alloc] initWithFrame: CGRectMake(12.0, 45.0, 260.0, 25.0)];
    [myTextField setBackgroundColor: [UIColor whiteColor]];
    [playerOne addSubview:myTextField];
	[playerOne show];
	[playerOne release];

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
