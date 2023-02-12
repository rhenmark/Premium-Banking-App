//
//  CommonHelper.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 12/2/23.
//

import Foundation

struct CommonHelper {
    func getDateHour () -> Int {
        let hour = Calendar.current.component(.hour, from: Date())
        
        return hour;
    }
    
    func greetings () -> String {
        var message: String = "Good morning"
        
        switch getDateHour() {
            case 12 : message = "Good Noon"
            case 13..<17: message = "Good Afternoon"
            case 17..<24: message = "Good Evening"
        default: message = "Good Morning"
        }
        
        return message
    }
}
