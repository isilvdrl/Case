//
//  UserDetailView.swift
//  Case
//
//  Created by IŞIL VARDARLI on 6.02.2025.
//

import Foundation
import UIKit

class UserDetailView: UIView {
    private let stackView = UIStackView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let phoneLabel = UILabel()
    let websiteLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white

        // StackView yapılandırması
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // Label yapılandırması
        [nameLabel, emailLabel, phoneLabel, websiteLabel].forEach {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            $0.textColor = .black
            stackView.addArrangedSubview($0)
        }

        addSubview(stackView)

        // Autolayout kuralları
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

    func configure(with user: User) {
        nameLabel.text = "Name: \(user.name)"
        emailLabel.text = "Email: \(user.email)"
        phoneLabel.text = "Phone: \(user.phone)"
        websiteLabel.text = "Website: \(user.website)"
    }
}
