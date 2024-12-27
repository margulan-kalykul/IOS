//
//  BookCell.swift
//  Final
//
//  Created by user252323 on 12/27/24.
//

import UIKit
import Kingfisher

let defaults = UserDefaults.standard

class BookCell: UITableViewCell {
    
    @IBOutlet weak var favouriteSwitch: UISwitch!
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
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if favouriteSwitch.isOn {
            if defaults.object(forKey: "favourites") == nil {
                let arr: [Int] = []
                defaults.set(arr, forKey: "favourites")
            }
            var arr = defaults.array(forKey: "favourites")
            arr!.append(bookId!)
            defaults.set(arr, forKey: "favourites")
        }
        else {
            var arr = defaults.array(forKey: "favourites")
            var toRemove: Int = 1
            for i in arr!.indices {
                if arr![i] as! Int == bookId! {
                    toRemove = i
                }
            }
            arr!.remove(at: toRemove)
            defaults.removeObject(forKey: "favourites")
            defaults.set(arr, forKey: "favourites")
        }
    }
    
    func configure(with book: Book) {
        bookId = book.id
        cover.kf.setImage(with: URL(string: book.cover))
        title.text = book.title
        author.text = book.author
        subject.text = book.subject
    }
}
