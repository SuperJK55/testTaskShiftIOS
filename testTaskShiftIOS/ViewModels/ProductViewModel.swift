//
//  ProductViewModel.swift
//  testTaskShiftIOS
//
//  Created by Stepan Kolenkin on 04.08.2025.
//

import Alamofire

class ProductViewModel {
    
    var productModelCollection: [ProductModel] = []
    
    var onDataUpdated: (() -> Void)?
    
    func fetchProductData() {
        let url = "https://fakestoreapi.com/products"
        
        AF.request(url).responseDecodable(of: [ProductModel].self) { response in
            switch response.result {
            case .success(let clothes):
                self.productModelCollection = clothes
                DispatchQueue.main.async {
                    self.onDataUpdated?()
                }
            case .failure(let error):
                print("Ошибка загрузки: \(error.localizedDescription)")
            }
        }
    }
    
    func getProductCount() -> Int {
        return productModelCollection.count
    }
    
    func getProduct(at index: Int) -> ProductModel? {
        return productModelCollection[index]
    }
}
