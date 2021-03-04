//
//  CaptureVideoPreviewView.swift
//  ViviEmotionDetection
//
//  Created by Yebin Kim on 2021/03/04.
//

import AVFoundation
import UIKit

class CapturePreviewView: UIView {

    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
}
