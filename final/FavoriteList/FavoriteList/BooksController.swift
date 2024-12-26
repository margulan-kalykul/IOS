//
//  BooksController.swift
//  FavoriteList
//
//  Created by Student on 15.11.2024.
//

import UIKit
import Alamofire
import Kingfisher

struct Book: Decodable {
    let cover: String
    let title: String
    let year: String
    let genre: String
    let description: String
}

class BooksController: UIViewController {

    private var selectedBook: Book?
    private var api: String = ""
    
    @IBOutlet weak var tableView: UITableView!
    private var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 170
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? BookDetails else {
            return
        }
        destinationController.configure(with: selectedBook)
    }
}

extension BooksController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedBook = books[indexPath.row]
        performSegue(withIdentifier: "seeDetailsBooks", sender: nil)
        
        // Remove selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BooksController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        if books.isEmpty {
            fetchBooks()
        }
        let book = books[indexPath.row]
        
        cell.configure(with: book)
        
        return cell
    }
    
    private func fetchBooks() {
        AF.request(api).responseDecodable(of: [Book].self) { response in
            switch response.result {
            case .success(let books):
                self.books = books
            case .failure(let error):
                print(error)
            }
        }
    }
}
