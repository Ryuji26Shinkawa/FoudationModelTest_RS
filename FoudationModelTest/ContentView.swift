//
//  ContentView.swift
//  FoudationModelTest
//
//  Created by 新川竜司 on 2025/09/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("チャットアプリ") {
                    ChatView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
