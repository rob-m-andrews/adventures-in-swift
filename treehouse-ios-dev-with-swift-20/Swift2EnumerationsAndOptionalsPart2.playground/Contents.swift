// Treehouse
// Swift 2.0 Enumerations and Optionals
// https://teamtreehouse.com/library/swift-20-enumerations-and-optionals
// CONTINUED, Part 2!

////////////////////////////////////////////////////////
// Part 9: Pattern Matching using Enums
////////////////////////////////////////////////////////

enum Coin : Double {
    case Penny = 0.01
    case Nickel = 0.05
    case Dime = 0.10
    case Quarter = 0.25
}

let wallet: [Coin] = [.Penny, .Nickel, .Dime, .Dime, .Quarter, .Quarter, .Quarter]

var count: Int = 0

for coin in wallet {
    switch coin {
    case .Quarter: count += 1
    default: continue
    }
}

// OOOR We can do this:
// This code below does the same thing as the for loop above
for case .Quarter in wallet {
    count += 1
}

// Let's say we're iterating over the loop again, and we want to do something
// when we get nickels, and something else when we get dimes:
for coin in wallet {
    if case .Nickel = coin {
        print("Not so much money!")
    } else if case .Dime = coin {
        print("Eh, I guess it's some money!")
    }
}

////////////////////////////////////////////////////////
// Part 10: nil coalescing operator
////////////////////////////////////////////////////////

// If the user has provided a first name, we'll like to 
// display their first name. If not, we'll show their username

let firstName: String? = "Rob"
let username = "Rob"

var displayName: String

// Let's set the display name
if firstName != nil {
    displayName = firstName!
} else {
    displayName = username
}

// This type of logic below is a common approach, and
// people often use a ternary operator to accomplish this:
displayName = firstName != nil ? firstName! : username

// The nil coalescing operator in swift allows you to rewrite the ternary above as:
displayName = firstName ?? username
// BOOM!!! CONDENSED! ^^^^^
// AND, you don't have to force unwrap anything!






