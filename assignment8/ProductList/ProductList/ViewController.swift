//
//  ViewController.swift
//  ProductList
//
//  Created by user252323 on 10/31/24.
//

import UIKit

struct Product {
    let picture: UIImage
    let name: String
    let price: Float
}

class ViewController: UIViewController {
    
    let products: [Product] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        
        cell.configure(with: product)
        
        return cell
    }
}

