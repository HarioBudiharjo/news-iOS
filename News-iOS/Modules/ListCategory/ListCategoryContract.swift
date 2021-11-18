//
//  ListCategoryContract.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import UIKit

protocol ListCategoryRouter: AnyObject {
    func goToNews(_ caller: UIViewController, category: String)
    func goToSeach(_ caller: UIViewController)
}

protocol ListCategoryPresenter: AnyObject {
    func goToNews(_ caller: UIViewController, category: String)
    func getListCategory()
    func goToSeach(_ caller: UIViewController)
}

protocol ListCategoryInteractor: AnyObject {
    var output: ListCategoryInteractorOutput? { get set }
    func getListCategory()
}

protocol ListCategoryInteractorOutput: AnyObject {
    func requestSuccess(data: [String])
}

protocol ListCategoryViewOutput: AnyObject {
    func showData(data: [String])
}
