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

    @IBOutlet weak var tableView: UITableView!
    
    let movies: [Movie] = [
        Movie(cover: UIImage(named: "matrix.jpg")!, title: "Matrix", year: "1999", genre: "sci-fi"),
        Movie(cover: UIImage(named: "back_to_the_future.jpg")!, title: "Back to the Future", year: "1985", genre: "adventure"),
        Movie(cover: UIImage(named: "friday_the_13th.jpg")!, title: "Friday the 13th", year: "1980", genre: "horror"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Started")
        tableView.rowHeight = 170
        //tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 170
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCellTableViewCell
        let movie = movies[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
}
