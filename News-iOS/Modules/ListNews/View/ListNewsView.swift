//
//  ListNewsView.swift
//  news-iOS
//
//  Created by Hario Budiharjo on 18/11/21.
//

import UIKit

class ListNewsViewController: UIViewController {
    
    var data: [News] = []
    
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
        //MARK: Navigation
    }
    
}
