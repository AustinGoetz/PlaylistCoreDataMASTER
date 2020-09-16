//
//  Playlist+Convenience.swift
//  PlaylistCoreDataMASTER
//
//  Created by Austin Goetz on 9/15/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation

extension Playlist {
    
    @discardableResult
    convenience init(name: String) {
        self.init(context: CoreDataStack.context)
        self.name = name
    }
}
