import UIKit

var greeting = "Hello, playground"

class Person {
    var apartment: Apartment?
    
    init(apartment: Apartment? = nil) {
        self.apartment = apartment
    }
    
    deinit {
        debugPrint("Person is deallocated")
    }
}

class Apartment {
    weak var person: Person?
    
    init(){}
    
    deinit {
        debugPrint("Apartment is deallocated")
    }
}

var apartment = Apartment()

var person: Person? = Person(apartment: apartment)

apartment.person = person

person = nil


class ViewController {
    var name: String = "MyViewController"
    
    lazy var printName: () -> Void = {
        //guard let self = self else { return }
        print(self.name)
    }
    
    deinit {
        print("\(name) is being deallocated")
    }
}

var vc: ViewController? = ViewController()
vc?.printName()
vc = nil
