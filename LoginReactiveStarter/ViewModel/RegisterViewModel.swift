//
//  RegisterViewModel.swift
//  LoginReactiveStarter
//
//  Created by Brian Voong on 7/5/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import Foundation

class RegisterViewModel {
    
    var username: String? {
        didSet {
            emitValidity()
        }
    }
    
    var password: String? {
        didSet {
            emitValidity()
        }
    }
    
    fileprivate func emitValidity() {
        let isValid = username?.isEmpty == false && password?.isEmpty == false
        isValidListener?(isValid)
    }
    
    // use a hook to check for form valid
    var isValidListener: ((Bool) -> ())?
    
}
