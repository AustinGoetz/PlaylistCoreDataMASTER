//
//  Song+Convenience.swift
//  PlaylistCoreDataMASTER
//
//  Created by Austin Goetz on 9/15/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation

extension Song {
    convenience init(name: String, artist: String, playlist: Playlist) {
        self.init(context: CoreDataStack.context)
        self.songName = name
        self.playlist = playlist
    }
}
