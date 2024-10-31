//
//  SecondViewController.swift
//  SeguesExample
//
//  Created by Arman Myrzakanurov on 30.10.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var coverImage: UIImageView!

    private var inputModel: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = inputModel?.title
        descriptionLabel.text = inputModel?.description
        coverImage.image = inputModel?.image
    }

    func configure(with model: Movie?) {
        self.inputModel = model
    }
}
