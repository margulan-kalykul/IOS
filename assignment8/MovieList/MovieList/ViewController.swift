//
//  ViewController.swift
//  MovieList
//
//  Created by user252323 on 11/1/24.
//

import UIKit

struct Movie {
    let poster: UIImage
    let title: String
    let year: String
    let genre: String
}

class ViewController: UIViewController {

    let movies: [Movie] = [
        Movie(poster: UIImage(named: "matrix.jpg")!, title: "Matrix", year: "1999", genre: "sci-fi"),
        Movie(poster: UIImage(named: "back_to_the_future.jpg")!, title: "Back to the Future", year: "1985", genre: "adventure"),
        Movie(poster: UIImage(named: "friday_the_13th.jpg")!, title: "Friday the 13th", year: "1980", genre: "horror"),
        Movie(poster: UIImage(named: "lincoln.jpg")!, title: "Lincoln", year: "2012", genre: "drama"),
        Movie(poster: UIImage(named: "inception.jpg")!, title: "Inception", year: "2010", genre: "action"),
        Movie(poster: UIImage(named: "lego_movie.jpg")!, title: "Lego Movie", year: "2014", genre: "comedy"),
        Movie(poster: UIImage(named: "toy_story.jpg")!, title: "Toy Story", year: "1995", genre: "family"),
        Movie(poster: UIImage(named: "avatar.jpg")!, title: "Avatar", year: "2009", genre: "sci-fi"),
        Movie(poster: UIImage(named: "mission_impossible.jpg")!, title: "Mission Impossible", year: "1996", genre: "spy movie"),
        Movie(poster: UIImage(named: "star_wars_4.jpg")!, title: "Star Wars: The New Hope", year: "1977", genre: "space opera"),
    ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 170
        tableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        
        cell.configure(with: movie)
        
        return cell
    }
    
    
}

