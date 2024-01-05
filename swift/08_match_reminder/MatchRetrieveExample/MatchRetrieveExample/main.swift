//
//  main.swift
//  MatchRetrieveExample
//
//  Created by Виталий Цыганенко on 14.10.2023.
//

import Foundation

// football Torpedo
let url = URL(string: "https://www.championat.com/football/_russia1d/tournament/5553/teams/244597/result/")!
// hockey Torpedo
//let url = URL(string: "https://www.championat.com/hockey/_superleague/tournament/5383/teams/241613/result/")!
// football Inter
//let url = URL(string: "https://www.championat.com/football/_italy/tournament/5529/teams/244241/result/")!
// basketball NN
//let url = URL(string: "https://www.championat.com/basketball/_vtbleague/tournament/5671/teams/248741/result/")!

struct Match {
    let homeTeam: String
    let awayTeam: String
    let date: String
    let time: String
    let tour: String?
    let result: String?
}

var dataReceived = false
var responseString: String? = nil

let task = URLSession.shared.dataTask(with: url) { data, _, error in
    //NSLog("got response for URL: \(url)")
    if error == nil {
        if let data = data {
            if let string = String(data:data, encoding:.utf8) {
                responseString = string
            } else {
                NSLog("response: error while creating HTML text")
            }
        } else {
            NSLog("response: no data")
        }
    } else {
        NSLog("repsonse error: \(String(describing: error))")
    }
    
    DispatchQueue.main.async { dataReceived = true }
}

task.resume()
NSLog("sent request")

while !dataReceived {
    RunLoop.current.run(mode: .default, before: .distantFuture)
}
NSLog("continue work")

if let response = responseString {
    
    // debug - print all lines
    //let lines = response.components(separatedBy: "\n")
    //for line in lines {
    //    print(line)
    //}
    

    var teamName: String? = nil
    
    if let beginOfTitleTag = response.range(of: "<title>") {
        if let endOfTitleTag = response.range(of: "</title>") {
            if beginOfTitleTag.upperBound < endOfTitleTag.lowerBound {
                let titleString = response[beginOfTitleTag.upperBound..<endOfTitleTag.lowerBound]
                
                if let index = titleString.firstIndex(of: "(") {
                    teamName = titleString[..<index].trimmingCharacters(in: .whitespaces)
                } else {
                    NSLog("error: title issue")
                }
            } else {
                NSLog("error: wrong bounds for title")
            }
        } else {
            NSLog("error: endOfTitleTag")
        }
    } else {
        NSLog("error: no beginOfTitleTag")
    }
    
    if let team = teamName {
        //print("team name:", team)
        
        var games = Array<String>()
        var dates = Array<String>()
        var results = Array<String>()
        var tours = Array<String>()
        
        let lines = response.components(separatedBy: "\n")
        for line in lines {
            // home & away
            if line.contains("stat-results__link") && line.contains(team) {
                
                let lineWithGame = line.trimmingCharacters(in: .whitespacesAndNewlines)
                if let begin = lineWithGame.range(of: "title=\""),
                   let end = lineWithGame.range(of: ", "),
                   begin.upperBound < end.lowerBound {
                    let game = lineWithGame[begin.upperBound..<end.lowerBound]
                    games.append(game.trimmingCharacters(in: .whitespaces))
                } else {
                    NSLog("issue with parsing game line:", lineWithGame)
                }
                
            }
            // date & time
            else if line.contains("stat-results__date-time _hidden-td") {
                
                let lineWithDate = line.trimmingCharacters(in: .whitespacesAndNewlines)
                if let begin = lineWithDate.range(of: "<td class=\"stat-results__date-time _hidden-td\">"),
                   let end = lineWithDate.range(of: "</td>"),
                   begin.upperBound < end.lowerBound {
                    let date = lineWithDate[begin.upperBound..<end.lowerBound]
                    dates.append(date.trimmingCharacters(in: .whitespaces))
                } else {
                    NSLog("issue with parsing date line:", lineWithDate)
                }
                
            }
            // result of game (ex. 2 : 1)
            else if line.range(of:"\\d : \\d", options:.regularExpression) != nil {
                let lineWithResult = line.trimmingCharacters(in: .whitespacesAndNewlines)
                if let end = lineWithResult.range(of: "</span>") {
                    let result = lineWithResult[..<end.lowerBound]
                    results.append(result.trimmingCharacters(in: .whitespaces))
                } else {
                    NSLog("issue with parsing result line:", lineWithResult)
                }
            }
            // tour number
            else if line.contains("stat-results__tour _hidden-td") {
                
                let lineWithTour = line.trimmingCharacters(in: .whitespacesAndNewlines)
                if let begin = lineWithTour.range(of: "<td class=\"stat-results__tour _hidden-td\">"),
                   let end = lineWithTour.range(of: "</td>"),
                   begin.upperBound < end.lowerBound {
                    let tour = lineWithTour[begin.upperBound..<end.lowerBound]
                    tours.append(tour.trimmingCharacters(in: .whitespaces))
                } else {
                    NSLog("issue with parsing date line:", lineWithTour)
                }
                
            }
        }
        
        // debug
        
        for game in games {
            //print(game)
        }
        
        for date in dates {
            //print(date)
        }
        
        for result in results {
            print(result)
        }
        
        for tour in tours {
            //print(tour)
        }
        
        //for (index, game) in games.enumerated() {
        //    print(index, game, dates[index])
        //}
        
        //for game in games {
        //    let data = game.components(separatedBy:" - ")
        //}
        
    } else {
        NSLog("error: team name is not retrieved")
    }

    
    
}

print("end")
