//
//  AddButton.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/8/23.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct AddButton: View {
    var action: () -> Void
    
    public init(action:@escaping ()->Void){
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
                Image(systemName: "plus")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
            
        }
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton {
            
        }
    }
}
