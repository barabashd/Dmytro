//
//  ViewController.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    var brain = CalculatorBrain()
    var dot: Double = 1
    
    func touchButton(symbol: String) {
        if (outputController?.isResult)! {
            outputController?.appendSymbol(symbol: String((Double(brain.stack[0]) == Double(Int(Double(brain.stack[0])!))) ? String(Int(Double(brain.stack[0])!)) : symbol))
            
            outputController?.isResult = false
        }
        if brain.stack == [] {
            CalculatorBrain.counter -= 1
        }
        switch symbol {
        case "+":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.binary(operation: .Plus)
        case "-":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.binary(operation: .Minus)
        case "✕":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.binary(operation: .Mul)
            print(symbol)
        case "÷":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.binary(operation: .Div)
        case "^":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.binary(operation: .Power)
        case "%":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.binary(operation: .Mod)
        case "√":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Sqrt)
        case "!":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Fact)
        case "sin":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Sin)
        case "cos":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Cos)
        case "tg":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Tg)
        case "ctg":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Ctg)
        case "sinh":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Sinh)
        case "cosh":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Cosh)
        case "tgh":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Tgh)
        case "ctgh":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Ctgh)
        case "ln":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            print(CalculatorBrain.counter)
            brain.unary(operation: .Ln)
        case "log":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Log)
        case "+/-":
            outputController?.clearLastNumber(symbol: brain.stack[CalculatorBrain.counter])
            print(CalculatorBrain.counter)
            brain.stack[CalculatorBrain.counter] = String(Double(brain.stack[CalculatorBrain.counter])!*(-1))
            outputController?.appendSymbol(symbol: brain.stack[CalculatorBrain.counter])
        case "π":
            outputController?.appendSymbol(symbol: String(M_PI))
            brain.stack.append(String(M_PI))
            CalculatorBrain.counter += 1
        case "e":
            outputController?.appendSymbol(symbol: String(M_E))
            brain.stack.append(String(M_E))
            CalculatorBrain.counter += 1
        case ".":
            outputController?.appendSymbol(symbol: symbol)
            brain.utility(operation: .Dot)
            dot *= 0.1
        case "C":
            outputController?.clearScreen()
            brain.stack = []
            CalculatorBrain.counter = 0
            brain.utility(operation: .Clean)
            brain.res = 0
        case "⌫":
            outputController?.clearLastSymbol()
            print(CalculatorBrain.counter)
            var smth: Int? = Int(brain.stack[CalculatorBrain.counter])
            if smth == nil || smth!/10 == 0 {
                brain.stack.remove(at: CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
            } else {
                brain.stack[CalculatorBrain.counter].remove(at: brain.stack[CalculatorBrain.counter].index(before: brain.stack[CalculatorBrain.counter].endIndex))
            }
            brain.utility(operation: .CleanLast)
        case "=":
            outputController?.appendSymbol(symbol: symbol)
            brain.utility(operation: .Equal)
        default:
            if outputController?.display.text == "0" {
                outputController?.clearScreen()
            }
            
            outputController?.appendSymbol(symbol: symbol)
            print(CalculatorBrain.counter)
            if CalculatorBrain.counter >= -1 {
                if CalculatorBrain.counter == -1 {
                    CalculatorBrain.counter += 1
                } else {
                    var smth: Int? = Int(brain.stack[CalculatorBrain.counter])
                    if smth == nil {
                        CalculatorBrain.counter += 1
                    }
                }
                
            }
//            print("\(brain.stack.count) != \(CalculatorBrain.counter)")
            if brain.stack.count == CalculatorBrain.counter {
                brain.stack.append(symbol)
                dot = 1
            } else if dot == 1{
                brain.stack[CalculatorBrain.counter] = String(Int(String(brain.stack[CalculatorBrain.counter]))! * 10 + Int(symbol)!)
            } else if dot < 1 {
                brain.stack[CalculatorBrain.counter] = String(Double(String(brain.stack[CalculatorBrain.counter]))! + Double(symbol)!*dot)
                dot *= 0.1
            }
            brain.digit(value: Double(symbol)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.result = { (value, error)->() in
            if (value != nil) {
                self.outputController?.setResult(symbol: "\(value!)")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerSegue" {
            outputController = segue.destination as? OutputController
            outputController?.viewController = self
        } else if segue.identifier == "InputControllerSegue" {
            inputController = segue.destination as? InputController
            inputController?.viewController = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

