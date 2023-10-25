import UIKit

enum Rank: String {
    case ace = "ace"
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "kign"
        default:
            return String(self.rawValue)
        }
    }
}


let ace = Rank.ace
let accRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: "two") {
    let _ = convertedRank.simpleDescription()
}

let thisValue = Rank(rawValue: "queen")
print("\(thisValue?.simpleDescription() ?? "carry")")
