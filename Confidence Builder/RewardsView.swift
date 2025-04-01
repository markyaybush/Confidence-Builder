//
//  RewardsView.swift
//  Confidence Builder
//
//  Created by MARK BUSH on 3/30/25.
//

import SwiftUI

struct RewardsView: View {
    let rewards: [(imageName: String, title: String)] = [
        ("chrono_hedgehog", "CHRONO HEDGE-HOG"),
        ("coding_machine", "CODING MACHINE"),
        ("seven_day_streak", "7 DAY STREAK"),
        ("sky_high_confidence", "SKY HIGH CONFIDENCE"),
        ("all_star", "ALL STAR"),
        ("positive_vibes", "POSITIVE VIBES")
    ]
    
    var body: some View {
        ZStack {
            // Background Image
            Image("bg") // Make sure "bg" is in Assets
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.0)
                
            
            VStack {
                // Title
                Text("Awards")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 20)

                // Rewards Grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(rewards, id: \.title) { reward in
                        VStack {
                            if let _ = UIImage(named: reward.imageName) {
                                Image(reward.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            } else {
                                // If Image is missing, show placeholder text
                                ZStack {
                                    Circle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 100, height: 100)
                                    Text("?")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.white)
                                }
                            }

                            Text(reward.title)
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(width: 120)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView()
    }
}
