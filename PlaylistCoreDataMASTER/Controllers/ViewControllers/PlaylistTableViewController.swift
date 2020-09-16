//
//  PlaylistTableViewController.swift
//  PlaylistCoreDataMASTER
//
//  Created by Austin Goetz on 9/15/20.
//  Copyright © 2020 Austin Goetz. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var playlistNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let playlistName = playlistNameTextField.text, !playlistName.isEmpty else { return }
        PlaylistController.shared.createPlaylistWith(name: playlistName)
        playlistNameTextField.text = ""
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)

        let playlist = PlaylistController.shared.playlists[indexPath.row]
        guard let songs = playlist.songs else { return UITableViewCell() }
        
        cell.textLabel?.text = playlist.name
        
        if songs.count == 1 {
            cell.detailTextLabel?.text = "1 song"
        } else {
            cell.detailTextLabel?.text = "\(songs.count) songs"
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlistToDelete = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.delete(playlist: playlistToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        // I: Identifier
        if segue.identifier == "toSongTVC" {
            // I: Index
            guard let indexPath = tableView.indexPathForSelectedRow,
                // D: Destination
                let destinationVC = segue.destination as? SongTableViewController else { return }
            // O: Object to send
            let playlistToSend = PlaylistController.shared.playlists[indexPath.row]
            // O: Object to receive
            destinationVC.playlistToReceive = playlistToSend
        }
    }
}
