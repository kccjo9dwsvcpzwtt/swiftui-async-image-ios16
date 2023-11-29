//
//  ContentView.swift
//  swiftui-async-image-ios16
//
//  Created by Stanislav Ponomarenko on 2023-11-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
