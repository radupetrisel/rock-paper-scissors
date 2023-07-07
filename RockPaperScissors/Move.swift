//
//  Move.swift
//  RockPaperScissors
//
//  Created by Radu Petrisel on 07.07.2023.
//

import Foundation

enum Move: String, CaseIterable {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
    
    var beats: Move {
        switch self {
        case .rock:
            return .scissors
        case .scissors:
            return .paper
        case .paper:
            return .rock
        }
    }
    
    var losesTo: Move {
        switch self {
        case .rock:
            return .paper
        case .paper:
            return .scissors
        case .scissors:
            return .rock
        }
    }
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
}
