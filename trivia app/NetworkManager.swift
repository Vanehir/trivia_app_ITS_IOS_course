//
//  NetworkManager.swift
//  trivia app
//
//  Created by Yuri Meneghin on 08/10/24.
//

import Foundation
import Alamofire



enum NetworkManagerError: Error {
    case failure
}

class NetworkManager {
    
    let urlApi = "https://opentdb.com/api.php?amount=10&category=15&difficulty=easy&type=multiple"
    func fetchData() async throws -> TriviaResponse {
        
        let response = try await AF.request(urlApi)
            .serializingDecodable(TriviaResponse.self).value
        return response
    }
}

