//
//  ListViewController.swift
//  Harper
//
//  Created by Pranjal Bhardwaj on 27/09/20.
//  Copyright © 2020 Pranjal Bhardwaj. All rights reserved.
//

import UIKit

class SongListViewController: UIViewController {
    
    var SongTitles:[String] = ["Starboy","No Idea","Out West","Franchise"]
    
    var ArtistName:[String] = ["Weeknd","Don Toliver","Travis Scott","Travis Scott"]
    
    var flag: Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
    
        tableView.dataSource = self
        
        download()
    
    }
    
    func download(){
    
        if let audioUrl = URL(string:
                                "https://sis.ijjiii.is/50e2db3cad462d796c05aeaccf61dadd/Q9pjm4cNsfc/Pop_Smoke_-For_the_night.mp3") {
            
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let destinationUrl = documentsDirectoryURL.appendingPathComponent(audioUrl.lastPathComponent)
            
            print(destinationUrl)
            
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
            
                flag = 1
                
                print("The file already exists at path")
                
            } else {
                
                URLSession.shared.downloadTask(with: audioUrl, completionHandler: { (location, response, error) -> Void in
                
                    guard let location = location, error == nil else { return }
                    
                    do {
                        
                        try FileManager.default.moveItem(at: location, to: destinationUrl)
                    
                        self.flag = 1
                        
                        print("File moved to documents folder")
                    
                    } catch let error as NSError {
                     
                        print(error.localizedDescription)
                    
                    }
                
                }).resume()
            }
        }
        
        waitForDownload()
        
    }
    
    func waitForDownload(){
        
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(callback), userInfo: nil, repeats: false)
    
    }
    
    @objc func callback() {
    
        if(flag == 1){
        
            SongTitles.append("For The Night")
            
            ArtistName.append("Pop Smoke")
        
        }
        
        tableView.reloadData()
        
        print("done")
    
    }
    
}

extension SongListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        tableView.deselectRow(at: indexPath, animated: true)
        
        dismiss(animated: true, completion: nil)
    
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
