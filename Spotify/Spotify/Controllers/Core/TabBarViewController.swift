//
//  TabBarViewController.swift
//  Spotify
//
//  Created by ikebbeh on 7/5/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ViewControllerOne = HomeViewController() 
        let ViewControllerTwo = SearchViewController()
        let ViewControllerThree = LibraryViewController()
        
        // Establishing title property for each VC
        ViewControllerOne.title = "Browse"
        ViewControllerTwo.title = "Search"
        ViewControllerThree.title = "Library"
        
        ViewControllerOne.navigationItem.largeTitleDisplayMode = .always
        ViewControllerTwo.navigationItem.largeTitleDisplayMode = .always
        ViewControllerThree.navigationItem.largeTitleDisplayMode = .always
        
        let NavControllerOne = UINavigationController(rootViewController: ViewControllerOne)
        let NavControllerTwo = UINavigationController(rootViewController: ViewControllerTwo)
        let NavControllerThree = UINavigationController(rootViewController: ViewControllerThree)
        
        
        // Establishing tab bar item image
        NavControllerOne.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        NavControllerTwo.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        NavControllerThree.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 1)

        
        NavControllerOne.navigationBar.prefersLargeTitles = true
        NavControllerTwo.navigationBar.prefersLargeTitles = true
        NavControllerThree.navigationBar.prefersLargeTitles = true
        
        setViewControllers([NavControllerOne, NavControllerTwo, NavControllerThree], animated: false)
    }
}
