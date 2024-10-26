//
//  ViewController.swift
//  MovieList
//
//  Created by user252323 on 10/26/24.
//

import UIKit

struct Movie {
    let cover: UIImage
    let title: String
    let year: String
    let genre: String
}
class ViewController: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    
    let movies: [Movie] = [
        Movie(cover: , title: "Matrix", year: "1999", genre: "sci-fi"),
        Movie(title: "Titanic", description: "Titanic is a 1997 American epic romantic disaster film", cover: #imageLiteral(resourceName: "titanic"))    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! MovieCell
        let movie = favouriteMovies[indexPath.row]

        cell.configure(with: movie)

        return cell
    }}
