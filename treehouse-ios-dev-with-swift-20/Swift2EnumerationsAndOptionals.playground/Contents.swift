// Treehouse
// Swift 2.0 Enumerations and Optionals
// https://teamtreehouse.com/library/swift-20-enumerations-and-optionals

////////////////////////////////////////////////////////
// Part 1: Optionals
////////////////////////////////////////////////////////

// So, we have this Person struct, but it's lacking a middle name
// struct Person {
//     let firstName: String
//     let lastName: String
// }

// Let's add a middle name
// struct Person {
//     let firstName: String
//     let middleName: String
//     let lastName: String
// }

// What if we try to create a Person with no middle name?
// The statement below won't compile...

// let noMiddlePerson = Person(firstName: "Person", middleName: nil, lastName: "Guy")

// OK, so how can we make the person's middle name optional?
// Change the middleName to an optional string type!!!
// struct Person {
//     let firstName: String
//     let middleName: String?
//     let lastName: String
// }

// Now this stament below will work!
// let noMiddlePerson = Person(firstName: "Person", middleName: nil, lastName: "Guy")

// SUCCESS!

// So. That works, but what _really_ is an optional?
// It's actually an enum under the hood!
//
// It's this:
// enum Optional<T> {
//     case Some(T)
//     case None
// }

// If the value exists, the compiler returns the associated value. This is done behind the scenes.

// ANY custom type you create can be made optional by appending the ? character to a type.

////////////////////////////////////////////////////////
// Part 2: Working with Optional Types
////////////////////////////////////////////////////////

// Let's work with the struct from above and add a func to get full name!

// Here we go:
// struct Person {
//     let firstName: String
//     let middleName: String?
//     let lastName: String
//     
//     func getFullName() -> String {
//         return firstName + " " + middleName + " " + lastName
//     }
// }

// So.... the above func won't compile, since middleName is an optional. We can't
// concatenate something that isn't _actually_ a string.

// We need to unwrap the optional value in order to work with it!

// Most basic way: if statement
// Let's check if the middle name is equal to nil

// struct Person {
//     let firstName: String
//     let middleName: String?
//     let lastName: String
//
//     func getFullName() -> String {
//         if middleName == nil {
//             return firstName + " " + lastName
//         } else {
//             // The exclamation mark appended to middleName will FORCE unwrap the middleName value
//             return firstName + " " + middleName! + " " + lastName
//         }
//     }
// }


// OK, so the if statement works. But... it SUCKS! It's bad code!
// You should not be force unwrapping like this!

// Soon, we'll learn better ways to work with this optional type.

////////////////////////////////////////////////////////
// Part 3: Optional Binding
////////////////////////////////////////////////////////

// If you'll remember Dictionaries always return an optional value.


let airportCodes = ["CDG" : "Charles de Gaulle"]

// Now, get a value out, using a key that we know doesn't exist.
let newYorkAirport = airportCodes["JFK"]

// You can see in the results area in Swift Playgrounds, the value is nil.
// What if we didn't know what the contents of 'airportCodes' was, and 
// had no idea if JFK existed as a key in the dict?

// We could go about checking it this way
// This is called optional binding. We do this to find out if an optional contains a value
if let airportNewYork = airportCodes["JFK"] {
    // bind to a temporary constant we create in the if statement
    // This temp constant can only be used inside the if statement block
    print(airportNewYork)
} else {
    print("That key doesn't exist!")
}


// The difference between the force unwrapping and optional binding is, we let
// the compiler do the unwrapping for you

// Many optional binds can be included in ONE if statement.

// Example -- Take this more complicated structure
let weatherDictionary: [String : [String : String]] = ["currently": ["temp": "22.3"], "daily": ["temp": "22.3"], "weekly": ["temp": "22.3"]]

// This code below works, but it's really freaking ugly... It looks like a pyramid when turned sideways
// The swift community calls this the 'optional pyramid of doom' :)

//if let dailyWeather = weatherDictionary["daily"] {
//    if let highTemperature = dailyWeather["temp"] {
//        print(highTemperature)
//    }
//}

// This code looks _slightly_ better.
if let dailyWeather = weatherDictionary["daily"],
    let highTemperature = dailyWeather["temp"] {
    print(highTemperature)
}

// There are some downsides to the approach above, that we'll soon learn.

////////////////////////////////////////////////////////
// Part 4: Downsides to using if & let with optionals
////////////////////////////////////////////////////////

struct Friend {
    let name: String
    let age: String
    let address: String?
}

