//
//  main.m
//  TeamTable
//
//  Created by Виталий Цыганенко on 27.01.2023.
//

#import <Foundation/Foundation.h>

#import "Team.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray* league = [NSMutableArray array];
        
        [league addObject: [[Team alloc] initWithName:@"Spartak"] ];
        [league addObject: [[Team alloc] initWithName:@"Zenit"] ];
        [league addObject: [[Team alloc] initWithName:@"Dynamo"] ];
        [league addObject: [[Team alloc] initWithName:@"Volga"] ];
        [league addObject: [[Team alloc] initWithName:@"Amkar"] ];
        
        void (^printTeams)(NSMutableArray* array) =
            ^(NSMutableArray* array) {
                NSLog(@"   Team GP  W  D  L  +  - PTS");
                for(NSUInteger i=0; i<[array count]; ++i) {
                    NSLog(@"%@", array[i]);
                }
                NSLog(@" ");
            };
        
        NSLog(@"Before start:");
        // sort by team name
        [league sortUsingSelector:@selector(compareByName:)];
        printTeams(league);
        
        [Team addGameResultForTeam1:league[0] scored:3 andTeam2:league[1] scored:0];
        [Team addGameResultForTeam1:league[0] scored:1 andTeam2:league[2] scored:2];
        [Team addGameResultForTeam1:league[0] scored:2 andTeam2:league[3] scored:2];
        [Team addGameResultForTeam1:league[0] scored:0 andTeam2:league[4] scored:4];
        
        [Team addGameResultForTeam1:league[1] scored:0 andTeam2:league[0] scored:0];
        [Team addGameResultForTeam1:league[1] scored:2 andTeam2:league[2] scored:2];
        [Team addGameResultForTeam1:league[1] scored:1 andTeam2:league[3] scored:0];
        [Team addGameResultForTeam1:league[1] scored:2 andTeam2:league[4] scored:5];

        [Team addGameResultForTeam1:league[2] scored:2 andTeam2:league[0] scored:4];
        [Team addGameResultForTeam1:league[2] scored:0 andTeam2:league[1] scored:3];
        [Team addGameResultForTeam1:league[2] scored:1 andTeam2:league[3] scored:0];
        [Team addGameResultForTeam1:league[2] scored:4 andTeam2:league[4] scored:1];
        
        [Team addGameResultForTeam1:league[3] scored:3 andTeam2:league[0] scored:0];
        [Team addGameResultForTeam1:league[3] scored:3 andTeam2:league[1] scored:0];
        [Team addGameResultForTeam1:league[3] scored:0 andTeam2:league[2] scored:0];
        [Team addGameResultForTeam1:league[3] scored:3 andTeam2:league[4] scored:5];
        
        [Team addGameResultForTeam1:league[4] scored:1 andTeam2:league[0] scored:0];
        [Team addGameResultForTeam1:league[4] scored:1 andTeam2:league[1] scored:2];
        [Team addGameResultForTeam1:league[4] scored:0 andTeam2:league[2] scored:0];
        [Team addGameResultForTeam1:league[4] scored:3 andTeam2:league[3] scored:0];

        NSLog(@"After 8 games played:");
        printTeams(league);
        
        NSLog(@"Sort by points:");
        [league sortUsingSelector:@selector(compareByPoints:)];
        printTeams(league);
        
        NSLog(@"Need to take into account goal differences:");
        [league sortUsingSelector:@selector(compareByThreeRules:)];
        printTeams(league);
        
        [Team addGameResultForTeam1:league[0] scored:1 andTeam2:league[1] scored:1];
        [Team addGameResultForTeam1:league[2] scored:1 andTeam2:league[3] scored:4];
        [Team addGameResultForTeam1:league[3] scored:0 andTeam2:league[0] scored:9];
        
        NSLog(@"After several games, Dynamo and Volga have the same goal difference:");
        [league sortUsingSelector:@selector(compareByThreeRules:)];
        printTeams(league);
        
        NSLog(@"Compare by scored goals:");
        // use block-comparator
        [league sortUsingComparator:
            ^NSComparisonResult(id obj1, id obj2) {
            NSComparisonResult result = [obj1 compareByThreeRules:obj2];
            if(result == NSOrderedSame) {
                if([obj1 scored] > [obj2 scored])
                    return NSOrderedAscending;
                else if([obj1 scored] < [obj2 scored])
                    return NSOrderedDescending;
            }
            return result;
        }];
        printTeams(league);
        
    }
    return 0;
}
