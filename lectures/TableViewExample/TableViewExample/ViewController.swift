//
//  ViewController.swift
//  TableViewExample
//
//  Created by Arman Myrzakanurov on 16.10.2024.
//

import UIKit

struct Movie {
    let title: String
    let description: String
    let cover: UIImage
}

class ViewController: UIViewController {

    let favouriteMovies: [Movie] = [
        Movie(title: "Matrix", description: "The Matrix is a 1999 science", cover: #imageLiteral(resourceName: "matrix")),
        Movie(title: "Titanic", description: "Titanic is a 1997 American epic romantic disaster film", cover: #imageLiteral(resourceName: "titanic"))
    ]

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! MovieCell
        let movie = favouriteMovies[indexPath.row]

        cell.configure(with: movie)

        return cell
    }
}
