//
//  AltCalculator.swift
//  Calculator
//
//  Created by Carlos Román Alcaide on 23/3/24.
//

import SwiftUI

struct AltCalculator: View {
    
    var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    @State private var inputToDisplay = ""
    @State private var inputToCalculate = 0
    @State private var output = 0
    @State private var summed = 0
    @State private var showOutput = false
    @State private var isSum = false
    
    var body: some View {
        ZStack{
            VStack {
                VStack {
                    VStack {
                        Section {
                            TextField("", text:$inputToDisplay)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                
                        }
                        Section {
                            Text(showOutput ? "\(output)" : "")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                        }
                        .frame(width: 250, height: 70)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(5)
                    }
                }
                .frame(width: 250, height: 70)
                .padding(5)
                HStack {
                    ForEach(1..<4) { number in
                        Button {
                            addInput(numbers[number])
                        } label: {
                            Text("\(numbers[number])")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                        .frame(width: 70, height: 70)
                        .padding(5)
                    }
                    
                    Button {
                        addUp()
                    } label: {
                        Text("+")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 70, height: 70)
                    .padding(5)
                    
                    
                }
                
                HStack {
                    ForEach(4..<7) { number in
                        Button {
                            addInput(numbers[number])
                        } label: {
                            Text("\(numbers[number])")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                        .frame(width: 70, height: 70)
                        .padding(5)
                    }
                    
                    Button {

                    } label: {
                        Text("-")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 70, height: 70)
                    .padding(5)
                    
                    
                }
                
                HStack {
                    ForEach(7..<10) { number in
                        Button {
                            addInput(numbers[number])
                        } label: {
                            Text("\(numbers[number])")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                        .frame(width: 70, height: 70)
                        .padding(5)
                    }
                    
                    Button {

                    } label: {
                        Text("*")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 70, height: 70)
                    .padding(5)
                    
                    
                }
                
                HStack {
                    Button {
                        addInput(0)
                    } label: {
                        Text("\(numbers[0])")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 70, height: 70)
                    .padding(5)
                    
                    Button {

                    } label: {
                        Text("/")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 70, height: 70)
                    .padding(5)
                    
                    Button {
                        clear()

                    } label: {
                        Text("c")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 70, height: 70)
                    .padding(5)
                    
                    Button {
                        equals()
                    } label: {
                        Text("=")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 70, height: 70)
                    .padding(5)
                    
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lightBlue)
    }

    func clear() {
        inputToDisplay = ""
        showOutput = false
    }
    
    func addInput(_ number: Int) {
        inputToDisplay = ""
        inputToDisplay += "\(number)"
        inputToCalculate = Int(inputToDisplay) ?? 0
    }
    
    func addUp() {
        summed += inputToCalculate
        isSum = true
        inputToDisplay = ""
        print(summed)
    }
    
    func equals() {
        if isSum {
            summed += inputToCalculate
            output = summed
        }
        inputToDisplay = ""
        inputToCalculate = 0
        summed = 0
        showOutput = true
    }
    
}

#Preview {
    AltCalculator()
}
