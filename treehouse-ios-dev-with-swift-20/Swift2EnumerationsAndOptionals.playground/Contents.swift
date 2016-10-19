// Treehouse
// Swift 2.0 Enumerations and Optionals
// https://teamtreehouse.com/library/swift-20-enumerations-and-optionals

////////////////////////////////////////////////////////
// Part 1: Optionals
////////////////////////////////////////////////////////

// So, we have this Person struct, but it's lacking a middle name
struct Person {
    let firstName: String
    let lastName: String
}

// Let's add a middle name
struct PersonWithMiddle {
    let firstName: String
    let middleName: String
    let lastName: String
}

// What if we try to create a Person with no middle name?
// The statement below won't compile...
// let noMiddlePerson = PersonWithMiddle(firstName: "Person", middleName: nil, lastName: "Guy")

// OK, so how can we make the person's middle name optional?
// Change the middleName to an optional string type!!!
struct PersonWithOptionalMiddle {
    let firstName: String
    let middleName: String?
    let lastName: String
}

// Now this will work!
let noMiddlePerson = PersonWithOptionalMiddle(firstName: "Person", middleName: nil, lastName: "Guy")

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
// Part 1: Optionals
////////////////////////////////////////////////////////