// ViewController.swift
// MediaPickerController
//
// Copyright (c) 2016 Inaka - http://inaka.net/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var mediaPickerController: MediaPickerController!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mediaPickerController = MediaPickerController(type: .imageAndVideo, presentingViewController: self)
        self.mediaPickerController.delegate = self
    }
    
    // MARK: - IBAction

    @IBAction func pickMedia(_ sender: UIBarButtonItem) {
        self.mediaPickerController.show()
    }

}

extension ViewController: MediaPickerControllerDelegate {
    
    func mediaPickerControllerDidPickImage(_ image: UIImage) {
        self.statusLabel.text = "Picked Image\nPreview:"
        self.imageView.image = image
    }
    
    func mediaPickerControllerDidPickVideo(url: URL, data: Data, thumbnail: UIImage) {
        self.statusLabel.text = "Picked Video\nURL in device: \(url.absoluteString)\nThumbnail Preview:"
        self.imageView.image = thumbnail
    }
    
}
