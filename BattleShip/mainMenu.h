//
//  mainMenu.h
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Globals.h"
//#import "Player.h"

@interface mainMenuLayer: CCLayer {
    UITextField* myTextField1;
    UITextField* myTextField2;
    //Player *player1;
    //Player *player2;
}
+(CCScene *) scene;

@end
