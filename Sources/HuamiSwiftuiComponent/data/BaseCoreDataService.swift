//
//  File.swift
//  
//
//  Created by 郭宁晨 on 2021/10/12.
//

import Foundation
import CoreData

open class BaseCoreDataService<ENTITY,MODEL> where ENTITY:NSManagedObject,MODEL:BaseModel{
    public private(set) var viewContext:NSManagedObjectContext
    public private(set) var entityName:String
    
    public init(viewContext:NSManagedObjectContext,entityName:String){
        self.viewContext = viewContext
        self.entityName = entityName
    }
    
    open func deleteModel(model:MODEL){
        let entity = getEntity(id: model.id)
        if entity != nil {
            viewContext.delete(entity!)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    open func addModel(model:MODEL){
        var entity = ENTITY(context: viewContext)
        model.fill(entity: entity as! MODEL.NSManagedObject)
        do {
            try viewContext.save()
        }catch{
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    open func updateModel(model:MODEL){
        var entity = ENTITY(context: viewContext)
        model.fill(entity: entity as! MODEL.NSManagedObject)
        do {
            try viewContext.save()
        }catch{
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
    
    open func deleteModels(request:NSFetchRequest<ENTITY>){
        do {
            let entities:[ENTITY] = try viewContext.fetch(request)
            if entities.count > 0 {
                for entity in entities {
                    viewContext.delete(entity)
                }
            }
            
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    open func listModels(request:NSFetchRequest<ENTITY>) -> [MODEL]{
        var result:[MODEL] = []
        do {
            let entities:[ENTITY] = try viewContext.fetch(request)
            if entities.count > 0 {
                for entity in entities {
                    result.append(MODEL(entity: entity as! MODEL.NSManagedObject))
                }
            }
            
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }
    
    public func getModel(id:UUID)->MODEL?{
        let entity = getEntity(id: id)
        if entity != nil {
            return MODEL(entity: entity! as! MODEL.NSManagedObject)
        }
        return nil
    }
    
    open func getEntity(id:UUID) -> ENTITY?{
        let request = NSFetchRequest<ENTITY>(entityName: entityName)
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            let entities:[ENTITY] = try viewContext.fetch(request)
            if entities.count > 0 {
                return entities[0]
            }
            
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return nil
    }
}
