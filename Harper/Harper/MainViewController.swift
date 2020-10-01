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
    
    var SongPlayer = AVAudioPlayer()
    var flag = 0
    var mark = 0
    @IBAction func Play(_ sender: UIButton) {
        if(mark == 0){
            check()
            mark = 1
        }
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
    
    func check(){
        let path = Bundle.main.path(forResource: "abcd", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do{
            SongPlayer = try AVAudioPlayer(contentsOf: url)
        } catch{
            print("Error found")
        }
        SongPlayer.prepareToPlay()
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
    
    @IBAction func TmeSlider(_ sender: UISlider) {
    }
    
}

