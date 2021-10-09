//
//  BaseAlert.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/30.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public class AlertBuilder {
    public static func buildAlert(title:String, message:String, alertMethod:@escaping ()->Void)->Alert{
        Alert(
            title: Text("\(title)"),
            message: Text("\(message)"),
            primaryButton: .destructive(Text("确定"), action: alertMethod),
            secondaryButton: .cancel(Text("取消"))
        )
    }
}

