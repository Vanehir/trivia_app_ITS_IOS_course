//
//  UseCase.swift
//  trivia app
//
//  Created by Yuri Meneghin on 08/10/24.
//

import Foundation

struct FetchQuizUseCaseHandler: FetchQuizUseCase {
    
    let netMan = NetworkManager()
    
    func fetch() async throws -> [QnAItem] {
        let result = try await netMan.fetchData()
        return result
    }
}
