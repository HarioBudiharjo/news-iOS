//
//  ListNewsInteractor.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import Alamofire

class ListNewsInteractorImpl: ListNewsInteractor {
    var output: ListNewsInteractorOutput?
    
    func getListNews(category: String, page: Int) {
        AF.request("https://newsapi.org/v2/top-headlines?category=\(category)&apiKey=\(Constant.API_KEY)&page=\(page)").responseDecodable(of: ListNewsDao.self) { response in
            debugPrint(response)
            if let data = response.value {
                self.output?.requestSuccess(data: data)
            }
        }
    }
}
