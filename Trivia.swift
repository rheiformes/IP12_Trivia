//
//  Trivia.swift
//  IP12_Trivia
//
//  Created by Rai, Rhea on 2/13/23.
//

import Foundation

class Trivia {
    var question: String = ""
    var correct: String = ""
    var incorrect: [String] = []
    
    init(q: String, correct: String, incorrect: [String]) {
        self.question = q
        self.correct = correct
        self.incorrect = incorrect
    }
    
}
