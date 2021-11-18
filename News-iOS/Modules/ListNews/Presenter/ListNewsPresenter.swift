//
//  ListNewsPresenter.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import UIKit

class ListNewsPresenterImpl {
    weak private var view: ListNewsViewOutput?
    private let interactor: ListNewsInteractor?
    private let router: ListNewsRouter?
    
    init(view: ListNewsViewOutput?, interactor: ListNewsInteractor?, router: ListNewsRouter?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListNewsPresenterImpl: ListNewsPresenter {
    func goToNews(_ caller: UIViewController, id: String) {
        self.router?.goToNews(caller, id: id)
    }
    
    func getListNews(category: String) {
        self.interactor?.getListNews(category: category)
    }
}

extension ListNewsPresenterImpl: ListNewsInteractorOutput {
    func requestSuccess(data: ListNewsDao) {
        self.view?.showData(data: data)
    }
}
