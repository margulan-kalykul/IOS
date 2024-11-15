//
//  MovieCell.swift
//  FavoriteList
//
//  Created by user252323 on 11/15/24.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        poster.image = movie.poster
        title.text = movie.title
        year.text = movie.year
        genre.text = movie.genre
    }

}
