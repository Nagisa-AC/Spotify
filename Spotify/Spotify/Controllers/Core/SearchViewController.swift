//
//  SearchViewController.swift
//  Spotify
//
//  Created by ikebbeh on 7/5/22.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController: UISearchController = {
        let results = UIViewController()
        results.view.backgroundColor = .red
        let vc = UISearchController(searchResultsController: results)
        vc.searchBar.placeholder = "Songs, Aritists, Albums"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Dark and Light mode support
        view.backgroundColor = .systemBackground
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return 
        }
    }
}
