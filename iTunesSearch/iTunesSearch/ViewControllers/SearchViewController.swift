//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by Guido Moyano Bertero on 24/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mediaTypeSegmentedControl: UISegmentedControl!
    
    var mediaContent = [MediaContent]()
    var mediaType: MediaType = .tvShow
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func fetchData() {
        if let searchText = self.searchBar.text?.asSearchTerms() {
            APIClient.search(term: searchText, mediaType: self.mediaType.rawValue) { (contents) in
                self.mediaContent = contents
                self.tableView.reloadData()
            }
        }
        else {
            self.mediaContent = []
            self.tableView.reloadData()
        }
    }

}

extension SearchViewController {
    
    //MARK: Actions
    
    @IBAction func mediaTypeChanged(sender:UISegmentedControl) {
        
        switch self.mediaTypeSegmentedControl.selectedSegmentIndex {
        case 0:
            self.mediaType = .tvShow
        case 1:
            self.mediaType = .movie
        case 2:
            self.mediaType = .music
        default:
            break
        }
        
        self.fetchData()
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mediaContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let mediaContentCell = tableView.dequeueReusableCell(withIdentifier: "mediaContentCell") as? MediaContentCell {
            mediaContentCell.configure(mediaContent: self.mediaContent[indexPath.row], mediaType: self.mediaType)
            cell = mediaContentCell
        }
        
        return cell
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: mediaContent[indexPath.row].previewURL) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.fetchData()
        if searchBar.isFirstResponder {
            searchBar.resignFirstResponder()
        }
    }
    
}

