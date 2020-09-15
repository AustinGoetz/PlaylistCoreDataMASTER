//
//  PlaylistController.swift
//  PlaylistCoreDataMASTER
//
//  Created by Austin Goetz on 9/15/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    // SoT
    var playlists: [Playlist] {
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        
        return(try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
}
