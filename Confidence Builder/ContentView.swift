//
//  ContentView.swift
//  Confidence Builder
//
//  Created by MARK BUSH on 3/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack { // Ensures navigation works
            ZStack {
                // Background Image
                Image("HP")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Title with Capsule Background
                    ZStack {
                        Capsule()
                            .frame(width: 410, height: 80)
                            .foregroundColor(Color(#colorLiteral(red: 0.1647, green: 0.1412, blue: 0.3255, alpha: 1))) // Dark Purple
                            .opacity(0.8)

                        Text("Welcome To Chrono Code")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 30)

                    // Start Game Button
                    NavigationLink(destination: GameView(viewModel: GameViewModel())) {
                        Text("Start Game")
                            .font(.title)
                            .padding()
                            .frame(width: 200)
                            .background(Color(#colorLiteral(red: 0.9765, green: 0.9216, blue: 0.3137, alpha: 1))) // Yellow Button
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

// Preview
#Preview {
    ContentView()
}

        
    

