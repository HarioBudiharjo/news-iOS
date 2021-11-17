//
//  SearchInteractor.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import Foundation
import Alamofire

class SearchInteractorImpl: SearchInteractor {
    var output: SearchInteractorOutput?
    
    func getListNews(search: String) {
        AF.request("https://newsapi.org/v2/top-headlines?q=\(search)&apiKey=\(Constant.API_KEY)").responseDecodable(of: SearchDao.self) { response in
            debugPrint(response)
            if let data = response.value {
                self.output?.requestSuccess(data: data)
            }
        }
    }
}
