//
//  ListViewController.swift
//  Harper
//
//  Created by Pranjal Bhardwaj on 27/09/20.
//  Copyright © 2020 Pranjal Bhardwaj. All rights reserved.
//

import UIKit

class SongListViewController: UIViewController {
    
    let SongTitles = ["Starboy","No Idea","Out West","Franchise"]
    let ArtistName = ["Weeknd","Don Toliver","Travis Scott","Travis Scott"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension SongListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension SongListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! SongTableViewCell
        cell.songName.text = SongTitles[indexPath.row]
        cell.artistName.text = ArtistName[indexPath.row]
        return cell
    }
    
}

class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
}
