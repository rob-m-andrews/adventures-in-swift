// Swift 2.0 Protocols
// https://teamtreehouse.com/library/swift-20-protocols

// Part 1: "What is a Protocol"
// https://teamtreehouse.com/library/swift-20-protocols/swift-20-protocols/what-is-a-protocol

// Let's write a very simple protocol
protocol FullyNameable {
    var fullName: String { get }
}

// This protocol just defines a blueprint, not an implementation.
// Whatever adopts this protocol, it must have a string fullName prop.


// A protocol can be adopted by a struct, class or enum.
struct User: FullyNameable {
    var fullName: String
}

let rob = User(fullName: "Rob Andrews")
print(rob.fullName)

struct Friend: FullyNameable {
    let firstName: String
    let middleName: String
    let lastName: String
    
    // Let's add a computed fullName property!
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let robFriend = Friend(firstName: "Rob", middleName: "Something", lastName: "Andrews")
print(robFriend.fullName)

// As you can see from the User and Friend structs, the implementation of the same 
// protocol can vary

////////////////////////////////////////////////////////////////////////////
// Part 3: Why Are Protocols Useful?
// AND....
// Part 4: Modeling Behavior with Protocols
////////////////////////////////////////////////////////////////////////////

import Foundation

//enum EmployeeType {
//    case Manager
//    case NotManager
//}
//
//class Employee {
//    
//    let name: String
//    let address: String
//    let startDate: NSDate
//    let type: EmployeeType
//    
//    var department: String?
//    var reportsTo: String?
//    
//    init(fullName: String, employeeAddress: String, employeeStartDate: NSDate, employeeType: EmployeeType) {
//        self.name = fullName
//        self.address = employeeAddress
//        self.startDate = employeeStartDate
//        self.type = employeeType
//        
//    }
//    
//    func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int) {
//        return (0, 0, 0, 0)
//    }
//    
//}
//
//func payEmployee (employee: Employee) {
//    let paycheck = employee.pay()
//}
//
//class HourlyEmployee: Employee {
//    var hourlyWage: Double = 15.00
//    var hoursWorked: Double = 0
//    let availableVacation = 0
//    
//    override func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Int) {
//        return (hourlyWage * hoursWorked, 0, 0, availableVacation)
//    }
//}

// OK, so Employee and Hourly Employee above work, but we have to override the pay methods.
// There's a better way. Let's revisit this problem with protocols.

protocol Payable {
    func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Double)
}

enum EmployeeType {
    case Manager
    case NotManager
}

class Employee {

    let name: String
    let address: String
    let startDate: NSDate
    let type: EmployeeType

    var department: String?
    var reportsTo: String?

    init(fullName: String, employeeAddress: String, employeeStartDate: NSDate, employeeType: EmployeeType) {
        self.name = fullName
        self.address = employeeAddress
        self.startDate = employeeStartDate
        self.type = employeeType

    }
}

func payEmployee (employee: Payable) {
    let paycheck = employee.pay()
}

class HourlyEmployee: Employee, Payable {
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 0.0
    let availableVacation = 0.0
    
    func pay() -> (basePay: Double, benefits: Double, deductions: Double, vacationTime: Double) {
        return (hourlyWage * hoursWorked, 0, 0, availableVacation)
    }
}



////////////////////////////////////////////////////////////////////////////
// Part 5: Protocols as Types
////////////////////////////////////////////////////////////////////////////
protocol Blendable {
    func blend()
}

class Fruit: Blendable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func blend() {
        print("I'm mush")
    }
}

class Dairy {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Cheese: Dairy {}

class Milk: Dairy, Blendable {
    func blend() {
        print("I haven't changed. I'm still milk...")
    }
}

func makeSmoothie(ingredients: [Blendable]) {
    for ingredient in ingredients {
        ingredient.blend()
    }
}

// You can use procotols in the following ways:
// - As a parameter type or return type in a function, method or intializer
// - As the type of a constant, variable, or property
// - As the type of items in an array, dictionary, or other container.

let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let chocolateMilk = Milk(name: "Chocolate")

let ingredients: [Blendable] = [strawberry, chocolateMilk]
makeSmoothie(ingredients: ingredients)

// A protocol let us establish this loose relationship of 'blendable'