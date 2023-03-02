//
//  PrimaryButtonStyleCustom.swift
//  CustomButton
//
//  Created by Vasim Khan on 3/1/23.
//

import SwiftUI

public struct PrimaryButtonStyleCustom: ButtonStyle {
    private var disabled: Bool
    private var image: String?
    @Binding private var showLoader: Bool
    private var btnBg: Color
    private var btnFg: Color
    private var cornerRadius: CGFloat
    private var buttonHeight: CGFloat
    private var textColor: Color
    
    public init(disabled: Bool = false, image: String? = nil, showIndicatore: Binding<Bool> = .constant(false), btnBg: Color = .accentColor, btnFg: Color = .white, cornerRadius: CGFloat = 0, buttonHeight: CGFloat = 0, textColor: Color = .black) {
        self.disabled = disabled
        self.image = image
        self._showLoader = showIndicatore
        self.btnBg = btnBg
        self.btnFg = btnFg
        self.cornerRadius = cornerRadius
        self.textColor = textColor
        self.buttonHeight = buttonHeight
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            if showLoader {
                CircularProgress()
            } else {
                if image != nil {
                    Image(image ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 13.33)
                }
                configuration.label
            }
        }
        .font(.callout)
        .foregroundColor(textColor)
        .frame(height: buttonHeight)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(disabled ? Color.gray : btnBg)
        .cornerRadius(cornerRadius)
        .scaleEffect(disabled ? 1 : configuration.isPressed ? 0.95 : 1)
    }
}


