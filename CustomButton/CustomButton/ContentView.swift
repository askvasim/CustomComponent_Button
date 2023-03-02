//
//  ContentView.swift
//  CustomButton
//
//  Created by Vasim Khan on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    var body: some View {
        VStack {
            Button {
                self.isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    self.isLoading = false
                }
            } label: {
                Text("Log in")
                    .font(.callout)
            }
            .buttonStyle(PrimaryButtonStyleCustom(showIndicatore: $isLoading, cornerRadius: 10, buttonHeight: 52, textColor: .white))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


