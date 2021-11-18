//
//  ListCategoryView.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import UIKit

class ListCategoryViewController: UIViewController {
    
    var data: [String] = []
    var presenter: ListCategoryPresenterImpl?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "Category"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .plain, target: self, action: #selector(searchTapped))

        
        
        let listCategoryCell = UINib(nibName: String(describing: ListCategoryCell.self), bundle: nil)
        self.tableView.register(listCategoryCell, forCellReuseIdentifier: String(describing: ListCategoryCell.self))
        
        let router = ListCategoryRouterImpl()
        let interactor = ListCategoryInteractorImpl()
        self.presenter = ListCategoryPresenterImpl(view: self, interactor: interactor, router: router)
        interactor.output = presenter
        
        self.presenter?.getListCategory()
    }
    
    @objc func searchTapped(sender: UIBarButtonItem) {
        self.presenter?.goToSeach(self)
    }
}

extension ListCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCategoryCell.self), for: indexPath) as! ListCategoryCell
        cell.categoryLabel.text = data[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.goToNews(self, category: self.data[indexPath.row])
    }
}

extension ListCategoryViewController: ListCategoryViewOutput {
    func showData(data: [String]) {
        self.data = data
        self.tableView.reloadData()
    }
}
