//
//  BackButton.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/30.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct BackButton: View {
    var label:String
    var action:()->Void
    
    public init(label:String,action:@escaping ()->Void){
        self.label = label
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            action()
        }){
            HStack{
                Image(systemName: "arrowshape.turn.up.left.circle")
                Text("\(label)")
            }
        }
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(label: "123", action: {})
    }
}
