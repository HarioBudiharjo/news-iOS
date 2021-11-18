//
//  ListCategoryPresenter.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import UIKit

class ListCategoryPresenterImpl {
    weak private var view: ListCategoryViewOutput?
    private let interactor: ListCategoryInteractor?
    private let router: ListCategoryRouter?
    
    init(view: ListCategoryViewOutput?, interactor: ListCategoryInteractor?, router: ListCategoryRouter?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListCategoryPresenterImpl: ListCategoryPresenter {
    func goToSeach(_ caller: UIViewController) {
        self.router?.goToSeach(caller)
    }
    
    func getListCategory() {
        self.interactor?.getListCategory()
    }
    
    func goToNews(_ caller: UIViewController, category: String) {
        self.router?.goToNews(caller, category: category)
    }
}

extension ListCategoryPresenterImpl: ListCategoryInteractorOutput {
    func requestSuccess(data: [String]) {
        self.view?.showData(data: data)
    }
    
    
}
