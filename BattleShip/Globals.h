//
//  Globals.h
//  BattleShip
//
//  Created by Student on 3/15/13.
//
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Globals : NSObject
{
    //global variables
    Player * player1;
    Player * player2;
}
//properties to be accessed outside of class
@property (nonatomic, retain) Player * player1;
@property (nonatomic, retain) Player * player2;

//method that makes sure only one instance of globals
+(Globals *)sharedGlobals;

//methods that can be called outside of class
-(NSString*)testMeth;

@end
