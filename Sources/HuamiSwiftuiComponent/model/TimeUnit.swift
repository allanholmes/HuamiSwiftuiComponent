//
//  TimeUnit.swift
//  HabitTracker
//
//  Created by 郭宁晨 on 2021/10/7.
//

import Foundation

public enum TimeUnit:String {
    case MINUTE = "MINUTE"
    case HOUR = "HOUR"
    
    public static var allValues:[TimeUnit]{
        return [.MINUTE,.HOUR]
    }
    
    public func fromSeconds(secondsRange:Int64)->Int64{
        switch self {
        case .MINUTE:
            return secondsRange/60
        case .HOUR:
            return secondsRange/3600
        }
    }
    
    public func toSeconds(timeRange:Int64)->Int64{
        switch self {
        case .MINUTE:
            return timeRange*60
        case .HOUR:
            return timeRange*3600
        }
    }
    
    public func secondsRounding(seconds:Int64)->Int64{
        switch self {
        case .MINUTE:
            return seconds - seconds % 60
        case .HOUR:
            return seconds - seconds % 3600
        }
    }
    
    public func label()->String{
        switch self {
        case .MINUTE:
            return "分钟"
        case .HOUR:
            return "小时"
        }
    }
}
