//
//  CaptureVideoPreviewView.swift
//  ViviObjectRecognition
//
//  Created by Yebin Kim on 2021/02/06.
//

import AVFoundation
import UIKit

class CapturePreviewView: UIView {
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
}
