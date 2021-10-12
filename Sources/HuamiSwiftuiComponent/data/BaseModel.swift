//
//  File.swift
//  
//
//  Created by 郭宁晨 on 2021/10/12.
//

import Foundation
import CoreData

public protocol BaseModel:Identifiable{
    associatedtype NSManagedObject
    
    var id:UUID { get set }
    
    init(entity:NSManagedObject)
    
    func fill(entity:NSManagedObject)
    
}
