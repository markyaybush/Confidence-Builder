//
//  Challenge.swift
//  Confidence Builder
//
//  Created by MARK BUSH on 3/26/25.
//

import Foundation

struct Challenge: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: String
}
