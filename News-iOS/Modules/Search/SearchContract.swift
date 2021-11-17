//
//  SearchContract.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import UIKit

protocol SearchRouter: AnyObject {
    func goToNews(_ caller: UIViewController)
}

protocol SearchPresenter: AnyObject {
    func goToNews(_ caller: UIViewController)
    func getListNews()
}

protocol SearchInteractor: AnyObject {
    var output: SearchInteractorOutput? { get set }
    func getListNews()
}

protocol SearchInteractorOutput: AnyObject {
    func requestSuccess()
}

protocol SearchViewOutput: AnyObject {
    func showData()
}