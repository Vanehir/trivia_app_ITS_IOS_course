//
//  abstraction.swift
//  Trivia
//
//  Created by Fabio Recchia on 08/10/24.
//

import Foundation

protocol QnA {
    
    var type: String { get }
    var difficulty: String { get }
    var category: String { get }
    var question: String { get }
    var correct_answer: String { get }
    var incorrect_answers: [String] { get }
    
}

struct QnAItem: QnA, Decodable{
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

struct TriviaResponse: Decodable {
    let results: [QnAItem]
}



protocol QuizRepresentable {
    var qnaItems: [QnA] { get }
    var score: Int { get }
    
    func computeScore(for qna: QnA, selectedAnswer: String) -> Int
    func next () -> QnA?
}

class Quiz: QuizRepresentable {

    private var currentQnAIndex = 0

    var qnaItems: [QnA]
    var score: Int
    
    init(qnaItems: [QnA], score: Int = 0) {
        self.qnaItems = qnaItems
        self.score = score
    }
    
    func computeScore(for qna: QnA, selectedAnswer: String) -> Int {
    
        if(selectedAnswer == qna.correct_answer) {
            score = score + 10
        }
        
        return score
    }
    
    func next() -> QnA? {
        
        defer {
            currentQnAIndex = currentQnAIndex + 1
        }

        guard currentQnAIndex < qnaItems.count - 1 else {
        
            let result = currentQnAIndex == 0 ? qnaItems.first : nil
            return result
        }
        
        let result = qnaItems[currentQnAIndex]

        return result
    }
}
