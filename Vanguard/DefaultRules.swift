//
//  Rules.swift
//  AmiraElfahd
//
//  Created by AhmedTarek on 6/18/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import UIKit

public class NoRule: Rule {
    public var errorMessage: String? = ""
    
    public func validate(text: String) -> Bool {
        return true
    }
}

public class TwitterRule: Rule {
    let isRequired: Bool
    public var errorMessage: String?
    
    public init(isRequired: Bool = true, errorMessage: String? = nil) {
        self.isRequired = isRequired
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        if !isRequired && text.isEmpty {
            return true
        }
        
        return text.contains("twitter")
    }
}

public class FacebookRule: Rule {
    let isRequired: Bool
    public var errorMessage: String?
    
    public init(isRequired: Bool = true, errorMessage: String? = nil) {
        self.isRequired = isRequired
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        if !isRequired && text.isEmpty {
            return true
        }
        
        return text.contains("facebook")
    }
}

public class InstagramRule: Rule {
    
    let isRequired: Bool
    public var errorMessage: String?
    
    public init(isRequired: Bool = true, errorMessage: String? = nil) {
        self.isRequired = isRequired
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        if !isRequired && text.isEmpty {
            return true
        }
        
        return text.contains("instagram")
    }
}

public class UrlRule: Rule {
    
    let isRequired: Bool
    public var errorMessage: String?
    
    public init(isRequired: Bool = true, errorMessage: String? = nil) {
        self.isRequired = isRequired
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        if !isRequired && text.isEmpty {
            return true
        }
        if let url = URL(string: text) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
}

public class EmailRule: Rule {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    public var errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
}


public class NotEmptyRule: Rule {
    public var errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        return !text.isEmpty
    }
}


public class PhoneNumberRule: Rule {
    public var errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        let phoneRegEX = "^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\./0-9]*$"
        let phoneTest = NSPredicate.init(format: "SELF MATCHES %@", phoneRegEX)
        return phoneTest.evaluate(with: text)
    }
}

public class MinCharLengthRule: Rule {
    let min: Int
    public var errorMessage: String?
    
    public init(minLength: Int, errorMessage: String? = nil) {
        min = minLength
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        return text.count >= min
    }
}

public class NumericRule: Rule {
    public var errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        var number = Double(text)
        return number != nil
    }
}

public class IsEmailOrPhone: Rule {
    public var errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        return EmailRule().validate(text: text) || NumericRule().validate(text: text)
    }
}

public class IsPasswordMatch: Rule {
    var textField: UITextField
    public var errorMessage: String?
    
    public init(textField: UITextField, errorMessage: String? = nil) {
        self.textField = textField
        self.errorMessage = errorMessage
    }
    
    public func validate(text: String) -> Bool {
        return textField.text == text
    }
}
