//
//  AltCalculator.swift
//  Calculator
//
//  Created by Carlos Román Alcaide on 23/3/24.
//

import SwiftUI

struct AltCalculator: View {
    
    enum CalculatorButtons: String {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case zero = "0"
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case divide = "/"
        case equal = "="
        case clear = "AC"
    }
    
enum Operation {
    case add, subtract, multiply, divide, equal, none
}
    
    let buttons: [[CalculatorButtons]] = [
        [.one, .two, .three, .plus],
        [.four, .five, .six, .minus],
        [.seven, .eight, .nine, .multiply],
        [.zero, .divide, .clear, .equal]
    ]
    
    @State private var value = "0"
    @State private var currentOperation = Operation.none
    
    
    var body: some View {
        ZStack{
            VStack {
                Section {
                        TextField("", text:$value)
                            .font(.system(size: 36))
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .padding()
                }
                .frame(width: 300, height: 70)
                .background(.lightGray)
                .cornerRadius(10)
                .padding(10)
                
                Section {
                    ForEach(buttons, id: \.self) { row in
                        HStack {
                            ForEach(row, id: \.self) { item in
                                Button {
                                    buttonTapped(button: item)
                                } label: {
                                    Text("\(item.rawValue)")
                                        .font(.system(size: 38))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                }
                                .frame(width: 70, height: 70)
                                .padding(5)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.lightBlue)
    }

    func buttonTapped(button: CalculatorButtons) {
        switch button {
        case .plus, .minus, .multiply, .divide, .equal:
            break
        case .clear:
            value = "0"
        default:
            let number = button.rawValue
            if value == "0" {
                value = number
            } else {
                value = "\(value)\(number)"
            }
        }
    }
    
}

#Preview {
    AltCalculator()
}
