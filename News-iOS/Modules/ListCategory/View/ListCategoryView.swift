//
//  ListCategoryView.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import UIKit

class ListCategoryViewController: UIViewController {
    var data: [String] = []
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
        //MARK: Navigation
    }
    
}
