//
//  UIDevice+Extension.swift
//  ViviEmotionDetection
//
//  Created by Yebin Kim on 2021/03/04.
//

import UIKit

extension UIDevice {

    private func exifOrientationForDeviceOrientation(_ deviceOrientation: UIDeviceOrientation) -> CGImagePropertyOrientation {

        switch deviceOrientation {
        case .portraitUpsideDown:
            return .rightMirrored

        case .landscapeLeft:
            return .downMirrored

        case .landscapeRight:
            return .upMirrored

        default:
            return .leftMirrored
        }
    }

    var exifOrientationForCurrentDeviceOrientation: CGImagePropertyOrientation {
        get {
            return exifOrientationForDeviceOrientation(UIDevice.current.orientation)
        }
    }
}
