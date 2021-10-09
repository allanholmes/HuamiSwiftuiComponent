//
//  PickableColor.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/8/26.
//

import SwiftUI

public struct PickableColor: Identifiable {
    public init(backgroundColorLabel:String,backgroundColor:Color,foregroundColor:Color){
        self.id = UUID()
        self.backgroundColorLabel = backgroundColorLabel
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    public  private(set) var id:UUID
    public  private(set) var backgroundColorLabel: String
    public  private(set) var backgroundColor: Color
    public  private(set) var foregroundColor: Color
}
