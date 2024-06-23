//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Radu Petrisel on 07.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    
    @State private var winNextRound = Bool.random()
    @State private var gameMove = Move.allCases.randomElement()!
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text("Score: \(score)")
            }
            
            Spacer()
            
            VStack(spacing: 30) {
                Text("Current move")
                    .foregroundColor(.secondary)
                
                Text(gameMove.emoji)
                    .font(.system(size: 150))
                
                Text(gameMove.rawValue.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            
            Spacer()
            
            Text("You must")
                .foregroundColor(.secondary)
            
            Text(winNextRound ? "WIN" : "LOSE")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.accentColor)
            
            Spacer()
            
            Text("Choose your move")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            
            HStack(spacing: 30) {
                ForEach(Move.allCases, id: \.self) { move in
                    Button(move.emoji) {
                        didSelect(move: move)
                    }
                    .font(.system(size: 70))
                }
            }
        }
        .padding()
    }
    
    private func didSelect(move: Move) {
        if winNextRound && move.beats == gameMove {
            score += 1
        } else if !winNextRound && move.losesTo == gameMove {
            score += 1
        } else {
            score -= 1
        }
        
        winNextRound = Bool.random()
        gameMove = Move.allCases.randomElement()!
    }
}

#Preview {
    ContentView()
}
