//
//  TextInput.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/30.
//

import SwiftUI

@available(iOS 14.0, macOS 10.15, *)
public struct TextInput: View {
    @Binding var content:String
    var placeHolder:String
    var multi:Bool
    
    public init(content:Binding<String>){
        self._content = content
        self.placeHolder = ""
        self.multi = false
    }
    
    public init(content:Binding<String>, placeHolder:String, multi:Bool){
        self._content = content
        self.placeHolder = placeHolder
        self.multi = multi
    }
    
    
    public var body: some View {
        ZStack{
            Group{
                if multi {
                    HStack{
                        Text("\(placeHolder)").fontWeight(.light).foregroundColor(.secondary).padding(8).hidden(!content.isEmpty)
                        Spacer()
                    }
                }
            }
            Group{
                if multi {
                    TextEditor(text: $content)
                }else{
                    TextField("\(placeHolder)", text: $content)
                }
            }
        }
    }
}

@available(iOS 14.0, macOS 10.15, *)
struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
//            TextInput(content: .constant(""), placeHolder: "placeHolder", multi: true)
//            TextInput(content: .constant(""), placeHolder: "placeHolder", multi: false)
            TextInput(content: .constant(""),placeHolder: "placeHolder",multi: false)
                .toSearchField()
            
        }
    }
}
