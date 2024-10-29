import UIKit

class Product {
    private var name:String
    private var price:Double
    private var quantity:Int
    
    func getName() -> String{
        return self.name
    }
    func setName(value:String){
        self.name=value
    }
    func getPrice() -> Double{
        return self.price
    }
    func setPrice(value:Double){
        self.price=value
    }
    func getQuantity() -> Int{
        return self.quantity
    }
    func setQuantity(value:Int){
        self.quantity=value
    }
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    func toString()->String{
       return "\(self.name): \(self.price), \(self.quantity)"
    }
}

class Inventory{
    private var products:[Product] = []
    func getProducts() -> [Product]{
        return products
    }
    func setProducts(value:[Product]){
        self.products = value
    }
    func toltalInventoryValue() -> Double{
        var total=0.0
        for item in self.products{
            total += item.getPrice() * Double(item.getQuantity())
        }
        return total
    }
    func findTheMostExpensive()->String{
        if let maxPrice = self.products.max(by:{$0.getPrice() < $1.getPrice()}){
            return maxPrice.getName()
        }
        return "Stock is empty"
    }
    func findNameProduct(_ searchName:String)->Bool{
        if let searchResult = self.products.first(where: { $0.getName() == searchName}){
            return true
        }
        return false
    }
    func sortDescendingByProductPrice(){
        self.products = self.products.sorted {
            return $0.getPrice() > $1.getPrice()
        }
    }
    
    func sortAscendingByProductPrice(){
        self.products = self.products.sorted {
            return $0.getPrice() < $1.getPrice()
        }
    }
    func toString()->String{
        var info = ""
        for product in products {
            info += product.toString()+"\n"
        }
        return info
    }
}
let inventory = Inventory()
var products:[Product]=[]
// Add products
products.append(Product(name: "Laptop", price: 999.99, quantity: 5))
products.append(Product(name: "Smartphone", price: 499.99, quantity: 10))
products.append(Product(name: "Tablet", price: 299.99, quantity: 0))
products.append(Product(name: "Smartwatch", price: 199.99, quantity: 3))
inventory.setProducts(value: products)

//Output
//Calculate total inventory Value
dump(inventory.toltalInventoryValue())

//Find the most expensive product
dump(inventory.findTheMostExpensive())

//Find product by name
dump(inventory.findNameProduct("Headphones"))

//Sort product descending by price
inventory.sortDescendingByProductPrice()
dump(inventory.toString())
//Sort product ascending by price
inventory.sortAscendingByProductPrice()
dump(inventory.toString())
