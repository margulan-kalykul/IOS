//
//  Movie.swift
//  FavoriteList
//
//  Created by user252323 on 11/15/24.
//

import UIKit

struct Movie {
    let poster: UIImage
    let title: String
    let year: String
    let genre: String
    let description: String
}

let movies: [Movie] = [
    Movie(poster: UIImage(named: "matrix.jpg")!, title: "Matrix", year: "1999", genre: "sci-fi", description: "Movie description 1"),
    Movie(poster: UIImage(named: "back_to_the_future.jpg")!, title: "Back to the Future", year: "1985", genre: "adventure", description: "Movie description 2"),
    Movie(poster: UIImage(named: "friday_the_13th.jpg")!, title: "Friday the 13th", year: "1980", genre: "horror", description: "Movie description 3"),
    Movie(poster: UIImage(named: "lincoln.jpg")!, title: "Lincoln", year: "2012", genre: "drama", description: "Movie description 4"),
    Movie(poster: UIImage(named: "inception.jpg")!, title: "Inception", year: "2010", genre: "action", description: "Movie description 5"),
    Movie(poster: UIImage(named: "lego_movie.jpg")!, title: "Lego Movie", year: "2014", genre: "comedy", description: "Movie description 6"),
    Movie(poster: UIImage(named: "toy_story.jpg")!, title: "Toy Story", year: "1995", genre: "family", description: "Movie description 7"),
    Movie(poster: UIImage(named: "avatar.jpg")!, title: "Avatar", year: "2009", genre: "sci-fi", description: "Movie description 8"),
    Movie(poster: UIImage(named: "mission_impossible.jpg")!, title: "Mission Impossible", year: "1996", genre: "spy movie", description: "Movie description 9"),
    Movie(poster: UIImage(named: "star_wars_4.jpg")!, title: "Star Wars: The New Hope", year: "1977", genre: "space opera", description: "Movie description 10"),
]
