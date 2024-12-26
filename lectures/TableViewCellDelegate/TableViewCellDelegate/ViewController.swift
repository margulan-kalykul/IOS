//
//  ViewController.swift
//  TableViewCellDelegate
//
//  Created by Arman Myrzakanurov on 27.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.configure(text: "Row \(indexPath.row + 1)")
        cell.delegate = self
        return cell
    }
}

extension ViewController: TableViewCellDelegate {
    func onButtonDidTap(index: String) {
        print(index)
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}
