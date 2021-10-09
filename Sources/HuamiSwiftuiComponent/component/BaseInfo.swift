//
//  BaseInfo.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/16.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct BaseInfo<Content,Data>: View where Content:View, Data : Identifiable {
    var pickedColor:PickableColor
    @State private var dragWidth:CGFloat = 0
    var content: Content
    var actionContents: [AnyView]
    var chosenCallback: ()->Void
    @Binding var chosenData:Data?
    var data:Data
    @Environment(\.colorScheme) var colorScheme:ColorScheme
    var colors = PickableColorViewModel.pickableColors
    
    public init(data:Data,pickedColor:PickableColor,content:Content,actionContents: [AnyView],chosenCallback:@escaping ()->Void,chosenData:Binding<Data?>){
        self.data = data
        self.pickedColor = pickedColor
        self.content = content
        self.actionContents = actionContents
        self.chosenCallback = chosenCallback
        self._chosenData = chosenData
    }

    public var body: some View {
        ZStack{
            content
            .padding()
                .blur(radius: ( chosenData != nil && chosenData!.id  == data.id  ) ? -dragWidth*0.02 : 0)
            .frame(maxWidth: .infinity)
            .background(pickedColor.backgroundColor)
            .cornerRadius(14)
            .shadow(color: (self.colorScheme == .dark ? Color.white : Color.black).opacity(0.5), radius: 3, x: 3, y: 3)
            GeometryReader { proxy in
                ZStack {
                    ForEach(actionContents.indices){index in
                        HStack{
                            Spacer()
                            actionContents[index]
                                .foregroundColor(colors[colors.count-index-1].foregroundColor)
                                .frame(width: ( chosenData != nil && chosenData!.id  == data.id ) ? -dragWidth * CGFloat(( actionContents.count - index  )) : 0, height: proxy.size.height,alignment: .leading)
                            .background(colors[colors.count-index-1].backgroundColor)
                            .cornerRadius(10)
                                .shadow(color: (self.colorScheme == .dark ? Color.white : Color.black).opacity(0.5), radius: 3, x: 3, y: 3)
                        }
                    }
                }
            }
        }
        .gesture(DragGesture()
                    .onChanged { value in
                        withAnimation{
                            if value.translation.width > 0 {
                                dragWidth = 0
                            }else if value.translation.width < -75{
                                dragWidth = -75
                            }else{
                                dragWidth = value.translation.width
                            }
                        }
                    }
                    .onEnded { value in
                        withAnimation{
                            if value.translation.width < -50 {
                                chosenData = data
                                chosenCallback()
                                dragWidth = -75
                            } else {
                                dragWidth = 0
                            }
                        }
                    }
        )
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct BaseInfo_Previews: PreviewProvider {
    static var previews: some View {
        return BaseInfo(
            data: PickableColorViewModel.pickableColors[2],
            pickedColor: PickableColorViewModel.pickableColors[1],
            content:
                Text("123")
                    .foregroundColor(.white)
            ,
            actionContents: [
                AnyView(
                    Text("123")
                        .foregroundColor(.white)
                )
            ]
            , chosenCallback: {}
            , chosenData: .constant(PickableColorViewModel.pickableColors[3])
        )
    }
}
