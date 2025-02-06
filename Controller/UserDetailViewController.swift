//
//  UserDetailViewController.swift
//  Case
//
//  Created by IŞIL VARDARLI on 4.02.2025.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
    private let user: User
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let websiteLabel = UILabel()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [nameLabel, emailLabel, phoneLabel, websiteLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        nameLabel.text = "Name: \(user.name)"
        emailLabel.text = "Email: \(user.email)"
        phoneLabel.text = "Phone: \(user.phone)"
        websiteLabel.text = "Website: \(user.website)"
    }
}
