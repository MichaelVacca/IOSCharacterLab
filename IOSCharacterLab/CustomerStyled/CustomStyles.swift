//
//  CustomStyles.swift
//  IOSCharacterLab
//
//  Created by macuser on 2023-11-08.
//

import SwiftUI
struct IconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.title
        configuration.icon
     
    }
}
