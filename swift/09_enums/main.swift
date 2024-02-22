enum CurrencyUnit {
    case rouble
    case euro
    case dollar
}

// short syntax
let franceCurr: CurrencyUnit = .euro
print("France has", franceCurr)

// full syntax
let russiaCurr = CurrencyUnit.rouble
print("Russia has", russiaCurr)

enum DollarType {
    case us, aus, nz
}

// short syntax
let usaDollar: DollarType = .us
print("USA uses", usaDollar, "dollar")

// full syntax
let newZealandDollar = DollarType.nz
print("New Zealand uses", newZealandDollar, "dollar")

// update variable with short syntax
var sellingCurrency = CurrencyUnit.euro
print("selling currency", sellingCurrency)
sellingCurrency = .dollar
print("selling currency", sellingCurrency)
