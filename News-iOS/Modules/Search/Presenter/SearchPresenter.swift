//
//  SearchPresenter.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import UIKit

class SearchPresenterImpl {
    weak private var view: SearchViewOutput?
    private let interactor: SearchInteractor?
    private let router: SearchRouter?
    
    init(view: SearchViewOutput?, interactor: SearchInteractor?, router: SearchRouter?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension SearchPresenterImpl: SearchPresenter {
    func goToNews(_ caller: UIViewController) {
        self.router?.goToNews(caller)
    }
    
    func getListNews(search: String) {
        self.interactor?.getListNews(search: search)
    }
}


extension SearchPresenterImpl: SearchInteractorOutput {
    func requestSuccess(data: SearchDao) {
        self.view?.showData(data: data)
    }
}
