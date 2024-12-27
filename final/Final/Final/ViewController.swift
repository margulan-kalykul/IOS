//
//  ViewController.swift
//  Final
//
//  Created by user252323 on 12/27/24.
//

import UIKit
import Alamofire

struct Book {
    let cover: String
    let title: String
    let author: String
    let subject: String
    let text: String?
}
struct Response: Decodable {
    let results: [BookData]
    struct BookData: Decodable {
        let id: Int
        let title: String
        let authors: [Author]
        struct Author: Decodable {
            let name: String
        }
        let subjects: [String]
        let formats: Dictionary<String, String>
    }
}


class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var books: [Book] = []
    private var response: Response?
    private var selectedBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.placeholder = "Type book title"
        searchBar.delegate = self

        tableView.rowHeight = 170
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(searchBar.text ?? "Empty")
    //}
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //print(searchBar.text ?? "Empty")
        if searchBar.text != nil && !searchBar.text!.isEmpty {
            Task {
                await self.fetchBooks(with: searchBar.text!)
            }
        }
    }
    
    private func fetchBooks(with search: String) async {
        let urlString = "https://gutendex.com/books?search=\(search)"
        let result = await AF.request(urlString).serializingDecodable(Response.self).result
        switch result {
        case .success(let books):
            self.response = books
        case .failure(let error):
            print(error)
        }
        // Populate the cells with aquired data
        for book in self.response!.results {
            books.append(Book(cover: "https://gutenberg.org/cache/epub/\(book.id)/pg\(book.id).cover.medium.jpg", title: book.title, author: book.authors[0].name, subject: book.subjects[0], text: nil))
        }
        await MainActor.run {
            self.tableView.reloadData()
        }

    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = books[indexPath.row]
        //performSegue(withIdentifier: "seeDetails", sender: nil)
        
        // Remove selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        let book = books[indexPath.row]
        
        cell.configure(with: book)
        
        return cell
    }
    
    
}
