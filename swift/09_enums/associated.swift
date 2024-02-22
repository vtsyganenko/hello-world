// associated values
enum DollarCountries {
    case usa, canada, australia
}

enum AdvancedCurrencyUnit {
    case rouble(countries: [String], shortName: String)
    case euro(countries: [String], shortName: String)
    case dollar(nation: DollarCountries, shortName: String)
}

let currencyInMontreal = AdvancedCurrencyUnit.dollar(nation: .canada, shortName: "CAD")
print("Montreal:", currencyInMontreal)

var euroCurr: AdvancedCurrencyUnit = .euro(countries: ["France", "Italy"], shortName: "EUR")
print("Euro:", euroCurr)
euroCurr = AdvancedCurrencyUnit.euro(countries: ["France", "Italy", "Spain", "Greece"], shortName: "EUR")
print("Euro:", euroCurr)

// nested enum
enum AdvancedCurrencyUnit2 {
	enum DollarCountries2 {
		case usa, canada, australia, newzealand
	}
	case rouble(countries: [String], shortName: String)
	case euro(countries: [String], shortName: String)
	case dollar(nation: DollarCountries2, shortName: String)
}

let currencyInCanberra = AdvancedCurrencyUnit2.dollar(nation: .australia, shortName: "AUD")
print("Canberra:", currencyInCanberra)
let currencyInAuckland = AdvancedCurrencyUnit2.dollar(nation: .newzealand, shortName: "NZD")
print("Auckland:", currencyInAuckland)

switch currencyInCanberra {
    case .rouble:
        print("Its rouble!")
    case let .euro(countries, shortname):
        print("Its euro: countries: \(countries) code: \(shortname)")
    case .dollar(let nationValue, let shortname):
        print("Its dollar for nation \(nationValue) code: \(shortname)")
}
