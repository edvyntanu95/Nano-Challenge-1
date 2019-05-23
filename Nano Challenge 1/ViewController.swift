//
//  ViewController.swift
//  Nano Challenge 1
//
//  Created by Silamitra Edvyn Tanu on 17/05/19.
//  Copyright © 2019 Silamitra Edvyn Tanu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var slimeObject: UIButton!
    
    var player : AVAudioPlayer?
    
    let audioarray = ["soundLaugh1", "soundLaugh2", "soundLaugh3", "soundLaugh4"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slimeObject.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        slimeObject.center = CGPoint(x: 205, y: 630)
        
    }
    

//    var flag: Int = 1

    @IBAction func slimeTouched(_ sender: Any) {
//        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 50, options: [.curveEaseOut, .repeat, .autoreverse] , animations: {
//            UIView.setAnimationRepeatCount(2)
//            self.slimeObject.transform = CGAffineTransform(scaleX: 1, y: 0.9)
//            if self.flag == 1 {
//                self.slimeObject.transform = CGAffineTransform(scaleX: 1, y: 0.9)
//                self.flag = 0
//
//            } else {
//                self.slimeObject.transform = CGAffineTransform(scaleX: 1, y: 1)
//                self.flag = 1
//            }
//        }, completion: nil)
        
        playSound()
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 50, options: .curveEaseIn, animations: {
            self.slimeObject.transform = CGAffineTransform(scaleX: 1.1, y: 0.8)
        }) { (isFinished) in
            
            UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 50, options: .curveEaseOut, animations: {
                self.slimeObject.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 50, options: .curveEaseIn, animations: {
                    self.slimeObject.transform = CGAffineTransform(scaleX: 1.1, y: 0.9)
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 50, options: .curveEaseOut, animations: {
                        self.slimeObject.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }, completion: { (_) in
                        UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 50, options: .curveEaseOut, animations: {
                            self.slimeObject.transform = CGAffineTransform(scaleX: 1.1, y: 0.9)
                        }, completion: { (_) in
                            UIView.animate(withDuration: 0.05, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 50, options: .curveEaseOut, animations: {
                                self.slimeObject.transform = CGAffineTransform(scaleX: 1, y: 1)
                            }, completion: { (_) in
                                
                            })
                        })
                    })
                })
            })
//            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 50, options: .curveEaseOut,animations: {
//                self.slimeObject.transform = CGAffineTransform(scaleX: 1, y: 1)
//            })
        }
        
    }
    
    func playSound() {
        
        var randomTapToneSoundNumber: Int = Int.random(in: 0...3)
        
        guard let url = Bundle.main.url(forResource: audioarray[randomTapToneSoundNumber], withExtension: "wav", subdirectory: "Sound") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}



