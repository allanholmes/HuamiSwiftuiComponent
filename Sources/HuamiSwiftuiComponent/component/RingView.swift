//
//  RingView.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/9/29.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public struct RingView: View {
    
    @Binding var progress: CGFloat
    @Binding var progressLabel: String
    
    var size:CGFloat  = 200
        
    var labelColor = Color.lightRed
    var backgroundColor = Color.outlineRed
    var colors: [Color] = [Color.darkRed, Color.lightRed]
    var colorsDone: [Color] = [Color.yellow , Color.yellow]
    
    public init(progress:Binding<CGFloat>, processLabel:Binding<String>){
        self._progress = progress
        self._progressLabel = processLabel
    }
    
    public init(progress:Binding<CGFloat>, processLabel:Binding<String>,size:CGFloat,labelColor:Color,backgroundColor:Color,colors:[Color]){
        self._progress = progress
        self._progressLabel = processLabel
        self.size = size
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
        self.colors = colors
        self.colorsDone = colors
    }
    
    public init(progress:Binding<CGFloat>, processLabel:Binding<String>,size:CGFloat,labelColor:Color,backgroundColor:Color,colors:[Color],colorsDone:[Color]){
        self._progress = progress
        self._progressLabel = processLabel
        self.size = size
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
        self.colors = colors
        self.colorsDone = colorsDone
    }
    
    public var body: some View {
        ZStack {
            Text("\(progressLabel)")
                .foregroundColor(labelColor)
                .font(.system(size: size/4))
            Circle()
                .stroke(backgroundColor, lineWidth: size/10)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: progress >= 1.0 ? colorsDone : colors),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: size/20, lineCap: .round)
            ).rotationEffect(.degrees(-90))
        }
        .frame(width: size, height: size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

@available(iOS 13.0, macOS 10.15, *)
struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            RingView(progress: .constant(0.8), progressLabel: .constant("10分钟"), isDone: .constant(true))
        }
    }
}
