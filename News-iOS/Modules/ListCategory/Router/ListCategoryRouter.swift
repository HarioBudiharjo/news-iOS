//
//  ListCategoryRouter.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import UIKit

class ListCategoryRouterImpl: ListCategoryRouter {
    static func goToModule(_ caller: UIViewController) {
        
    }
    
    func goToNews(_ caller: UIViewController, category: String) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListNewsViewController") as! ListNewsViewController
        vc.category = category
        caller.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToSeach(_ caller: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        caller.navigationController?.pushViewController(vc, animated: true)
    }
    
}
