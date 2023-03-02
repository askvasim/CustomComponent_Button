//
//  CircularProgress.swift
//  CustomButton
//
//  Created by Vasim Khan on 3/1/23.
//

import SwiftUI

public struct CircularProgress: View {
    @State private var isCircleRotation = true
    @State private var animationStart = false
    @State private var animationEnd = false
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4)
                .fill(Color.white)
                .frame(width: 20, height: 20)
            
            Circle()
                .trim(from: animationStart ? 1/3 : 1/9, to: animationEnd ? 2/5 : 1)
                .stroke(lineWidth: 4)
                .rotationEffect(.degrees(isCircleRotation ? 360 : 0))
                .frame(width: 20, height: 20)
                .foregroundColor(.accentColor)
                .onAppear {
                    withAnimation(Animation
                        .linear(duration: 1)
                        .repeatForever(autoreverses: false)) {
                            self.isCircleRotation.toggle()
                        }
                    withAnimation(Animation
                        .linear(duration: 1)
                        .delay(0.5)
                        .repeatForever(autoreverses: true)) {
                            self.animationStart.toggle()
                        }
                    withAnimation(Animation
                        .linear(duration: 1)
                        .delay(1)
                        .repeatForever(autoreverses: true)) {
                            self.animationEnd.toggle()
                        }
                }
        }
    }
}

    
