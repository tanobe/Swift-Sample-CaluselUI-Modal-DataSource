//
//  contentView.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2021/11/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView([.vertical, .horizontal]) {
            HStack(spacing: 10) {
                ForEach(0..<5) {x in
                    Text("\(x)")
                        .frame(width: 300, height: 900)
                        .background(Color.yellow)
                }
            }
        }.background(Color.white)
    }
}

