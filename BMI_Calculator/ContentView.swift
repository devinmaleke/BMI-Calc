//
//  ContentView.swift
//  BMI_Calculator
//
//  Created by Devin Maleke on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isCalculator = 0
    @State private var weight = 70.0
    @State private var height = 140.0
    @State private var bmiHistory=[BMI(date:Date(), result: 24.22)]
    
    var body: some View {
        NavigationView{
            VStack {
                Picker("What is your favorite color?", selection: $isCalculator) {
                                Text("Calculator").tag(0)
                                Text("History").tag(1)
                            }
                            .pickerStyle(.segmented)
                            .padding()
                            
                            
                if isCalculator == 0{
                    CalculatorView(
                        weight: $weight,
                        height: $height,
                        bmiHistory: $bmiHistory
                    )
                }else{
                    HistoryView(bmiHistory: $bmiHistory)
                }
            }
            .padding()
            .navigationTitle(Text("Body Mass Index"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
