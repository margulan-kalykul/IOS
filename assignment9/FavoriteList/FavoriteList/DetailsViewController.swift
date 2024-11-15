//
//  DetailsViewController.swift
//  FavoriteList
//
//  Created by user252323 on 11/15/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    private var inputModel: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePoster.image = inputModel?.poster
        movieTitle.text = inputModel?.title
        movieDescription.text = inputModel?.description
    }
    
    func configure(with model: Movie?) {
        self.inputModel = model
    }

}
