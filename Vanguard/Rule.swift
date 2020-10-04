//
//  Rule.swift
//  AmiraElfahd
//
//  Created by AhmedTarek on 6/18/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import Foundation

public protocol Rule {
    
    var errorMessage: String? { get }
    
    func validate(text: String) -> Bool
    
}
