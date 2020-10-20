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
    @IBOutlet weak var CurrentTime: UILabel!
    @IBOutlet weak var EndTime: UILabel!
    @IBOutlet weak var Slider: UISlider!
    
    var SongPlayer = AVAudioPlayer()
    var timer = Timer()
    let ArtistName = ["Weeknd","Don Toliver","Travis Scott","Travis Scott"]
    let SongTitles = ["Starboy","No Idea","Out West","Franchise"]
    var Like = [0,1,0,1]
    let SongName = ["1","2","3","4"]
    var lastPlayedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReadyPlayer(temp: SongName[lastPlayedIndex])
        UpdateData()
        Slider.maximumValue  = Float(TimeInterval(SongPlayer.duration))
        
    }
    
    @IBAction func Play(_ sender: UIButton) {
        if(SongPlayer.isPlaying){
            sender.setImage(UIImage.init(imageLiteralResourceName: "Play"), for: UIControl.State.normal)
            SongPlayer.pause()
            PauseTimer()
        } else {
            sender.setImage(UIImage.init(imageLiteralResourceName: "Pause"), for: UIControl.State.normal)
            SongPlayer.play()
            StartTimer()
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
        Slider.maximumValue  = Float(TimeInterval(SongPlayer.duration))
    }
    
    @IBAction func Next(_ sender: UIButton? = nil) {
        ReadyPlayer(temp: SongName[lastPlayedIndex + 1])
        lastPlayedIndex += 1
        UpdateData()
        SongPlayer.play()
        StartTimer()
    }
    
    @IBAction func Previous(_ sender: UIButton) {
        ReadyPlayer(temp: SongName[lastPlayedIndex - 1])
        lastPlayedIndex -= 1
        UpdateData()
        SongPlayer.play()
        StartTimer()
    }
    
    @IBAction func TimeSlider(_ sender: UISlider){
        SongPlayer.currentTime = TimeInterval(Slider.value)
        SongPlayer.play()
    }
    
    @IBAction func Like(_ sender: UIButton) {
    }
    
    @IBAction func ToMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "ToListView", sender: nil)
    }
    
    func UpdateData(){
        Artist.text = ArtistName[lastPlayedIndex]
        Song_Title.text = SongTitles[lastPlayedIndex]
        Slider.value = 0
        let time = calculateTimeFromNSTimeInterval(SongPlayer.duration)
        EndTime.text = "\(time.minute).\(time.second)"
    }
    
    func StartTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MainViewController.update(_:)), userInfo: nil,repeats: true)
        timer.fire()
    }
    
    func PauseTimer(){
        timer.invalidate()
    }
    
    @objc func update(_ timer: Timer){
        Slider.value = CFloat(SongPlayer.currentTime)
        let time = calculateTimeFromNSTimeInterval(SongPlayer.currentTime)
        CurrentTime.text = "\(time.minute).\(time.second)"
        if (Int(SongPlayer.currentTime) == Int(SongPlayer.duration)-1){
            self.Next(nil)
        }
    }
    
    func calculateTimeFromNSTimeInterval(_ duration:TimeInterval) ->(minute:String, second:String){
            let minute = abs(Int((duration/60).truncatingRemainder(dividingBy: 60)))
            let second_ = abs(Int(duration.truncatingRemainder(dividingBy: 60)))
            let second = second_ > 9 ? "\(second_)" : "0\(second_)"
            return (String(minute),second)
        }
}

