//
//  CoreDataStack.swift
//  PlaylistCoreDataMASTER
//
//  Created by Austin Goetz on 9/15/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation
import CoreData

// Using an enum because it is lightweight
enum CoreDataStack {
    // Creating a static stored property for our container
    static let container: NSPersistentContainer = {
        // Initializing the container and matching the name to our application name
        let container = NSPersistentContainer(name: "PlaylistCoreDataMASTER")
        
        // Loading our persistent stores, this completes our core data stack
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("\(error.localizedDescription)")
            }
        }
        return container
    }()
    // Creating a static var to access our NSMOC that we can use for our objects context
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
