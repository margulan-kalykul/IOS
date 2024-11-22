//
//  HeroManager.swift
//  DelegatePattern
//
//  Created by Arman Myrzakanurov on 20.11.2024.
//

import Foundation
import Alamofire

protocol HeroManagerDelegate {
    func onHeroDidFetch(_ heroes: [Hero])
}

struct HeroManager {
    private let api = "https://akabab.github.io/superhero-api/api/all.json"
    var delegate: HeroManagerDelegate?

    func fetchHero() {
        AF.request(api).responseDecodable(of: [Hero].self) { response in
            switch response.result {
            case .success(let heroes):
                delegate?.onHeroDidFetch(heroes)
            case .failure(let error):
                print(error)
            }
        }
    }
}
