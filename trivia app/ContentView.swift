//
//  ContentView.swift
//  trivia app
//
//  Created by Yuri Meneghin on 08/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        }
        .onAppear(){
            let useCase = FetchQuizUseCaseHandler()
            Task{
                do {
                    let response = try await useCase.fetch()
                    print(response.first)
                }catch {
                    print(error.localizedDescription)
                }
            }
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
