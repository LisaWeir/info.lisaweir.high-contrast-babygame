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

        UIView.animateWithDuration(0.5, delay: 5, options: .Repeat, animations: {
            
                let randomNumber = arc4random_uniform(UInt32(imageNames.count))
                self.mainImage.image = UIImage(named: imageNames[Int(randomNumber)])!

            }, completion: nil)
        
        /*
        var selectedImage: UIImage
        selectedImage = mainImage.image!
        
        while(mainImage.image == selectedImage) {
            let randomNumber = arc4random_uniform(UInt32(imageNames.count))
            selectedImage = UIImage(named: imageNames[Int(randomNumber)])!
        }
        
        mainImage.image = selectedImage
        */
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

