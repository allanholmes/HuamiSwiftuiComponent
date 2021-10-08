//
//  ActButton.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/17.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct ActButton: View {
    var action : ()->Void
    var label: String
    
    public init(action:@escaping ()->Void, label:String){
        self.action = action
        self.label = label
    }
    
    public var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack{
                Spacer()
                Text("\(label)")
                Spacer()
            }
        })
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct ActButton_Previews: PreviewProvider {
    static var previews: some View {
        ActButton(action: {}, label: "adfjer")
    }
}
