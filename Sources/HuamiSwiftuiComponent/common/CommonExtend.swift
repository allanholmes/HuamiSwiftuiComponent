//
//  CommonExtend.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/2.
//

import Foundation
import SwiftUI

extension Date {
    public var dateString:String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    public var timeString:String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
    public var dateTimeString:String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}

extension Double {
    public var doubleString:String{
        return String(format:"%.2f",self)
    }
}

extension Int64 {
    public var intString:String{
        return String(self)
    }
    
    public var secondsLabel:String{
        if self < 60 {
            return "\(self)秒"
        }
        if self < 3600 {
            return "\((Double(self)/60).doubleString)分钟"
        }
        if self < 86400 {
            return "\((Double(self)/3600).doubleString)小时"
        }
        return "\((Double(self)/86400).doubleString)天"
    }
}

extension Color {
    public static var outlineRed: Color {
        return Color(decimalRed: 34, green: 0, blue: 3)
    }
    
    public static var darkRed: Color {
        return Color(decimalRed: 221, green: 31, blue: 59)
    }
    
    public static var lightRed: Color {
        return Color(decimalRed: 239, green: 54, blue: 128)
    }
    
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
}

extension View{
    @ViewBuilder public func hidden(_ shouldHide: Bool) -> some View {
         switch shouldHide {
         case true: self.hidden()
         case false: self
         }
     }
}


extension View {
    public func onTapGestureForced(count: Int = 1, perform action: @escaping () -> Void) -> some View {
                self
                    .contentShape(Rectangle())
                    .onTapGesture(count:count, perform:action)
            }
}

extension View {
    public func toAnyView() -> AnyView {
        AnyView(self)
    }
}
