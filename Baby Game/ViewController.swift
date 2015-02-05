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

        let imageNames = ["stars", "circles", "chevron", "squares", "checkers"]

        UIView.animateWithDuration(1, delay: 5, options: .Autoreverse | .Repeat,
            animations: {
                
                self.mainImage.alpha = 0
                
            }, completion: { finished in

                println("completion block")
                var selectedImage: UIImage
                selectedImage = self.mainImage.image!
                
                while(self.mainImage.image == selectedImage) {
                    let randomNumber = arc4random_uniform(UInt32(imageNames.count))
                    selectedImage = UIImage(named: imageNames[Int(randomNumber)])!
                }
                
                self.mainImage.image = selectedImage

            })
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

