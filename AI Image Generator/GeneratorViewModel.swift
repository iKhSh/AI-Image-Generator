//
//  GeneratorViewModel.swift
//  AI Image Generator
//
//  Created by Khalid Shiba on 21.02.24.
//

import Foundation
extension GeneratorView {
    
    class ViewModel : ObservableObject {
        @Published var duration = 0
        @Published var image: URL?
        
        let prompt: String
        let selectedStyle: ImageStyle
        
        private let openAIService = OpenAIService()
        
        init( prompt: String, selectedStyle: ImageStyle) {
            self.prompt = prompt
            self.selectedStyle = selectedStyle
        }
        
        func generateImage() {
            let formaattedPrompt = "\(selectedStyle.title) image of \(prompt)"
            Task {
                do
                {
                    let generatedImage = try await self.openAIService.generateImage (prompt: formaattedPrompt)
                    
                    guard let imageURLString = generatedImage.data.first?.url, let imageUrl =
                            URL(string: imageURLString) else {
                        print("Failed to generate image")
                        return
                    }
                    await MainActor.run {
                        self.image = imageUrl
                    }
                }
                catch {
                    print (error)
                }
            }
        }
    }
}
