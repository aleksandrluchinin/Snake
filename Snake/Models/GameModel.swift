//
//  BoardSnake.swift
//  Snake
//
//  Created by Aleksandr  on 13.03.2023.
//

import Foundation

class GameModel {
    
    static let cols = 20
    static let rows = 40
    
    private var addPointCol = 1
    private var addPointRow = 4
    
    var snake: [SnakeCell] = []
    
    init() {
        snake.append(SnakeCell(col: GameModel.cols - 1, row: 1))
        snake.append(SnakeCell(col: GameModel.cols, row: 1))
        
    }
    
    private func isOnSnake(col: Int, row: Int) -> Bool {
        for cell in snake {
            if cell.col == col && cell.row == row {
                return true
            }
        }
        return false
    }
    
    func randomAddPoint() {
        addPointCol = Int.random(in: 1..<GameModel.cols)
        addPointRow = Int.random(in: 1..<GameModel.rows)
        
        while isOnSnake(col: addPointCol, row: addPointRow) {
            addPointCol = Int.random(in: 1..<GameModel.cols)
            addPointRow = Int.random(in: 1..<GameModel.rows)
            
        }
        
    }
}
