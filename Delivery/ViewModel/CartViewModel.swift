//
//  ItemsViewModel.swift
//  Delivery
//
//  Created by Sıla Murat on 3.08.2023.
//

import Foundation
import Combine
import CoreData

class CartViewModel: ObservableObject {
    //@Published var cartItems = [Cart]()
    
    @Published var cartProducts = [VegetableListResponse]()
    private let viewContext = PersistenceController.shared.container.viewContext
    
    private var cancellables = Set<AnyCancellable>()
    
    var total: Double {
        return cartProducts.reduce(0) { total, product in
            total + (product.price * Double(product.quantity))
        }
    }
    
    init(){
        getCart()
    }
    func addToCart(productId: Int){
        NetworkManager.shared.request(target: .addCart(userId: 1, vegetableId: productId, quantity: 1), CartResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print(String(describing: err))
                case .finished:
                    print("Finished")
                }
                
            } receiveValue: {[weak self] response in
                self?.cartProducts = response.vegetableList
            }.store(in: &cancellables)
        
    }
    func getCart(){
        NetworkManager.shared.request(target: .cart(),  CartResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print(String(describing: err))
                case .finished:
                    print("Finished")
                }
                
            } receiveValue: { [weak self] response in
                self?.cartProducts = response.vegetableList
                
            }.store(in: &cancellables)
    }
    
    func removeFromCart(productId: Int){
        NetworkManager.shared.request(target: .removeCart(userId: 1, itemId: productId), CartResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print(String(describing: err))
                case .finished:
                    print("Finished")
                }
                
            } receiveValue: { [weak self] response in
                self?.cartProducts = response.vegetableList
                
                
            }.store(in: &cancellables)
        
    }
    
    func updateCart(itemId: Int , quantity: Int){
        NetworkManager.shared.request(target: .updateCart(userId: 1, itemId: itemId, quantity: quantity), CartResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print(String(describing: err))
                case .finished:
                    print("Finished")
                }
                
            } receiveValue: { [weak self] response in
                self?.cartProducts = response.vegetableList
                
                
            }.store(in: &cancellables)
    }
    /*
    // Core Data implementation
    var numberOfProducts: Int {
        Int(cartItems.reduce(0) { $0 + $1.quantity })
        
    }
    func getCart2(){
        let request = NSFetchRequest<Cart>(entityName: "Cart")
        do{
            cartItems = try viewContext.fetch(request)
        } catch let error {
            print("Eror fetching. \(error)")
        }
        
    }
    
    
    func saveData(){
        do{
            try viewContext.save()
        } catch let error {
            print("Error saving. \(error)")
            
        }
    }
    
    func addToCart(_ item: Item) {
        let request = NSFetchRequest<Cart>(entityName: "Cart")
        
        request.predicate = NSPredicate(format: "items.id == %@", argumentArray:  [item.id ?? 0])
        do{
            cartItems = try viewContext.fetch(request)
            if let cart = cartItems.first{
                cart.quantity += 1
            } else {
                let newCartItem = Cart(context: viewContext)
                newCartItem.id = UUID()
                newCartItem.quantity = 1
                newCartItem.addToItems(item)
            }
            saveData()
        } catch let error {
            print("Error saving. \(error)")
        }
        
    }
    func removeFromCart(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let cartItem = cartItems[index]
        viewContext.delete(cartItem)
        saveData()
    }
     */
}
