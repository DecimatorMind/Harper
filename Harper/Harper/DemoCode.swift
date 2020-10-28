//
//  DemoCode.swift
//  Harper
//
//  Created by Pranjal Bhardwaj on 06/10/20.
//  Copyright © 2020 Pranjal Bhardwaj. All rights reserved.
//

import Foundation

// Final Slider Value update

//
//  ViewController.swift
//  Test
//
//  Created by Pranjal Bhardwaj on 19/10/20.
//
//
//import UIKit
//import AVFoundation

//MARK: - Terminal Commands

//@discardableResult
//func shell(_ args: String...) -> Int32 {
//    let task = Process()
//    task.launchPath = "/usr/bin/env"
//    task.arguments = args
//    task.launch()
//    task.waitUntilExit()
//    return task.terminationStatus
//}
//
//shell("ls")
//shell("xcodebuild", "-workspace", "myApp.xcworkspace")


//MARK: - Seek Bar Control

//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var Slider: UISlider!
//
//    var player = AVAudioPlayer()
//    var timer = Timer()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let path = Bundle.main.path(forResource: "Let_Her_Go", ofType: "mp3")!
//        let url = URL(fileURLWithPath: path)
//        do{
//            player = try AVAudioPlayer(contentsOf: url)
//        } catch{
//            print("Error found")
//        }
//        player.prepareToPlay()
//
//        Slider.maximumValue = Float(player.duration)
//    }
//
//    @IBAction func Play(_ sender: Any) {
//        if(player.isPlaying){
//            player.pause()
//            timer.invalidate()
//        } else {
//            player.play()
//        }
//        startTimer()
//    }

//MARK: - Pause Timer

//
//    func startTimer(){
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil,repeats: true)
//        timer.fire()
//    }
//
//    @objc func update(_ timer: Timer){
//        Slider.value = CFloat(player.currentTime)
//    }
//
//    deinit {
//           timer.invalidate()
//    }
//
//}

//MARK: - Pods to Add

// pod 'MKYoutubeToMp3Downloader'

// This is the pod framework that would help in direct download of the music file
