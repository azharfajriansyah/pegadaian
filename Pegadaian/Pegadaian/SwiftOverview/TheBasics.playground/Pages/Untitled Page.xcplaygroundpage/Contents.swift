import Foundation

// Data types
var nama: String
var usia: Int
var tinggiBadan: Double
var sudahMenikah: Bool
var namaPanggilan: [String]
var usiaAnakAnak: [Int]
var keteranganLain: [String : Any]

nama = "Azhar"
usia = 36
tinggiBadan = 168.5
sudahMenikah = true
namaPanggilan = ["Azhar", "Ajay"]
keteranganLain = ["Alamat" : "Karang Tengah, Tangerang", "Pekerjaan" : "Karyawan Swasta"]


// Constants & Variables
class Peminjam {
    let nik: String
    let nama: String
    var jumlahPinjaman: Int
    
    init(nik: String, nama: String, jumlahPinjaman: Int) {
        self.nik = nik
        self.nama = nama
        self.jumlahPinjaman = jumlahPinjaman
    }
}

var azhar = Peminjam(nik: "3209152910880001", nama: "Azhar Fajriansyah", jumlahPinjaman: 10000000)

azhar.jumlahPinjaman = 12000000

debugPrint(azhar.jumlahPinjaman)

// Class vs Struct
//struct Peminjam {
//    let nik: String
//    let nama: String
//    var jumlahPinjaman: Int
//}

// Case: Create Peminjam as a Class and Struct, and create a let instance of it, and try to change the jumlahPeminjam property
//Structs (Value Types)
//
//In Swift, structs are value types, meaning that when you create an instance of a struct, a copy of that instance is made. If you declare a struct instance as let, it becomes immutable, meaning none of its properties can be changed, even if the property is declared with var.
//Classes (Reference Types)
//
//Classes, on the other hand, are reference types. When you create an instance of a class, you are working with a reference to that instance, not the instance itself. Declaring a class instance as let only makes the reference immutable, but the properties of the instance itself (if they are declared with var) can still be modified.

//•    Struct: Declaring a struct instance with let makes the entire instance immutable.
//•    Class: Declaring a class instance with let makes the reference immutable, but you can still modify the instance’s properties if they are declared with var.


public class Truck {
    public var loadCapacity: Int = 1000
    
    func test() {
        calculateOverloadCapacity()
        displayCapacity()
    }
}

extension Truck {
    private func calculateOverloadCapacity() -> Int {
        return loadCapacity * 2
    }
    
    public func displayCapacity() {
        print("Truck's load capacity: \(calculateOverloadCapacity()) kg")
    }
}

let truck = Truck()
truck.displayCapacity()

