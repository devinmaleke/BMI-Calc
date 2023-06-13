//
//  HistoryView.swift
//  BMI_Calculator
//
//  Created by Devin Maleke on 20/03/23.
//

import SwiftUI

struct HistoryView: View {
    @Binding var bmiHistory: [BMI]
    var body: some View {
        List(bmiHistory) {BMI in VStack(alignment: .leading){
            Text("\(BMI.date.formatted(date: .abbreviated, time: .shortened))")
                .foregroundColor(.gray)
            
            Spacer().frame(height:15)
            
            HStack{
                Text(String(format: "%.2f", BMI.result))
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("\(BMI.categoryBMI())")
                    .font(.title2).foregroundColor(BMI.statusColor())
            }
            
            
        }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(bmiHistory: .constant([BMI(date:Date(), result: 15.20)]))
    }
}
