//
//  Vanguard.swift
//  Vanguard
//
//  Created by AhmedTarek on 6/18/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation
import UIKit

public protocol VanguardDelegate: AnyObject {
    
    func vanguard(_ vanguard: Vanguard, textDidChange newText: String, for input: UITextInput, with status: Bool, andError message: String?)
    
    func vanguard(_ vanguard: Vanguard, didChange formStatus: Bool)
    
}
 
public class Vanguard: ValidationCaseDelegate {
    
    private var cases = [ValidationCase]()
    
    private var isValid = false
    
    public weak var delegate: VanguardDelegate?
    
    public static func validate(_ cases: ValidationCase...) -> Vanguard {
        return Vanguard(validate: cases)
    }
    
    public init(validate cases: [ValidationCase], delegate: VanguardDelegate? = nil) {
        self.cases = cases
        self.delegate = delegate
        startValidation()
    }
    
    init() {
        startValidation()
    }
    
    public func startValidation() {
        for validationCase in cases {
            validationCase.delegate = self
            validationCase.startValidation()
        }
        
    }
    
    public func stopValidation() {
        for validationCase in cases {
            validationCase.stopValidation()
        }
    }
    
   
    
    public func getFormStatus(shouldUpdate: Bool = false) -> Bool {
        for item in cases {
            if shouldUpdate {
                item.validateAndUpdate()
            }
            if !item.getStatus() {
                return false
            }
        }
        return true
    }
       
    func textDidChange(_ textInput: TextInputView, with status: Bool, andError meesage: String?) {
        delegate?.vanguard(self, textDidChange: textInput.getText(), for: textInput, with: status, andError: meesage)
        let formStatus = getFormStatus()
        if formStatus != isValid {
            isValid = formStatus
            delegate?.vanguard(self, didChange: formStatus)
        }
    }
    
    deinit {
        stopValidation()
        cases.removeAll()
    }
}
