//
//  ViewController.swift
//  MediaPickerController
//
//  Created by Pablo Villar on 3/9/16.
//  Copyright © 2016 Inaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var mediaPickerController: MediaPickerController!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mediaPickerController = MediaPickerController(type: .ImageAndVideo, presentingViewController: self)
        self.mediaPickerController.delegate = self
    }
    
    // MARK: - IBAction

    @IBAction func pickMedia(sender: UIBarButtonItem) {
        self.mediaPickerController.show()
    }

}

extension ViewController: MediaPickerControllerDelegate {
    
    func mediaPickerControllerDidPickImage(image: UIImage) {
        self.statusLabel.text = "Picked Image\nPreview:"
        self.imageView.image = image
    }
    
    func mediaPickerControllerDidPickVideoWithURL(url: NSURL, imageData: NSData, thumbnail: UIImage) {
        self.statusLabel.text = "Picked Video\nURL in device: \(url.absoluteString)\nThumbnail Preview:"
        self.imageView.image = thumbnail
    }
    
}
