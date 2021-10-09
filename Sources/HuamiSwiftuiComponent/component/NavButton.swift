//
//  NavButton.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/16.
//

import SwiftUI

struct NavButton<Destination>: View where Destination:View{
    @ViewBuilder var destination:()->Destination
    var label:String
    @State var navActive = false
    
    public init(destination:@escaping()->Destination, label:String){
        self.destination = destination
        self.label = label
    }
    
    var body: some View {
        ZStack{
            NavigationLink(
                destination: destination(),
                isActive: $navActive,
                label: {
                    EmptyView()
                }
            )
            ActButton(action: {
                navActive = true
            }, label: label)
        }
    }
}
