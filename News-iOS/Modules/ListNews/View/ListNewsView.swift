//
//  ListNewsView.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import UIKit

class ListNewsViewController: UIViewController {
    
    var data: [News] = []
    var category = ""
    var page = 1
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListNewsPresenterImpl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let listNewsCell = UINib(nibName: String(describing: ListNewsCell.self), bundle: nil)
        self.tableView.register(listNewsCell, forCellReuseIdentifier: String(describing: ListNewsCell.self))
        
        let router = ListNewsRouterImpl()
        let interactor = ListNewsInteractorImpl()
        self.presenter = ListNewsPresenterImpl(view: self, interactor: interactor, router: router)
        interactor.output = presenter
        
        self.presenter?.getListNews(category: self.category, page: page)
    }
}

extension ListNewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListNewsCell.self), for: indexPath) as! ListNewsCell
        cell.setView(data: data[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlArticles = data[indexPath.row].url
        if let url = URL(string: urlArticles) {
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == data.count {
            self.presenter?.getListNews(category: self.category, page: page)
        }
    }
    
}

extension ListNewsViewController: ListNewsViewOutput {
    func showData(data: ListNewsDao) {
//        self.data.removeAll()
        data.articles?.forEach({ article in
            let data = News(image: article.urlToImage ?? "", title: article.title ?? "", author: article.author ?? "", description: article.articleDescription ?? "", url: article.url ?? "")
            self.data.append(data)
        })
        self.page = self.page + 1
        self.tableView.reloadData()
    }
}
