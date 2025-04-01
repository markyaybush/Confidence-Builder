//
//  GameViewModel.swift
//  Confidence Builder
//
//  Created by MARK BUSH on 3/26/25.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var challenges: [Challenge] = [
        Challenge(question: "UIViewController", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "UIButton()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        Challenge(question: "String", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "UILabel()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        
        // New questions
        Challenge(question: "UITableView", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "UISwitch()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        Challenge(question: "DateFormatter", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "UIColor()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        Challenge(question: "UIView", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "UIImage()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        Challenge(question: "UIFont", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "NSAttributedString()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        Challenge(question: "UICollectionView", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "CLLocation()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        Challenge(question: "Bundle", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "DispatchQueue()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        Challenge(question: "URLSession", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS"),
        Challenge(question: "UIBezierPath()", options: ["CLASS", "OBJECT"], correctAnswer: "OBJECT"),
        Challenge(question: "AVAudioPlayer", options: ["CLASS", "OBJECT"], correctAnswer: "CLASS")
    ]

    @Published var selectedAnswers: [Int: String] = [:] // Stores user-selected answers

    func checkAnswer(for index: Int, selectedAnswer: String) -> Bool {
            let challenge = challenges[index]
            let isCorrect = challenge.correctAnswer == selectedAnswer
            selectedAnswers[index] = selectedAnswer
            return isCorrect
        }
    
    
    
    
    func getButtonColor(for index: Int, option: String) -> Color {
        guard let selected = selectedAnswers[index] else {
            return Color.white // Default color before selection
        }

        if option == challenges[index].correctAnswer {
            return .green // Correct answer turns green
        } else if option == selected {
            return .red // Wrong selected answer turns red
        }

        return Color.white
    }
}
