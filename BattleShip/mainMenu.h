//
//  mainMenu.h
//  BattleShip
//
//  Created by Sean Lewis on 3/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"
#import "Globals.h"

@interface mainMenuLayer: CCLayer {
    //Player *player1;
    UITextField *myTextFieldPlayerOne, *myTextFieldPlayerTwo;
    
}
+(CCScene *) scene;

@end
