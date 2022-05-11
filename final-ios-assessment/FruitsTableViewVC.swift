//
//  FruitsTableViewVC.swift
//  final-ios-assessment
//
//  Created by John Sag on 5/11/22.
//

import Foundation
import UIKit

let fruits = [
    Fruit(title: "Apple"),
    Fruit(title: "Fruit"),
    Fruit(title: "Pear"),
    Fruit(title: "Banana")
]

class FruitsTableViewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FruitCell.self, forCellReuseIdentifier: "cell")
    }
}

extension FruitsTableViewVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "TitleVC") as? TitleVC else { return }
        vc.model = fruits[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FruitCell
            cell.setCellContents(item: fruits[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
        return cell
    }
}
