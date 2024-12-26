//
//  BookDetails.swift
//  FavoriteList
//
//  Created by user252323 on 11/22/24.
//

import UIKit

class BookDetails: UIViewController {

    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    
    private var inputModel: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookCover.image = inputModel?.poster
        bookTitle.text = inputModel?.title
        bookDescription.text = inputModel?.description
    }
    
    func configure(with model: Book?) {
        self.inputModel = model
    }

}
