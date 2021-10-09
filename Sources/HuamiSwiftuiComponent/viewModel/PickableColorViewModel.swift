//
//  File.swift
//  
//
//  Created by 郭宁晨 on 2021/10/9.
//

import SwiftUI

struct PickableColorViewModel{
    public static var pickableColors:[PickableColor] {
        return [
            PickableColor(backgroundColorLabel: "white",backgroundColor: .white, foregroundColor: .black),
            PickableColor(backgroundColorLabel: "black",backgroundColor: .black, foregroundColor: .white),
            PickableColor(backgroundColorLabel: "red",backgroundColor: .red, foregroundColor: .white),
            PickableColor(backgroundColorLabel: "blue",backgroundColor: .blue, foregroundColor: .white),
            PickableColor(backgroundColorLabel: "brown",backgroundColor: .gray, foregroundColor: .white),
            PickableColor(backgroundColorLabel: "green",backgroundColor: .green, foregroundColor: .orange),
            PickableColor(backgroundColorLabel: "yellow",backgroundColor: .yellow, foregroundColor: .black),

        ]
    }
    
    public static func getByLabel(label: String) -> PickableColor{
        return pickableColors.first { color in
            color.backgroundColorLabel == label
        } ?? pickableColors[0]
    }
}
