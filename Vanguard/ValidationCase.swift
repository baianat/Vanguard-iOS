//
//  ValidationCase.swift
//  Vanguard
//
//  Created by Ahmed Tarek on 8/27/20.
//  Copyright © 2020 Baianat. All rights reserved.
//

import Foundation
import UIKit

protocol ValidationCaseDelegate: AnyObject {
    func textDidChange(_ textInput: TextInputView, with status: Bool, andError meesage: String?)
}

public class ValidationCase: ObservableDelegate {
    
    
    
    private let observableInput: ObservableText
    var delegate: ValidationCaseDelegate?
    
    public init(watch textInput: TextInputView, with theme: VanguardTextInputTheme = DefaultTextInputTheme(), for rules: Rule...) {
        
        observableInput = ObservableText(textInput: textInput, theme: theme)
        observableInput.delegate = self
        observableInput.addRules(rules: rules)
    }
    
    public init(watch textInput: TextInputView, with theme: VanguardTextInputTheme = DefaultTextInputTheme(), for rules: [Rule]) {
        observableInput = ObservableText(textInput: textInput, theme: theme)
        observableInput.delegate = self
        observableInput.addRules(rules: rules)
    }
    
    func isTheSameTextInput(textInput: TextInputView) -> Bool {
        return observableInput.isTheSameTextInput(textInput: textInput)
    }
     
    ///to validate without update status
    func validate() -> Bool {
        return observableInput.validate()
    }
    
    func validateAndUpdate() {
        observableInput.validateAndUpdate()
    }
    
    ///to get the current status without validation
    func getStatus() -> Bool {
        return observableInput.validate()
    }
    
    func startValidation() {
        observableInput.startValidation()
    }
    
    func stopValidation() {
        observableInput.stopValidation()
    }
    
    func textDidChange(_ textInput: TextInputView, with status: Bool, andError message: String?) {
        delegate?.textDidChange(textInput, with: status, andError: message)
    }
}
