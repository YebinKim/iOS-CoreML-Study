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

    let videoCapture: VideoCapture = VideoCapture()

    // Used for rendering image processing results and performing image analysis. Here we use
    // it for rendering out scaled and cropped captured frames in preparation for our model.
    let context = CIContext()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.videoCapture.delegate = self

        if self.videoCapture.initCamera(),
           let previewViewLayer = self.previewView.layer as? AVCaptureVideoPreviewLayer {

            previewViewLayer.session = self.videoCapture.captureSession
            previewViewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill

            self.videoCapture.asyncStartCapturing()
        } else {
            fatalError("Failed to init VideoCapture")
        }
    }
}

// MARK: - VideoCaptureDelegate

extension ViewController : VideoCaptureDelegate{

    func onFrameCaptured(videoCapture: VideoCapture,
                         pixelBuffer:CVPixelBuffer?,
                         timestamp:CMTime){

    }
}
