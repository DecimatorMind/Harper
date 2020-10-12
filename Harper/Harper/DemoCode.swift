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
