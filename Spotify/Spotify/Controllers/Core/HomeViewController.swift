//
//  ViewController.swift
//  Spotify
//
//  Created by ikebbeh on 7/5/22.
//

import UIKit

class HomeViewController: UIViewController {
    
//    private var collectionView: UICollectionView = UICollectionView(
//        frame: .zero,
//        collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
//            return self.createSectionLayout(section: sectionIndex)
//
//        }
//    )

    override func viewDidLoad() {
        super.viewDidLoad()
        // Dark and Light mode support
        view.backgroundColor = .systemBackground
        title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            return self.createSectionLayout(section: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout )
        
        fetchData()
    }
    
    private func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(1.0)))
            
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(120)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    
    
    private func fetchData() {
        APICaller.shared.getFeaturedPlaylists { _ in
            
        }
        
//        APICaller.shared.getNewReleases { result in
//            switch result {
//            case .success(let model): break
//            case .failure(let error): break
//            }
//        }
    }
    
    @objc func didTapSettings() {
        let viewController = ProfileViewController()
        viewController.title = "Profile"
        viewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(viewController, animated: true)
    }
}

