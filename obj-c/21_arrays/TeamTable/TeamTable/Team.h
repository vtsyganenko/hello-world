//
//  Team.h
//  TeamTable
//
//  Created by Виталий Цыганенко on 27.01.2023.
//

#ifndef Team_h
#define Team_h

@interface Team : NSObject

+(void) addGameResultForTeam1: (Team*) team1 scored: (NSUInteger) scoredGoalsByTeam1
                     andTeam2: (Team*) team2 scored: (NSUInteger) scoredGoalsByTeam2;

@property (readonly, nonatomic) NSString* name;
@property (readonly, nonatomic) NSUInteger points;
@property (readonly, nonatomic) NSUInteger winResults;
@property (readonly, nonatomic) NSUInteger draftResults;
@property (readonly, nonatomic) NSUInteger lossResults;
@property (readonly, nonatomic) NSUInteger gamePlayed;
@property (readonly, nonatomic) NSUInteger scored;
@property (readonly, nonatomic) NSUInteger conceded;

-(instancetype) initWithName: (NSString*) nameVal;

-(NSString*) description;

-(NSComparisonResult) compareByName: (Team*) other;
-(NSComparisonResult) compareByPoints: (Team*) other;
// points, wins, goal scored - goal conceded
-(NSComparisonResult) compareByThreeRules: (Team*) other;

@end

#endif /* Team_h */
