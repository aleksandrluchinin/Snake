//
//  ViewController.swift
//  Snake
//
//  Created by Aleksandr  on 13.03.2023.
//
import UIKit

class ViewController: UIViewController {
    
    private let board = Board()
    private let gameModel = GameModel()
    private var moveDirect: MoveDirect = .left

    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupViews()
        setConstraints()
        addSwipe()
        movingSnake()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(board)
    }
    
    private func addSwipe() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.left, .right, .up, .down]
        directions.forEach {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handSwipe))
            swipe.direction = $0
            view.addGestureRecognizer(swipe)
        }
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handSwipe))
        swipe.direction = [.left, .right, .up, .down]
        view.addGestureRecognizer(swipe)
    }
    
    @objc func handSwipe(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left: moveDirect = .left
        case .right: moveDirect = .right
        case .up: moveDirect = .up
        case .down: moveDirect = .down
        default:
            break
        }
    }
    
    private func movingSnake() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self]_ in
            guard let self = self else { return }
            switch self.moveDirect {
            case .left:
                self.gameModel.moveLeft()
            case .right:
                self.gameModel.moveRight()
            case .up:
                self.gameModel.moveUp()
            case .down:
                self.gameModel.moveDown()
            }
            self.updateUI()
        }
    }
    
    private func updateUI() {
        board.snake = gameModel.getSnake()
        let (col, row) = gameModel.getAddpoint()
        board.addPointCol = col
        board.addPointRow = row
        board.setNeedsDisplay()
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

