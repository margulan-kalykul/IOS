//
//  BookCell.swift
//  FavoriteList
//
//  Created by Student on 15.11.2024.
//

import UIKit

class BookCell: UITableViewCell {

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
    
    func configure(with book: Book) {
        poster.image = book.poster
        title.text = book.title
        year.text = book.year
        genre.text = book.genre
    }

}
