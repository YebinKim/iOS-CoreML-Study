//
//  ViewController.swift
//  ViviObjectRecognition
//
//  Created by Yebin Kim on 2021/02/06.
//

import UIKit
import CoreVideo
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var previewView: CapturePreviewView!
    @IBOutlet weak var classifiedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
}

// MARK: - VideoCaptureDelegate

extension ViewController : VideoCaptureDelegate{

    func onFrameCaptured(videoCapture: VideoCapture,
                         pixelBuffer:CVPixelBuffer?,
                         timestamp:CMTime){

    }
}
