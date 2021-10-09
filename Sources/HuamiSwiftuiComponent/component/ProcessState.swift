//
//  ProcessState.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/18.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
struct ProcessState: View {
    var state:StateModel
    var foregroundColor:Color
    
    public init(state:StateModel,foregroundColor:Color){
        self.state = state
        self.foregroundColor = foregroundColor
    }

    
    public var body: some View {
        HStack {
            Image(systemName: state.image)
                .shadow(radius: 20)
                .foregroundColor(foregroundColor)
            Text("\(state.desc)  ")
                .foregroundColor(foregroundColor)
        }
//        .background(Capsule().foregroundColor(foregroundColor).opacity(0.1))
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct ProcessState_Previews: PreviewProvider {
    static var previews: some View {
        ProcessState(state: StateModel(image: "xmark.circle", desc: "测试"), foregroundColor: .blue)
            .background(Color.yellow)
    }
}
