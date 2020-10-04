//
//  ObservableText.swift
//  Vanguard
//
//  Created by Ahmed Tarek on 8/27/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import Foundation
import UIKit

protocol ObservableDelegate: AnyObject {
    func textDidChange(_ textInput: TextInputView, with status: Bool, andError message: String?)
}

class ObservableText: NSObject {
    private let textInput: TextInputView
    private let theme: VanguardTextInputTheme
    
    private var rules = [Rule]()
    
    var delegate: ObservableDelegate?
    
    var isValid = false
    var isStarted = false
    
    var errorMessage: String? = nil
    
    init(textInput: TextInputView, theme: VanguardTextInputTheme) {
        self.textInput = textInput
        self.theme = theme
        super.init()
        
        self.startValidation()
    }
    
    func isTheSameTextInput(textInput: TextInputView) -> Bool {
        return textInput == self.textInput
    }
    
    func startValidation() {
        //textInput.inputDelegate = self
        
        if let field = textInput as? UITextField {
            field.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        } else if let textView = textInput as? UITextView {
            textView.delegate = self
        }
    }
    
    func stopValidation() {
        //textInput.inputDelegate = nil
        if let field = textInput as? UITextField {
            field.removeTarget(self, action: #selector(textDidChange), for: .editingChanged)
        } else if let textView = textInput as? UITextView {
            textView.delegate = nil
        }
    }
    
    @objc func textDidChange() {
        validateAndUpdate()
        delegate?.textDidChange(textInput, with: isValid, andError: errorMessage)
    }
    
    func validateAndUpdate() {
        isStarted = true
        isValid = validate()
        if isValid {
            theme.setNormalTheme(textInput)
        } else {
            theme.setErrorTheme(textInput)
        }
    }
    
    func validate() -> Bool {
        errorMessage = nil
        var errors = [String]()
        
        let isValid = rules.reduce(true) { (previous, rule) -> Bool in
            let success = rule.validate(text: textInput.getText())
            if !success {
                errors.append(rule.errorMessage ?? "")
            }
            return previous && success
        }
        
        if !errors.isEmpty {
            errorMessage = errors.joined(separator: "\n")
        }
        
        return isValid
    }
    
    
    func addRule(rule: Rule) {
        rules.append(rule)
    }
    
    func addRules(rules: [Rule]) {
        self.rules.append(contentsOf: rules)
    }
    
    func removeRules() {
        rules.removeAll()
    }
}


extension ObservableText: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        textDidChange()
    }
}
