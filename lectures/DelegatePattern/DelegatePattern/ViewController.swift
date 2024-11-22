//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Arman Myrzakanurov on 20.11.2024.
//

import UIKit
import Alamofire

struct Hero: Decodable {
    let name: String
}

class ViewController: UIViewController, HeroManagerDelegate {
    @IBOutlet private weak var titleLabel: UILabel!

    var manager = HeroManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
    }

    @IBAction private func didTapHero(_ sender: Any) {
        manager.fetchHero()
    }

    func onHeroDidFetch(_ heroes: [Hero]) {
        print(heroes)
//        titleLabel.text = heroes[0].name
    }
}
