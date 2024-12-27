//
//  FavouriteController.swift
//  Final
//
//  Created by user252323 on 12/27/24.
//

import UIKit
import Alamofire

class FavouriteController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var books: [Book] = []
    private var response: Response?

    override func viewDidLoad() {
        super.viewDidLoad()
        if defaults.object(forKey: "favourites") != nil {
            return
        }
        var arr = defaults.array(forKey: "favourites") as? [Int] ?? []
        var favs = ""
        for i in arr.indices {
            if i == arr.count - 1 {
                var n: Int = arr[i]
                favs += String(n)
            }
        }
        let api = "https://gutendex.com/books?ids=\(favs)"
        Task {
            await self.fetchBooks(with: api)
        }
        tableView.rowHeight = 170
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    private func fetchBooks(with api: String) async {
        let result = await AF.request(api).serializingDecodable(Response.self).result
        switch result {
        case .success(let books):
            self.response = books
        case .failure(let error):
            print(error)
        }
        // Populate the cells with aquired data
        for book in self.response!.results {
            var author = ""
            var subject = ""
            if book.subjects.count == 0 {
                subject = "None"
            }
            else {
                subject = book.subjects[0]
            }
            if book.authors.count == 0 {
                author = "None"
            }
            else {
                author = book.authors[0].name
            }
            books = []
            books.append(Book(id: book.id, cover: "https://gutenberg.org/cache/epub/\(book.id)/pg\(book.id).cover.medium.jpg", title: book.title, author: author, subject: subject, text: nil))
        }
        await MainActor.run {
            self.tableView.reloadData()
        }

    }}

extension FavouriteController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedBook = books[indexPath.row]
        //performSegue(withIdentifier: "seeDetails", sender: nil)
        
        // Remove selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FavouriteController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! FavouriteCell
        let book = books[indexPath.row]
        
        cell.configure(with: book)
        
        return cell
    }
    
    
}
