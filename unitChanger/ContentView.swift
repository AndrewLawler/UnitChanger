//
//  ContentView.swift
//  unitChanger
//
//  Created by Andrew Lawler on 11/12/2019.
//  Copyright © 2019 andrewlawler. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = ""
    @State private var inputUnit = 1
    @State private var outputUnit = 1
    
    let units = ["Metres", "Feet", "Inches"]
    
    var finalAmount: Double {
        let doubleValue = Double(inputValue) ?? 0
        // METRES
        if inputUnit == 0 {
            if outputUnit == 0 {
                return doubleValue
            }
            else if outputUnit == 1 {
                
                return doubleValue*3.281
            }
            else {
                return doubleValue*39.37
            }
        }
        // FEET
        else if inputUnit == 1 {
            if outputUnit == 0 {
                return doubleValue/3.281
            }
            else if outputUnit == 1 {
                return doubleValue
            }
            else {
                return doubleValue*12
            }
        }
        // INCHES
        else {
            if outputUnit == 0 {
                return doubleValue/39.97
            }
            else if outputUnit == 1 {
                return doubleValue/12
            }
            else {
                return doubleValue
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Main Inputs")) {
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit){
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $outputUnit){
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Final Output")){
                    Text("\(finalAmount, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("UnitChanger")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
