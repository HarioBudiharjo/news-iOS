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
    func getListCategory() {
        self.interactor?.getListCategory()
    }
    
    func goToNews(_ caller: UIViewController) {
        self.router?.goToNews(caller)
    }
}

extension ListCategoryPresenterImpl: ListCategoryInteractorOutput {
    func requestSuccess(data: [String]) {
        self.view?.showData(data: data)
    }
    
    
}
