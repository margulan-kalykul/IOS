//
//  ViewController.swift
//  HeroApp
//
//  Created by Arman Myrzakanurov on 20.11.2024.
//

import UIKit
import Alamofire
import Kingfisher

struct Hero: Decodable {
    let name: String
    let biography: Biography
    let images: Image

    struct Image: Decodable {
        let sm: String
    }

    struct Biography: Decodable {
        let fullName: String
    }
}


class ViewController: UIViewController {

    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroDescription: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!

    private let api = "https://akabab.github.io/superhero-api/api/all.json"
    private var heroes: [Hero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func didTapHero(_ sender: Any) {
        /// Async/Await Example Code
//        Task {
//            await fetchHeroAsync()
//            let randomHero = heroes.randomElement()!
//            configure(hero: randomHero)
//        }

        /// Basic Closures via Alamofire
        if heroes.isEmpty {
            fetchHero()
        } else {
            let randomHero = heroes.randomElement()!
            configure(hero: randomHero)
        }
    }

    /// Async/Await Example Code
    private func fetchHeroAsync() async {
        let result = await AF.request(api).serializingDecodable([Hero].self).result
        switch result {
        case .success(let heroes):
            self.heroes = heroes
        case .failure(let error):
            print(error)
        }
    }

    /// Basic Closures via Alamofire
    private func fetchHero() {
        AF.request(api).responseDecodable(of: [Hero].self) { response in
            switch response.result {
            case .success(let heroes):
                self.heroes = heroes
            case .failure(let error):
                print(error)
            }
        }
    }

    private func configure(hero: Hero) {
        heroName.text = hero.name
        heroDescription.text = hero.biography.fullName
        heroImage.kf.setImage(with: URL(string: hero.images.sm))
    }
}
