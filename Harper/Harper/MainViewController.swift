//
//  MainViewController.swift
//  Harper
//
//  Created by Pranjal Bhardwaj on 16/09/20.
//  Copyright © 2020 Pranjal Bhardwaj. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class MainViewController: UIViewController{
    @IBOutlet weak var Cover_Art: UIImageView!
    @IBOutlet weak var Song_Title: UITextView!
    @IBOutlet weak var Artist: UITextView!
    @IBOutlet weak var EndTime: UILabel!
    @IBOutlet weak var Slider: UISlider!
    
    @IBAction func TimeSlider(_ sender: UISlider){
        SongPlayer.currentTime = TimeInterval(Slider.value)
        SongPlayer.play()
    }
    
    var SongPlayer = AVAudioPlayer()
    let ArtistName = ["Weeknd","Don Toliver","Travis Scott","Travis Scott"]
    let SongTitles = ["Starboy","No Idea","Out West","Franchise"]
    let SongName = ["1","2","3","4"]
    var lastPlayedIndex = 0
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        ReadyPlayer(temp: SongName[lastPlayedIndex])
        EndTime.text = String(format: "%.2f",SongPlayer.duration/60)
        Slider.maximumValue  = Float(TimeInterval(SongPlayer.duration))
        
    }
    
    @IBAction func Play(_ sender: UIButton) {
        if(flag == 1){
            sender.setImage(UIImage.init(imageLiteralResourceName: "Play"), for: UIControl.State.normal)
            SongPlayer.pause()
            flag = -1
        } else {
            sender.setImage(UIImage.init(imageLiteralResourceName: "Pause"), for: UIControl.State.normal)
            SongPlayer.play()
            flag = 1
        }
    }
    
    func ReadyPlayer(temp: String){
        let path = Bundle.main.path(forResource: temp, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do{
            SongPlayer = try AVAudioPlayer(contentsOf: url)
        } catch{
            print("Error found")
        }
        SongPlayer.prepareToPlay()
        let AudioSession = AVAudioSession.sharedInstance()
        do{
            try AudioSession.setCategory(AVAudioSession.Category.playback)
        } catch {
            print(error)
        }
    }
    
    @IBAction func Next(_ sender: UIButton) {
        ReadyPlayer(temp: SongName[lastPlayedIndex + 1])
        lastPlayedIndex += 1
        UpdateData()
        SongPlayer.play()
    }
    
    @IBAction func Previous(_ sender: UIButton) {
        ReadyPlayer(temp: SongName[lastPlayedIndex - 1])
        lastPlayedIndex -= 1
        UpdateData()
        SongPlayer.play()
    }
    
    @IBAction func Like(_ sender: UIButton) {
    }
    
    @IBAction func ToMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "ToListView", sender: nil)
    }
    
    func UpdateSlider(){
        Slider.value = Float(SongPlayer.currentTime)
    }
    
    func UpdateData(){
        Artist.text = ArtistName[lastPlayedIndex]
        Song_Title.text = SongTitles[lastPlayedIndex]
        EndTime.text = String(format: "%.2f",SongPlayer.duration/60)
    }
}

