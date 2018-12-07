//
//  ItemController.swift
//  Shopping List
//
//  Created by Greg Hughes on 12/7/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
import CoreData

class ListController{
    
    
    
    static var shared = ListController() ; private init() {}
    
    
    var lists: [List]  {
        
        
        let request: NSFetchRequest<List> = List.fetchRequest()
        
        do {
            return try CoreDataStack.context.fetch(request)
            
        } catch{
            print("There was an error in \(#function) \(error) : \(error.localizedDescription)")
            return []
        }
    
    }
    
    
    
    //crud
    func create(item: String, isComplete: Bool){
        
        List(item: item, isComplete: isComplete)
        saveToPersistenceStore()
        
    }
    
    
    
    func delete(list: List){
        
        CoreDataStack.context.delete(list)
        saveToPersistenceStore()
    }
    
    
    
    func toggleIsComplete(list: List){
        
        list.isComplete = !list.isComplete
        saveToPersistenceStore()
    }
    
    
    
    func saveToPersistenceStore(){
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error in \(#function) \(error) : \(error.localizedDescription)")
        }
    }
}
