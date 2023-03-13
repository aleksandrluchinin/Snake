//
//  ViewController.swift
//  Snake
//
//  Created by Aleksandr  on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let board = Board()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(board)
    }
}

extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            board.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            board.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            board.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            board.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}

