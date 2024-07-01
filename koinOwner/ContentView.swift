//
//  ContentView.swift
//  koinOwner
//
//  Created by 김나훈 on 6/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.pretendard(.bold, size: 19))
                .foregroundStyle(Color.sub700)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
