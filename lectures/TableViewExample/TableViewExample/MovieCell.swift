//
//  MovieCell.swift
//  TableViewExample
//
//  Created by Arman Myrzakanurov on 16.10.2024.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with movie: Movie) {
        coverImage.image = movie.cover
        titleLabel.text = movie.title
        descriptionLabel.text = movie.description
    }
}
