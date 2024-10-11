//
//  Abstraction.swift
//  TriviaApp
//
//  Created by Pietro Sotgiu on 08/10/24.
//

import Foundation

protocol TriviaResponse{
    var result: [QnA] { get }
}

protocol QnA{
    var type: String { get }
    var difficult: String { get }
    var category: String { get }
    var question: String { get }
    var correct_answer: String { get }
    var incorrect_answer: [String] { get }
}

protocol QuizRepresentable{
    var qnaItems: [QnA] { get }
    var currentQnA: QnA? { get }
    var score: Int { get }
    
    func computerScore() -> Int
    //altro?
}

protocol FetchQuizUseCase {
    func fetch() async throws -> [QnA]
}
