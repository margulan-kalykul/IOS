//
//  ViewController.swift
//  HeroRandomizer
//
//  Created by Arman Myrzakanurov on 13.11.2024.
//

import UIKit

struct Hero: Decodable {
    let name: String
    let biography: Biography
    let images: HeroImage

    struct Biography: Decodable {
        let fullName: String
    }

    struct HeroImage: Decodable {
        let sm: String
    }
}

class ViewController: UIViewController {

    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroTitle: UILabel!
    @IBOutlet private weak var heroDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heroRollDidTap(_ sender: UIButton) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }

    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.handleErrorIfNeeded(error: error) == false else {
                return
            }

            guard let data else { return }
            self.handleHeroData(data: data)
        }.resume()
    }

    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.sm)

            DispatchQueue.main.async {
                self.heroTitle.text = hero.name
                self.heroDescription.text = hero.biography.fullName
                self.heroImage.image = heroImage
            }
        } catch {
            DispatchQueue.main.async {
                self.heroTitle.text = error.localizedDescription + "\nReRoll again!"
                self.heroDescription.text = ""
                self.heroImage.image = nil
            }
        }
    }

    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
}
