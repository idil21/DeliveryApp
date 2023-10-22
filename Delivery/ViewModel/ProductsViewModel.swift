//
//  ProductsViewModel.swift
//  Delivery
//
//  Created by Sıla Murat on 22.08.2023.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    @Published var products = [Product]()
    var selectedCategoryId: Int
    private var cancellables = Set<AnyCancellable>()

    init(selectedCategoryId: Int){
        self.selectedCategoryId = selectedCategoryId
        getProducts()
    }
    
    func getProducts(){
        NetworkManager.shared.request(target: .products(id: selectedCategoryId), ProductResponse.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                    
                }
            } receiveValue: { [weak self] response in
                self?.products = response.body
                
            }.store(in: &cancellables)

    }
    
}
