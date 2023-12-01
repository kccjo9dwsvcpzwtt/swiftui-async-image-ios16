//
//  ContentView.swift
//  swiftui-async-image-ios16
//
//  Created by Stanislav Ponomarenko on 2023-11-29.
//

import SwiftUI

extension Image {
  func imageModifier() -> some View {
    self
      .resizable()
      .scaledToFit()
  }
  func iconModifier() -> some View {
    self
      .imageModifier()
      .frame(maxWidth: 128)
      .foregroundColor(.purple)
      .opacity(0.5)
  }
}

struct ContentView: View {
  
  private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
  
  var body: some View {
    
    // MARK: - 1. Basic
    
    /*
    AsyncImage(url: URL(string: imageURL))
    */
     
    // MARK: - 2. Scale
    
    /*
    AsyncImage(url: URL(string: imageURL), scale: 3.0)
     */
    
    // MARK: - 3. Placeholder
    
    /*
    AsyncImage(url: URL(string: imageURL)) { image in
      image.imageModifier()
    } placeholder: {
      Image(systemName: "photo.circle.fill").iconModifier()
    }
    .padding(40)
     */
    
    //MARK: - 4. Phase
    
    /*
    AsyncImage(url: URL(string: imageURL)) { phase in
      
      // SUCCESS: The image successfully loaded
      // FAILURE: The image failed to load with an error
      // EMPTY: No image is loaded
      
      if let image = phase.image {
        image.imageModifier()
      } else if phase.error != nil {
        Image(systemName: "ant.circle.fill").iconModifier()
      } else {
        Image(systemName: "photo.circle.fill").iconModifier()
      }
    }
    .padding(40)
    */
    
    //MARK: - 5. Animation
    
    AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
      
      switch phase {
        case .empty:
          Image(systemName: "photo.circle.fill").iconModifier()
        case .success(let image):
          image.imageModifier()
            // .transition(.move(edge: .bottom))
            // .transition(.slide)
            .transition(.scale)
        case .failure(_):
          Image(systemName: "ant.circle.fill").iconModifier()
        @unknown default:
          ProgressView()
      }
    }
    .padding(40)
  }
}

#Preview {
  ContentView()
}
