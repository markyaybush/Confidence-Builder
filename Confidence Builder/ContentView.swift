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
                Image("ccode")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Title with Capsule Background
                    ZStack {
                        

                        
                    }
                    .padding(.bottom, 30)

                    // Start Game Button
                    NavigationLink(destination: GameView(viewModel: GameViewModel())) {
                        Text("Start Game")
                            .font(.title)
                            .padding()
                            .frame(width: 280.0, height: 45.0)
                            .background(Color(#colorLiteral(red: 0.9765, green: 0.9216, blue: 0.3137, alpha: 1)))
                            .position(x: 430, y: 685)
                            .opacity(2.9)
                            .foregroundColor(.black)
                            .cornerRadius(45)
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

        
    

