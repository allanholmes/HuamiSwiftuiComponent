//
//  File.swift
//  
//
//  Created by 郭宁晨 on 2021/10/9.
//

import Foundation

public struct StateModel : Equatable{
    public private(set) var image:String
    public private(set) var desc:String
    
    public init(image:String,desc:String){
        self.image = image
        self.desc = desc
    }
}
