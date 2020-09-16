//
//  SongController.swift
//  PlaylistCoreDataMASTER
//
//  Created by Austin Goetz on 9/15/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import Foundation

class SongController {
    
    func createSongWith(name: String, artist: String, playlist: Playlist) {
        Song(name: name, artist: artist, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    func delete(song: Song) {
        song.managedObjectContext?.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
}
