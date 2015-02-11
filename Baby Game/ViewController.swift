//
//  ViewController.swift
//  Baby Game
//
//  Created by Lisa Weir on 1/26/15.
//  Copyright (c) 2015 Lisa Weir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fadeOut()
    }
    
    func fadeOut() {
            UIView.animateWithDuration(0.5, delay: 5, options: nil, animations: {
                    self.mainImage.alpha = 0
                }, completion: { finished in
                    self.changeImage()
                })
    }
    
    func fadeIn() {
        UIView.animateWithDuration(0.5, delay: 0, options: nil, animations: {
                self.mainImage.alpha = 1
            }, completion: { finished in
                self.fadeOut()
            })
    }
    
    func changeImage() {
        let imageNames = ["stars", "circles", "chevron", "squares", "checkers"]
        weak var selectedImage = mainImage.image
        
        while(self.mainImage.image == selectedImage) {
            let randomNumber = arc4random_uniform(UInt32(imageNames.count))
            selectedImage = UIImage(named: imageNames[Int(randomNumber)])!
        }
        self.mainImage.image = selectedImage
        selectedImage = nil
        self.fadeIn()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

