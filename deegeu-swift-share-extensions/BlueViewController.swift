//
//  BlueViewController.swift
//  deegeu-swift-share-extensions
//
//  Created by Daniel Spiess on 10/23/15.
//  Copyright © 2015 Daniel Spiess. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    let suiteName = "group.deegeu.swift.share.extension"
    let blueDefaultKey = "BlueColorImage"
    
    // Simply reads the selected image from NSUserDefaults and displays the
    // image
    override func viewDidLoad() {
        super.viewDidLoad()
        if let prefs = UserDefaults(suiteName: suiteName) {
            if let imageData = prefs.object(forKey: blueDefaultKey) as? Data {
                DispatchQueue.main.async(execute: { () -> Void in
                    self.imageView.image = UIImage(data: imageData)
                })
            }
        }
    }

}
