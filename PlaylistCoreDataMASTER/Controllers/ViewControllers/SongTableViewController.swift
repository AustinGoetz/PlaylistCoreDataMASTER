//
//  SongTableViewController.swift
//  PlaylistCoreDataMASTER
//
//  Created by Austin Goetz on 9/15/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    // MARK: - Properties
    var playlistToReceive: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = playlistToReceive?.name
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let playlist = playlistToReceive,
            let artist = artistNameTextField.text,
            let title = songNameTextField.text,
            !artist.isEmpty && !title.isEmpty else { return }
        
        SongController.createSongWith(title: title, artist: artist, playlist: playlist)
        
        artistNameTextField.text = ""
        songNameTextField.text = ""
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let playlist = playlistToReceive,
            let songs = playlist.songs else { return 0 }
        
        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        if let playlist = playlistToReceive,
            let song = playlist.songs?[indexPath.row] as? Song {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlistToReceive,
                let songToDelete = playlist.songs?[indexPath.row] as? Song else { return }
            SongController.delete(song: songToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
