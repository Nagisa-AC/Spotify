//
//  PlaylistViewController.swift
//  Spotify
//
//  Created by ikebbeh on 7/5/22.
//

import UIKit

class PlaylistViewController: UIViewController {

    private let playlist: Playlist
    
    private let collectionView = UICollectionView(frame: .zero,
                                                  collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection? in
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)))
        
        // breaking cell into subcells
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(80)), subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
        
    })
                                                  )
    
    init(playlist: Playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    private var viewModels = [RecommendedTrackCollectionViewCell]()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist.name
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        collectionView.register(RecommendedTrackCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedTrackCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        APICaller.shared.getPlaylistDetails(for: playlist) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let model):
//                    self?.viewModels = model.tracks.items.compactMap({
//                        RecommendedTrackCellViewModel(name: $0.track.name, artistName: $0.track.artists.first?.name ?? "-",
//                                                      artworkURL: URL(string: $0.track.album?.images.first?.url ?? ""))
//                    })
//                    self?.collectionView.reloadData()
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

}

extension PlaylistViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedTrackCollectionViewCell.identifier, for: indexPath) as? RecommendedTrackCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .red
        // cell.configure(with: viewModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
