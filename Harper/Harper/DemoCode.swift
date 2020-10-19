//
//  DemoCode.swift
//  Harper
//
//  Created by Pranjal Bhardwaj on 06/10/20.
//  Copyright © 2020 Pranjal Bhardwaj. All rights reserved.
//

import Foundation

// Demo Code from Stack Overflow


//func keepTrackOfAudio() {
//    audioPlayer?.addObserver(self, forKeyPath: "currentItem.loadedTimeRanges", options: .new, context: nil)
//
//    //track progress
//
//    let interval = CMTime(value: 1, timescale: 2)
//    audioPlayer?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main , using: { (progressTime) in
//        let seconds = CMTimeGetSeconds(progressTime)
//        let secondsString = String(format: "%02d", Int(seconds.truncatingRemainder(dividingBy: 60)))
//        let minutesString = String(format: "%02d", Int(seconds / 60))
//
//        self.audioCurrentTimeLabel.text = "\(minutesString):\(secondsString)"
//
//        //lets move the slider thumb
//        if let duration = self.audioPlayer?.currentItem?.duration {
//            let durationSeconds = CMTimeGetSeconds(duration)
//
//            self.audioSlider.value = Float(seconds / durationSeconds)
//
//        }
//    })
//
//}
//


// Slider Timer Update


//override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//
//
//        if let duration = audioPlayer?.currentItem?.duration {
//            let seconds = CMTimeGetSeconds(duration)
//
//            let secondsText = String(format: "%02d", Int(seconds) % 60)
//            let minutesText = String(format: "%02d", Int(seconds) / 60)
//            audioLengthLabel.text = "\(minutesText):\(secondsText)"
//        }
//
//    }
//}

// Timer function to mark the time of the slider

//Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
//  progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)


// Pandora Player Code Bit

//let seconds = Float(CMTimeGetSeconds(time))
//        self.sliderView.duration = duration
//        self.sliderView.progress = seconds / Float(duration)


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


