//
//  BMI.swift
//  BMI_Calculator
//
//  Created by Devin Maleke on 20/03/23.
//

import Foundation
import SwiftUI

struct BMI: Identifiable {
    let id = UUID()
    let date: Date
    let result: Double
    
    func categoryBMI()->String{
        switch(result){
        case 0..<18.5:
            return "Underweight"
        case 18.5..<25:
            return "Normal"
        case 25..<39.9:
            return "Overweight"
        default:
            return "Obese"
        }
    }
    
    func statusColor()->Color{
        switch(result){
        case 0..<18.5:
            return .blue
        case 18.5..<25:
            return .green
        case 25..<39.9:
            return .orange
        default:
            return .red
        }
    }
    
    
    
}
