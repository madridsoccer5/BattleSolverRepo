//
//  Globals.m
//  BattleShip
//
//  Created by Student on 3/15/13.
//
//

#import "Globals.h"

@implementation Globals

//synthesize properties
@synthesize player1;
@synthesize player2;
static Globals *sharedGlobals = nil;

+(Globals *)sharedGlobals
{
    if(sharedGlobals == nil)
    {
        //if nil, then initialize class
        sharedGlobals = [[super allocWithZone:NULL] init];
       
        //initialize player variables
        sharedGlobals.player1 = [[Player alloc] init];
        sharedGlobals.player2 = [[Player alloc] init];
    }
    return sharedGlobals;
}

-(NSString*)testMeth
{
    [player1 setName:@"testName"];
    return player1.getName;
}

/*+(id)allocWithZone:(NSZone *)zone
{
    @synchronize(self)
    {
        if(sharedGlobals == nil)
        {
            sharedGlobals = [super allocWithZone:zone];
            return sharedGlobals;
        }
    }
    return nil;
}
- (id)copyWithZone:(NSZone *)zone
{
        return self;
}
- (id)retain
{
    return self;
}
- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}
- (void)release
{
//do nothing
}
- (id)autorelease
{
    return self;
}*/

@end
