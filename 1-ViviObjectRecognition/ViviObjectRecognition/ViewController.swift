//
//  ViewController.swift
//  ViviObjectRecognition
//
//  Created by Yebin Kim on 2021/02/06.
//

import UIKit
import CoreVideo
import AVFoundation
import CoreML

class ViewController: UIViewController {

    @IBOutlet weak var previewView: CapturePreviewView!
    @IBOutlet weak var classifiedLabel: UILabel!

    let videoCapture: VideoCapture = VideoCapture()

    // Used for rendering image processing results and performing image analysis. Here we use
    // it for rendering out scaled and cropped captured frames in preparation for our model.
    let context = CIContext()

    // Inceptionv3()는 deprecated 됨
    let model: Inceptionv3? = try? Inceptionv3(configuration: MLModelConfiguration())

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

extension ViewController: VideoCaptureDelegate {

    func onFrameCaptured(
        videoCapture: VideoCapture,
        pixelBuffer: CVPixelBuffer?,
        timestamp: CMTime
    ) {

        // Unwrap the parameter pixxelBuffer; exit early if nil
        guard let pixelBuffer = pixelBuffer else {
            return
        }

        // Prepare our image for our model (resizing)
        guard let scaledPixelBuffer = CIImage(cvImageBuffer: pixelBuffer)
                .resize(size: CGSize(width: 299, height: 299))
                .toPixelBuffer(context: context) else {
            return
        }

        // Try to make a prediction
        let prediction = try? self.model?.prediction(image:scaledPixelBuffer)

        // Update label
        DispatchQueue.main.sync {
            classifiedLabel.text = prediction?.classLabel ?? "Unknown"
        }
    }
}
