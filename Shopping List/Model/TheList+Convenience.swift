//
//  TheList+Convenience.swift
//  List
//
//  Created by Greg Hughes on 12/7/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation
import CoreData

extension List {
    @discardableResult
    
    convenience init(item: String, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.item = item
        self.isComplete = isComplete
        
      }
}
