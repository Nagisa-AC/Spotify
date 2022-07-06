//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by ikebbeh on 7/5/22.
//

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
        signInButton.frame = CGRect(x: 30, y: 200, width: 200, height: 50)
    }
    
    @objc func didTapSignIn() {
        let AuthVC = AuthViewController()
        AuthVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(AuthVC, animated: true)
    }
}
