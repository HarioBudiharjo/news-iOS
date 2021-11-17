//
//  ListCategoryInteractor.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import UIKit

class ListCategoryInteractorImpl: ListCategoryInteractor {
    var output: ListCategoryInteractorOutput?
    
    func getListCategory() {
        let category: [String] = ["business","entertainment","general","health","science","sports","technology"]
        self.output?.requestSuccess(data: category)
    }
}

