//
//  CategoryListViewModel.swift
//  Delivery
//
//  Created by Sıla Murat on 31.07.2023.
//

import Foundation
import CoreData
import Combine

class CategoryListViewModel: ObservableObject{
    @Published var categoryList = [CategoryM]()
    private var cancellables = Set<AnyCancellable>()
    // coreData controller
    private let viewContext = PersistenceController.shared.container.viewContext
    
    init() {
        getCategories()
    }
    func getCategories(){
        
        NetworkManager.shared.request(target: .categories, CategoryResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    //print("Error is \(err.localizedDescription)")
                    print(String(describing: err))
                case .finished:
                    print("Finished")
                }
        
            } receiveValue: { [weak self] response in
                self?.categoryList = response.body
                
            }.store(in: &cancellables)

        
    }
    /*
     // Core Data
    func getCategories(){
        let request = NSFetchRequest<Category>(entityName: "Category")
        do{
            categories = try viewContext.fetch(request)
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
    */

}
