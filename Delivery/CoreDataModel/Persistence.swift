//
//  DataController.swift
//  Delivery
//
//  Created by Sıla Murat on 30.07.2023.
//

import Foundation
import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    private let containerName: String = "DeliveryModel"
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: containerName)
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func addDummyData(){
        let viewContext = container.viewContext
        let category1 = Category(context: viewContext)
        category1.id = UUID()
        category1.name = "Vegetables"
        category1.image = "Vegetables"
        
        let item1 = Item(context: viewContext)
        item1.id = UUID()
        item1.name = "Boston Lettuce"
        item1.image = "Lettuce"
        item1.detail = "Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled."
        item1.unit = "piece"
        item1.quantity = 150
        item1.price = 1.10
        let item2 = Item(context: viewContext)
        item2.id = UUID()
        item2.name = "Purple Cauliflower"
        item2.image = "Cauliflower"
        item2.detail = "Purple cauliflower is a visually striking vegetable with a deep purple head caused by anthocyanins. It has a mild, nutty flavor and is rich in vitamins, minerals, and antioxidants, making it a unique and nutritious addition to various dishes."
        item2.unit = "kg"
        item2.quantity = 1
        item2.price = 1.85
        
        let item3 = Item(context: viewContext)
        item3.id = UUID()
        item3.name = "Savoy Cabbage"
        item3.image = "Cabbage"
        item3.detail = "Savoy cabbage is a type of cabbage with crinkled, dark green leaves and a milder flavor compared to regular green cabbage. Its texture is tender and slightly sweet, making it a versatile ingredient in salads, stir-fries, and soups."
        item3.unit = "kg"
        item3.quantity = 1
        item3.price = 1.45
        
        category1.addToItems(item1)
        category1.addToItems(item2)
        category1.addToItems(item3)
        
        
        let category2 = Category(context: viewContext)
        category2.id = UUID()
        category2.name = "Fruits"
        category2.image = "Fruits"
        
        let category3 = Category(context: viewContext)
        category3.id = UUID()
        category3.name = "Breads"
        category3.image = "Bread"
        
        let category4 = Category(context: viewContext)
        category4.id = UUID()
        category4.name = "Sweets"
        category4.image = "Sweets"
        
        let category5 = Category(context: viewContext)
        category5.id = UUID()
        category5.name = "Pasta"
        category5.image = "Pasta"
        
        let category6 = Category(context: viewContext)
        category6.id = UUID()
        category6.name = "Drinks"
        category6.image = "Drinks"
        
        save()
    }
    func save(){
        let viewContext = container.viewContext
        do{
            try viewContext.save()
        } catch let error {
            print("Error saving. \(error)")
            
        }
    }
    /*
    func deleteAll() {
        let viewContext = container.viewContext
        let fetchRequest = Category.fetchRequest()
        let items = try? viewContext.fetch(fetchRequest)
        for item in items ?? [] {
            viewContext.delete(item)
        }
        save()
    }
    
    func deleteItems(){
        let viewContext = container.viewContext
        let fetchRequest = Item.fetchRequest()
        let items = try? viewContext.fetch(fetchRequest)
        for item in items ?? [] {
            viewContext.delete(item)
        }
        save()
    }
     */
}
