//
//  ViewController.swift
//  Baby Game
//
//  Created by Lisa Weir on 1/26/15.
//  Copyright (c) 2015 Lisa Weir. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let songFile = NSBundle.mainBundle().pathForResource("song1", ofType: "mp3")
        let fileURL = NSURL.fileURLWithPath(songFile!)

        var jukeBox = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        jukeBox.prepareToPlay()
        jukeBox.delegate = self
        jukeBox.play()
        
        fadeImageOut()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    func fadeImageOut() {
            UIView.animateWithDuration(0.5, delay: 5, options: nil, animations: {
                    self.mainImage.alpha = 0
                }, completion: { finished in
                    self.changeImage()
                })
    }
    
    func fadeImageIn() {
        UIView.animateWithDuration(0.5, delay: 0, options: nil, animations: {
                self.mainImage.alpha = 1
            }, completion: { finished in
                self.fadeImageOut()
            })
    }
    
    func changeImage() {
        let imageNames = ["stars", "circles", "chevron", "squares", "checkers"]
        weak var selectedImage = mainImage.image
        
        while mainImage.image == selectedImage {
            let randomNumber = arc4random_uniform(UInt32(imageNames.count))
            selectedImage = UIImage(named: imageNames[Int(randomNumber)])!
        }
        mainImage.image = selectedImage
        selectedImage = nil
        fadeImageIn()
    }
    
    
    // Remove after debug:
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        var alert = UIAlertController(title: "Alert", message: "Ran out of gas.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "K", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

