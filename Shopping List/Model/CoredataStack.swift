//
//  CoredataStack.swift
//  Shopping List
//
//  Created by Greg Hughes on 12/7/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    
    static let container: NSPersistentContainer = {
        
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        
        let container = NSPersistentContainer(name: "TheList")
        container.loadPersistentStores(){( storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext}
}

