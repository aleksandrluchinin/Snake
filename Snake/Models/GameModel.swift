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
    private var snake: [SnakeCell] = []
    
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
    
    func ufdateSnackPoinr(newHead: SnakeCell) {
        var newSnake: [SnakeCell] = []
        newSnake.append(newHead)
        
        for i in 0..<snake.count - 1 {
            newSnake.append(snake[i])
        }
        
        let oldSnake = snake[snake.count - 1]
        if snake[0].col == addPointCol && snake[0].row == addPointRow {
            newSnake.append(oldSnake)
            randomAddPoint()
        }
         snake = newSnake
    }
    
    func moveLeft() {
        ufdateSnackPoinr(newHead: SnakeCell(col: snake[0].col - 1, row: snake[0].row))
    }
    
    func moveRight() {
        ufdateSnackPoinr(newHead: SnakeCell(col: snake[0].col + 1, row: snake[0].row))
    }
    
    func moveUp() {
        ufdateSnackPoinr(newHead: SnakeCell(col: snake[0].col, row: snake[0 - 1].row))
    }
    
    func moveDown() {
        ufdateSnackPoinr(newHead: SnakeCell(col: snake[0].col + 1, row: snake[0 + 1].row))
    }
    
    func getSnake() -> [SnakeCell] {
        snake
    }
    
    func getAddpoint() -> (col: Int, row: Int) {
        (addPointCol, addPointRow)
    }
}
