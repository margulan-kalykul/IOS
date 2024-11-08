//
//  ViewController.swift
//  HeroRandomizer
//
//  Created by Arman Myrzakanurov on 06.11.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction private func heroButtonDidTap(_ sender: UIButton) {
        fetchHeroes()
    }


    private func fetchHeroes() {
        // Creating URLSession object for network requests
        let session = URLSession(configuration: .default)
        // Handle url string api
        let urlString = "https://akabab.github.io/superhero-api/api/all.json"

        // Create URL from urlString
        guard let url = URL(string: urlString) else {
            return
        }
        // Create URL Request from URL
        let urlRequest = URLRequest(url: url)

        // Create task for request
        let task = session.dataTask(with: urlRequest) { data, response, error in
            // If we have error, print it
            if let error {
                print(error.localizedDescription)
            } else {
                // Decode data to Hero struct object
                guard let data else { return }
                self.decodeHeroResponse(heroData: data)
            }
        }

        // Start network request
        task.resume()
    }

    private func decodeHeroResponse(heroData: Data) {
        do {
            let heroes = try JSONDecoder().decode([Hero].self, from: heroData)
            guard let selectedHero = heroes.randomElement() else { return }

            DispatchQueue.main.async {
                self.updateUI(selectedHero: selectedHero)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    private func updateUI(selectedHero: Hero) {
        self.heroName.text = selectedHero.name
        fetchHeroImage(imageString: selectedHero.images.sm)
    }

    private func fetchHeroImage(imageString: String) {
        guard let url = URL(string: imageString) else {
            return
        }

        DispatchQueue.global().async {
            let imageData = try! Data(contentsOf: url)
            DispatchQueue.main.async {
                self.heroImage.image = UIImage(data: imageData)
            }
        }
    }
}

struct Hero: Decodable {
    let name: String
    let images: HeroImage

    struct HeroImage: Decodable {
        let sm: String
    }
}
