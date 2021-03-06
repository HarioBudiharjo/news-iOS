//
//  ListNewsContract.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import UIKit

protocol ListNewsRouter: AnyObject {
    func goToNews(_ caller: UIViewController, id: String)
    func goToSeach(_ caller: UIViewController)
}

protocol ListNewsPresenter: AnyObject {
    func goToNews(_ caller: UIViewController, id: String)
    func getListNews(category: String, page: Int)
}

protocol ListNewsInteractor: AnyObject {
    var output: ListNewsInteractorOutput? { get set }
    func getListNews(category: String, page: Int)
}

protocol ListNewsInteractorOutput: AnyObject {
    func requestSuccess(data: ListNewsDao)
}

protocol ListNewsViewOutput: AnyObject {
    func showData(data: ListNewsDao)
}
