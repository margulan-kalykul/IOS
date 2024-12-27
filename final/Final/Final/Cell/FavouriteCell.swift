//
//  FavouriteCell.swift
//  Final
//
//  Created by user252323 on 12/27/24.
//

import UIKit

class FavouriteCell: UITableViewCell {

    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var subject: UILabel!
    private var bookId: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with book: Book) {
        bookId = book.id
        cover.kf.setImage(with: URL(string: book.cover))
        title.text = book.title
        author.text = book.author
        subject.text = book.subject
    }
}
