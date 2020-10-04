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
    
    var SongPlayer = AVAudioPlayer()
    @IBOutlet weak var Slider: UISlider!
    
    @IBAction func TimeSlider(_ sender: UISlider){
        SongPlayer.currentTime = TimeInterval(Slider.value)
        SongPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        check()
        EndTime.text = String(format: "%.2f",SongPlayer.duration/60)
        Slider.maximumValue  = Float(TimeInterval(SongPlayer.duration))
        
    }
    
    var flag = 0
    var mark = 0
    @IBAction func Play(_ sender: UIButton) {
        if(flag == 1){
            sender.setImage(UIImage.init(imageLiteralResourceName: "Play"), for: UIControl.State.normal)
            SongPlayer.pause()
            print(SongPlayer.currentTime/60)
            flag = -1
        } else {
            sender.setImage(UIImage.init(imageLiteralResourceName: "Pause"), for: UIControl.State.normal)
            SongPlayer.play()
            flag = 1
        }
    }
    
    func check(){
        let path = Bundle.main.path(forResource: "abcd", ofType: "mp3")!
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
    }
    
    @IBAction func Previous(_ sender: UIButton) {
    }
    
    @IBAction func Like(_ sender: UIButton) {
    }
    
    @IBAction func ToMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "ToListView", sender: nil)
    }
    
    func UpdateSlider(){
        Slider.value = Float(SongPlayer.currentTime)
    }
}

