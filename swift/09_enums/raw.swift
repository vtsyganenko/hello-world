// raw values (связанные значения в Усове)

enum Smile: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
}

let current = Smile.laugh
print("current is", current)
print(current.rawValue)

enum Planet: Int {
	case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto = 999
}

let ourHome = Planet.earth
print("ourHome is", ourHome)
print("position", ourHome.rawValue)

// init

let myPlanet = Planet.init(rawValue: 3)
print("myPlanet", myPlanet)
let otherPlanet = Planet.init(rawValue: 10)
print("otherPlanet", otherPlanet)

let status = Smile.init(rawValue: ":(")
print("status is", status)
