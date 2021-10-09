//
//  ColorPickView.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/8/27.
//

import SwiftUI

public struct ColorPicker: View {
    var pickableColors:[PickableColor]
    @Binding var pickedColor:PickableColor?
    var size:CGFloat = 100
    
    public init(pickableColors:[PickableColor],pickedColor:Binding<PickableColor?>){
        self.pickableColors = pickableColors
        self._pickedColor = pickedColor
    }
    
    public init(pickableColors:[PickableColor],pickedColor:Binding<PickableColor?>,size:CGFloat){
        self.pickableColors = pickableColors
        self._pickedColor = pickedColor
        self.size = size
    }
    
    public var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(pickableColors){ color in
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(color.backgroundColor)
                        .frame(width: size, height: size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(color.colorName == pickedColor?.colorName ? Color.yellow : Color.gray,lineWidth: 2))
                        .shadow(color: color.backgroundColorLabel == pickedColor?.backgroundColorLabel ? Color.yellow : Color.blue, radius: 2)
                        .onTapGesture {
                            pickedColor = color
                        }
                }
                Spacer()
            }.padding()
        }
    }
}

//struct ColorPickView_Previews: PreviewProvider {
//    static var previews: some View {
//        Picka
//        ColorPicker(pickedColor: .constant(PickableColorViewModel().pickableColors[0]), size: 20)
//    }
//}
