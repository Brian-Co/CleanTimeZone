//
//  UIView+Extensions.swift
//  CleanTimeZone
//
//  Created by Brian Corrieri on 20/04/2020.
//  Copyright © 2020 Brian-Co. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func activityIndicator() -> UIActivityIndicatorView {
        let frame = CGRect(x: self.frame.midX, y: self.frame.midY, width: 20, height: 20)
        let indicator = UIActivityIndicatorView(frame: frame)
        indicator.hidesWhenStopped = true
        self.addSubview(indicator)
        indicator.startAnimating()
        return indicator
    }
    
}
