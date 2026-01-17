//
//  ContentView.swift
//  CounterExample
//
//  Created by Виталий Цыганенко on 18.01.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("Counter: \(viewModel.counter)")
            HStack {
                Button("increment") {
                    viewModel.increment()
                }
                Button("decrement") {
                    viewModel.decrement()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
