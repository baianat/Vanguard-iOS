//
//  VanguardTextInputTheme.swift
//  Vanguard
//
//  Created by Ahmed Tarek on 8/27/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import Foundation
import UIKit

public protocol VanguardTextInputTheme {
    func setErrorTheme(_ input: UIView & UITextInput)
    func setNormalTheme(_ input: UIView & UITextInput)
}

public class DefaultTextInputTheme: VanguardTextInputTheme {
    public func setErrorTheme(_ input: UIView & UITextInput) {
        input.layer.borderColor = UIColor.red.cgColor
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 4
    }
    
    public func setNormalTheme(_ input: UIView & UITextInput) {
        input.layer.borderColor = UIColor.lightGray.cgColor
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 4
    }
    
    public init() {}
    
}
