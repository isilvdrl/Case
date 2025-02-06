//
//  UserDetailViewController.swift
//  Case
//
//  Created by IŞIL VARDARLI on 5.02.2025.
//

import Foundation
import UIKit
class UserDetailViewController: UIViewController {
    private let viewModel: UserDetailViewModel
    private let detailView = UserDetailView()

    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = viewModel.user.name
        detailView.configure(with: viewModel.user)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(detailView)

        detailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