// When getting data from the web, you can't rely on certain dictionary values being present.
func createFriend(dict: [String: String]) -> Friend? {
    if let name = dict["name"], let age = dict["age"], let address = dict["address"] {
        return Friend(name: name, age: age, address: address)
    } else {
        return nil
    }
}

// There's a fundamental problem with this approach above. If we don't get a value for
// one of the three properties of Friend (name, age, address), we don't create a Friend at all...

// Let's try something else
// The code below works OK, but it will start to look like pyramid code if more props are added.
func createFriendAgain(dict: [String: String]) -> Friend? {
    if let name = dict["name"], let age = dict["age"] {
        let address = dict["address"]
        return Friend(name: name, age: age, address: address)
    } else {
        return nil
    }
}

// OK...so we've seen the problem with using if/let syntax with Optionals.

////////////////////////////////////////////////////////
// Part 5: Early Exits Using Guard
////////////////////////////////////////////////////////

// In the code we wrote above, we exit at the very end of the function.

// An early exit is when we exit the function as early as possible, the moment
// we hit an undesirable path of code

// We'll do that with guards

// guard let someValue = someOptionalExpression else {
//     return nil
// }

// With guard, the code inside the braces is the FAILURE path.

// Let's rewrite our createFriendAgain func with guards

func createFriendWithGuard(dict: [String: String]) -> Friend? {
    // early exit if we don't have name and age!
    guard let name = dict["name"], let age = dict["age"] else {
        return nil
    }
    let address = dict["address"]
    return Friend(name: name, age: age, address: address)
}

// The guard statement above makes our function read a little nicer. There are no longer
// weird branches for our happy path of code.

////////////////////////////////////////////////////////
// Part 6: Enums with raw values
////////////////////////////////////////////////////////

// Let's say we're modeling a cash register and we want to model the types of coins
// we can accept.
// In US, coins are of 4 types

enum Coin {
    case Penny
    case Nickel
    case Dime
    case Quarter
}


let coins: [Coin] = [.Penny, .Nickel, .Dime, .Dime, .Quarter, .Quarter, .Quarter]

func totalValue(coins: [Coin]) -> Double {
    var total: Double = 0
    for coin in coins {
        switch coin {
        case .Penny: total += 0.01
        case .Nickel: total += 0.05
        case .Dime: total += 0.1
        case .Quarter: total += 0.25
        }
    }
    return total
}

print(totalValue(coins: coins))

// This totalValue function works, but it would be nice if we could specify the value of the coins,
// rather than having to write it out each time.

enum BetterCoin : Double {
    case Penny = 0.01
    case Nickel = 0.05
    case Dime = 0.10
    case Quarter = 0.25
}

// OK, let's re-write the function using the raw values
func betterTotalValue(coins: [BetterCoin]) -> Double {
    var total: Double = 0
    for coin in coins {
        total += coin.rawValue
    }
    return total
}

let betterCoins: [BetterCoin] = [.Penny, .Nickel, .Dime, .Dime, .Quarter, .Quarter, .Quarter]
print(betterTotalValue(coins: betterCoins))

// Boom!!! We did it. No more switch statement when using those raw values in the BetterCoin enum.

// *** NOTE ***: Int raw values are auto-incrementing. So you can declare one Int raw value, and the rest
// will be set for you!

////////////////////////////////////////////////////////
// Part 7: Initializing with raw values
////////////////////////////////////////////////////////

enum HTTPStatusCodes: Int {
    case Continue = 100
    case Success = 200
    case Unauthorized = 401
    case Forbidden = 403
    case NotFound = 404
}

// In a real-world application, you have no clue what a status code
// might be from a user's action.
let statusCode = 200
let httpCode = HTTPStatusCodes(rawValue: statusCode)

// If you hold the option key and click on the 'rawValue' method, you'll see that the init method is a
// failable init method.

////////////////////////////////////////////////////////
// Part 8: Optional Chaining
////////////////////////////////////////////////////////

// If you have only optional stored properties on a class, you're not required to write an init,
// since optionals are initialized to nil by default

// Example of optional chaining:
// let apartmentNumber = susan.residence?.address?.apartmentNumber

// If any property in this chain evaluates to nil, the value of the const will gracefully be set to nil

// If you check the value of apartmentNumber above, you'll notice it's an optional, so we'll need to unwrap
// it to use that.

// Unwrapping this optional chain:
//if let apartmentNumber = susan.residence?.address?.apartmentNumber {
//    print(apartmentNumber)
//}

