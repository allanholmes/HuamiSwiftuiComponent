//
//  SwiftUIView.swift
//  
//
//  Created by 郭宁晨 on 2021/10/8.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct ExtendedView<Content,Label>: View where Content:View, Label:View {
    @Binding var isChoosen:Bool
    @ViewBuilder var label: () -> Label
    @ViewBuilder var content:()->Content
    
    public init(isChoosen:Binding<Bool>, label:@escaping ()->Label, content:@escaping ()->Content){
        self._isChoosen = isChoosen
        self.label = label
        self.content = content
    }
    
    public var body: some View {
        VStack{
            Button(action: {
                withAnimation{
                    isChoosen.toggle()
                }
            }, label: label)
            ScrollView{
                Group{
                    content()
                }
            }.frame(maxHeight: isChoosen ? nil : 0)
        }
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct ExtendedView_Previews: PreviewProvider {
    static var previews: some View {
        ExtendedView(isChoosen: .constant(true), label: {
            Text("123")
        }){
            ForEach(1..<5){i in
                Text("\(i)")
            }
        }
    }
}
