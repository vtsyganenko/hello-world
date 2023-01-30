//
//  Team.m
//  TeamTable
//
//  Created by Виталий Цыганенко on 27.01.2023.
//

#import <Foundation/Foundation.h>

#import "Team.h"

@implementation Team

@synthesize name;
@synthesize points;
@synthesize winResults;
@synthesize draftResults;
@synthesize lossResults;
@synthesize gamePlayed;
@synthesize scored;
@synthesize conceded;

+(void) addGameResultForTeam1: (Team*) team1 scored: (NSUInteger) scoredGoalsByTeam1
                     andTeam2: (Team*) team2 scored: (NSUInteger) scoredGoalsByTeam2 {
    if([team1.name compare:team2.name] == NSOrderedSame)
        return;
    
    if(scoredGoalsByTeam1 > scoredGoalsByTeam2) {
        [team1 increaseWinResults];
        [team2 increaseLossResults];
    }
    else if(scoredGoalsByTeam1 == scoredGoalsByTeam2) {
        [team1 increaseDraftResults];
        [team2 increaseDraftResults];
    }
    else {
        [team1 increaseLossResults];
        [team2 increaseWinResults];
    }
    
    [team1 increaseScored:scoredGoalsByTeam1];
    [team1 increaseConceded:scoredGoalsByTeam2];
    [team2 increaseScored:scoredGoalsByTeam2];
    [team2 increaseConceded:scoredGoalsByTeam1];
}

-(instancetype) initWithName: (NSString*) nameVal {
    if(self = [super init]) {
        name = [NSString stringWithString:nameVal];
    }
    return self;
}

-(instancetype) init {
    return [self initWithName:@"NoName"];
}

-(NSString*) description {
    return [NSString stringWithFormat:@"%7s %2lu %2lu %2lu %2lu %2lu %2lu %2lu", [self.name UTF8String],
            self.gamePlayed,
            self.winResults,
            self.draftResults,
            self.lossResults,
            self.scored,
            self.conceded,
            self.points
    ];
}

-(void) increaseWinResults {
    winResults = winResults + 1;
    gamePlayed = gamePlayed + 1;
    points = points + 3;
}

-(void) increaseDraftResults {
    draftResults = draftResults + 1;
    gamePlayed = gamePlayed + 1;
    points = points + 1;
}

-(void) increaseLossResults {
    lossResults = lossResults + 1;
    gamePlayed = gamePlayed + 1;
}

-(void) increaseScored: (NSUInteger) scoredGoals {
    scored = scored + scoredGoals;
}

-(void) increaseConceded: (NSUInteger) concededGoals {
    conceded = conceded + concededGoals;
}

-(NSComparisonResult) compareByName: (Team*) other {
    return [self.name compare: other.name];
}

-(NSComparisonResult) compareByPoints: (Team*) other {
    if(self.points > other.points)
        return NSOrderedAscending;
    else if(self.points == other.points)
        return NSOrderedSame;
    else
        return NSOrderedDescending;
}

-(NSComparisonResult) compareByThreeRules: (Team*) other {
    if(self.points > other.points)
        return NSOrderedAscending;
    else if(self.points < other.points)
        return NSOrderedDescending;
    
    // points are same
    
    if(self.winResults > other.winResults)
        return NSOrderedAscending;
    else if(self.winResults < other.winResults)
        return NSOrderedDescending;
    
    // winResults are same
    
    NSInteger selfDifference = self.scored - self.conceded;
    NSInteger otherDifference = other.scored - other.conceded;
    if(selfDifference > otherDifference)
        return NSOrderedAscending;
    else if(selfDifference < otherDifference)
        return NSOrderedDescending;
    
    return NSOrderedSame;
}

@end
