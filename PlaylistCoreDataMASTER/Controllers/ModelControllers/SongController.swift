//
//  SongController.swift
//  PlaylistCoreDataMASTER
//
//  Created by Austin Goetz on 9/15/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation

class SongController {
    
    static func createSongWith(title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    static func delete(song: Song) {
        song.managedObjectContext?.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
}
