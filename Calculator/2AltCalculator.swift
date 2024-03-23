//
//  2AltCalculator.swift
//  Calculator
//
//  Created by Carlos Román Alcaide on 23/3/24.
//

import SwiftUI

struct _AltCalculator: View {
    
    var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var operands = ["+"]
    @State private var inputToDisplay = ""
    @State private var inputToCalculate = 0
    @State private var summed = 0
    @State private var output = 0
    @State private var showOutput = false
    @State private var isSum = false
    
    var body: some View {
//        TextField("", value: $input, format: .number)
        TextField("", text: $inputToDisplay)
        HStack {
            ForEach(1..<4) { number in
                Button {
                    pressNumber(numbers[number])
                } label: {
                    Text("\(numbers[number])")
                }
                .frame(width: 30, height: 30)
                
            }
            
            Button {
                addUp()
            } label: {
                Text("+")
            }
            Button {
                equals()
            } label: {
                Text("=")
            }
        }
        Text(showOutput ? "\(output)" : "")
    }
    
    func pressNumber(_ number: Int) {
        inputToDisplay += "\(number)"
        inputToCalculate = Int(inputToDisplay) ?? 0
    }
    
    func addUp() {
        summed += inputToCalculate
        inputToDisplay = ""
        isSum = true
        print(summed)
    }
    
    func equals() {
        if isSum {
            summed += inputToCalculate
            output += summed
        }
        inputToDisplay = "0"
        inputToCalculate = 0
        summed = 0
        showOutput = true
    }
}

#Preview {
    _AltCalculator()
}
