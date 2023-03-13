//
//  Board.swift
//  Snake
//
//  Created by Aleksandr  on 13.03.2023.
//

import UIKit

class Board: UIView {
    
    private let originX: CGFloat = 0
    private let originY: CGFloat = 0
    private var cellSide: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cellSide = frame.width / CGFloat(BoardSnake.cols)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        drawGrid()
        
    }
    
    private func drawGrid() {
        
        let gridPath = UIBezierPath()
        for i in 0...BoardSnake.rows {
            gridPath.move(to: CGPoint(x: originX,
                                      y: originY + CGFloat(i) * cellSide))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(BoardSnake.cols) * cellSide,
                                         y: originY + CGFloat(i) * cellSide))
        }
        
        for i in 0...BoardSnake.cols {
            gridPath.move(to: CGPoint(x: originX + CGFloat(i) * cellSide,
                                      y: originY))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(i) * cellSide,
                                         y: originY + CGFloat(BoardSnake.rows) * cellSide))
        }
        
        ColorSnake.grid.setStroke()
        gridPath.stroke()    }
}


