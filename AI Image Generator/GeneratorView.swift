//
//  GeneratorView.swift
//  AI Image Generator
//
//  Created by Khalid Shiba on 21.02.24.
//

import SwiftUI

struct GeneratorView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Generated Image")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            VStack{
                Text("Time spent: \("")")
                AsyncImage(url: viewModel.image){ Image in
                    Image.resizable().aspectRatio(1, contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .background(Color.gray.opacity(0.2))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .clipped()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        .onAppear{
            viewModel.generateImage()
        }
    }
}

#Preview {
    GeneratorView(viewModel: .init(prompt: "red car", selectedStyle: .threeDRender))
}
