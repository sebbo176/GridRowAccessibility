//
//  ContentView.swift
//  GridTest
//
//  Created by Sebastian Bolling on 2024-05-21.
//

import SwiftUI

struct ContentView: View {
    
    var dataFromViewModel: [DummyObject] = [
        DummyObject(id: 1, value: "Hello", accessibilityValue: "One"),
        DummyObject(id: 2, value: "World", accessibilityValue: "Two"),
        DummyObject(id: 3, value: "Hej", accessibilityValue: "Three"),
    ]
    
    var body: some View {
        Grid {
            ForEach(dataFromViewModel) {
                gridRow(title: $0.value)
            }
        }
        .accessibilityRepresentation {
            VStack(spacing: 0) {
                ForEach(dataFromViewModel) {
                    Color.clear
                        .accessibilityLabel($0.accessibilityValue)
                }
            }
        }
    }
    
    func gridRow(title: String) -> some View {
        GridRow {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(title)
                .gridColumnAlignment(.trailing)
            Text(title)
                .gridColumnAlignment(.leading)
            Image(systemName: "hand.wave")
                .imageScale(.large)
                .foregroundStyle(.tint)
        }
    }
}

#Preview {
    ContentView()
}
