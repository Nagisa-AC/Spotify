//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by ikebbeh on 7/5/22.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(
            x: 70,
            y: 700,
            width: 100,
            height: 50)
    }
    
    @objc func didTapSignIn() {
        let AuthVC = AuthViewController()
        AuthVC.CompletionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        AuthVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(AuthVC, animated: true)
    }
    
    private func handleSignIn(success: Bool) {
        // log user in
    }
}
