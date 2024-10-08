//
//  UseCase.swift
//  trivia app
//
//  Created by Yuri Meneghin on 08/10/24.
//

import Foundation

protocol FetchQuizUseCase{
    func fetch() async throws -> [QnAItem]
}

struct FetchQuizUseCaseHandler: FetchQuizUseCase {
    
    let netMan = NetworkManager()
    //let decoder = JSONDecoder()
    
    func fetch() async throws -> [QnAItem] {
        let result = try await netMan.fetchData()
        return result.results
    }
}
