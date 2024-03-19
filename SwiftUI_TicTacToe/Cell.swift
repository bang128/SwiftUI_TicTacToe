//
//  Cell.swift
//  SwiftUI_TicTacToe
//
//  Created by IceCream on 3/16/24.
//

import Foundation
import SwiftUI

struct Cell {
    var symbol: Symbol
    init(symbol: Symbol) {
        self.symbol = symbol
    }
    func displaySymbol() -> String {
        switch(symbol) {
        case Symbol.Circle:
            return "O"
        case Symbol.Cross:
            return "X"
        default:
            return ""
        }
    }
    func displayColor() -> Color {
        switch(symbol) {
        case Symbol.Circle:
            return Color.red
        case Symbol.Cross:
            return Color.blue
        default:
            return Color.black
        }
    }
    
}
enum Symbol {
    case Circle
    case Cross
    case Empty
}
