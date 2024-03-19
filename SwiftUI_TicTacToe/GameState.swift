//
//  GameState.swift
//  SwiftUI_TicTacToe
//
//  Created by IceCream on 3/16/24.
//

import Foundation

class GameState: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var player = Symbol.Cross // default first player
    @Published var OScores = 0
    @Published var XScores = 0
    @Published var showAlert = false
    @Published var alert = "Draw"
    
    init() {reset()}
    
    func reset() {
        var newBoard = [[Cell]]()
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(symbol: Symbol.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
    
    func showTurn() -> String {
        let turn = player == Symbol.Cross ? "X" : "O"
        return "Turn: " + turn
    }
    
    func playGame(row: Int, col: Int) {
        if (board[row][col].symbol != Symbol.Empty) {return}
        board[row][col].symbol = player == Symbol.Cross ? Symbol.Cross: Symbol.Circle
        
        if (checkWin()) {
            if (player == Symbol.Cross) {
                XScores += 1
            }
            else {
                OScores += 1
            }
            let winner = player == Symbol.Cross ? "X" : "O"
            alert = winner + " wins"
            showAlert = true
        }
        else {
            player = player == Symbol.Cross ? Symbol.Circle : Symbol.Cross
        }
        
        if (checkDraw()) {
            alert = "Draw"
            showAlert = true
        }
    }
    
    func checkWin() -> Bool  {
        // vertical
        var check: Bool
        for row in 0...2 {
            check = true
            for col in 0...2 {
                if (!checkPlayer(row: row, col: col)) {
                    check = false
                }
            }
            if (check) { return check}
        }
        
        // horizontal
        for col in 0...2 {
            check = true
            for row in 0...2 {
                if (!checkPlayer(row: row, col: col)) {
                    check = false
                }
            }
            if (check) { return check}
        }
        
        
        // diagonal
        check = true
        for rc in 0...2 {
            if (!checkPlayer(row: rc, col: rc)) {
                check = false
                break
            }
        }
        if (check) { return check}
        
        check = true
        for rc in 0...2 {
            if (!checkPlayer(row: rc, col: 2 - rc)) {
                check = false
                break
            }
        }
        if (check) { return check}
       
        
        return false
    }
    
    func checkDraw() -> Bool {
        for row in board {
            for cell in row {
                if cell.symbol == Symbol.Empty {
                    return false
                }
            }
        }
        return true
    }
    
    func checkPlayer (row: Int, col: Int) -> Bool {
        if (board[row][col].symbol == player) {return true}
        return false
    }
}
