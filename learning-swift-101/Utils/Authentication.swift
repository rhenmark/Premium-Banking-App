//
//  Authentication.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 10/3/23.
//

import Foundation
import LocalAuthentication

struct Authentication {
    func faceIdAuth() -> Bool {
        let ctx = LAContext()
        var error: NSError?
        var isAuthenticated = false
        
        if ctx.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Test biometrics login"
            
            ctx.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                if success {
                    isAuthenticated = true
                } else {
                    isAuthenticated = false
                }
            }
            
        } else {
            return false
        }
        
        return isAuthenticated
    }
}
