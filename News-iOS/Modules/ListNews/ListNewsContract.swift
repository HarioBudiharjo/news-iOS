//
//  ListNewsContract.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import UIKit

protocol ListNewsRouter: AnyObject {
    func goToNews(_ caller: UIViewController)
}

protocol ListNewsPresenter: AnyObject {
    func goToNews(_ caller: UIViewController)
    func getListNews()
}

protocol ListNewsInteractor: AnyObject {
    var output: ListNewsInteractorOutput? { get set }
    func getListNews()
}

protocol ListNewsInteractorOutput: AnyObject {
    func requestSuccess()
}

protocol ListNewsViewOutput: AnyObject {
    func showData()
}
