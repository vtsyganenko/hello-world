
struct ChessPlayer {}

let playerOleg = ChessPlayer()
print( type(of:playerOleg) )

struct ChessPlayer1 {
    var name: String
    var victories: UInt
}

let playerHarry = ChessPlayer1.init(name: "Harry", victories: 30)
print(playerHarry)
let playerJoe = ChessPlayer1(name: "Joe", victories: 27)
print(playerJoe)

// default values
struct ChessPlayer2 {
    var name: String
    var victories: UInt = 0
}

var playerHarry2 = ChessPlayer2(name: "Harry")
print(playerHarry2)

// access to properties
print("Player name:", playerHarry2.name)
playerHarry2.victories += 1
print("Player victories:", playerHarry2.victories)

struct ChessPlayer3 {
    var name: String
    var victories: UInt
    init(name: String) {
        self.name = name    // if parameter has different name -> self is not needed
        victories = 0
    }
}

// this init is not available anymore
//var player3 = ChessPlayer3(name: "John", victories: 5)
//print(player3)
var player3 = ChessPlayer3(name: "John")
print(player3)

// VALUE TYPE
var player3copy = player3
print("player3", player3)
print("player3 copy", player3copy)
player3copy.victories = 5;
print("player3", player3)
print("player3 copy", player3copy)

// methods

struct ChessPlayer4 {
    var name: String = "Player"
    var victories: UInt = 0
    init(playerName: String) {
        name = playerName // self is not needed
    }
    func description() {
        print("Player \(name) has \(victories) victories")
    }
    mutating func win() {
        victories += 1
    }
}

// this init is not available anymore
//var player4 = ChessPlayer4()
//player4.description()

var playerIvan = ChessPlayer4(playerName: "Ivan")
playerIvan.description()
playerIvan.win()
playerIvan.description()
