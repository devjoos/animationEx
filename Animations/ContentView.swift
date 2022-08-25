//
//  ContentView.swift
//  Animations
//
//  Created by Sam Joos on 8/23/22.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            VStack {
                Button("tap me") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) {
                    Text(String(letters[$0]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount)
                        .animation(.default.delay(Double($0) / 20), value: dragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation}
                    .onEnded { _ in dragAmount = .zero
                        enabled.toggle()
                    }
            )
        }
        
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
