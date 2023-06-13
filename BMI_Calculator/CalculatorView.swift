//
//  CalculatorView.swift
//  BMI_Calculator
//
//  Created by Devin Maleke on 20/03/23.
//

import SwiftUI

struct CalculatorView: View {
    @Binding var weight: Double 
    @Binding var height: Double
    @Binding var bmiHistory: [BMI]
    
    var body: some View {
        VStack{
            HStack{
                Text("Weight (Kg)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%g", weight.rounded()))")
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
            }
            Slider(value: $weight, in: 45...120)
            HStack{
                Text("height (Cm)")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%g", height.rounded()))")
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
            }
            Slider(value: $height, in: 100...210)
            
            HStack{
                Text("Your Body Mass Index")
                    .font(.body)
                    .foregroundColor(.gray)
                Spacer()
                
                VStack (alignment:.trailing){
                    Text("\(String(format: "%.2f", calculateBMI()))")
                        .font(.title2)
                        .foregroundColor(.black)
                    .bold()
                    
                    Text(categoryBMI())
                        .foregroundColor(statusColor())
                }
            }
            Button {
                let newBMI = BMI(date: Date(), result: calculateBMI())
                bmiHistory.insert(newBMI, at: 0)
            }label: {
                Text("Save to History")
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            Spacer()
            
            
        }
        .padding()
        
    }
    
    func calculateBMI() -> Double{
        return weight * 10_000/(height*height)
    }
    func categoryBMI() -> String{
        switch(calculateBMI()){
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
        switch(calculateBMI()){
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



struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(
            weight: .constant(70),
            height: .constant(140),
            bmiHistory: .constant([])
        )
    }
}
