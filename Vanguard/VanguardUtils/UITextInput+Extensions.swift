//
//  UITextInput+Extensions.swift
//  Vanguard
//
//  Created by Ahmed Tarek on 9/8/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import Foundation
import UIKit

extension UITextInput {
    func getText() -> String {
        let start = beginningOfDocument
        let end = endOfDocument
        guard let range = textRange(from: start, to: end) else {
            return ""
        }
        
        return text(in: range) ?? ""
    }
}
