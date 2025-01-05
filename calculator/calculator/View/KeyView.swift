//
//  KeyView.swift
//  calculator
//
//  Created by ACC3611701 on 09/07/24.
//

import SwiftUI

struct KeyView: View {
    @State var value="0"
    @State var runningNumber=0
    @State var currentOperation:Operation = .none
    @State var changeColor=false
    let buttons:[[Keys]]=[
        [.clear,.negative,.percent,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.six,.subtract],
        [.one,.two,.three,.add],
        [.zero,.decimal,.equal],
    ]
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15).foregroundStyle(changeColor ? Color("num").opacity(0.4):Color.pink.opacity(0.2)).scaleEffect(changeColor ? 1.5:1).animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor).onAppear(perform:{
                self.changeColor.toggle()
            }).frame(width: .infinity,height: 300)
                .overlay(content:{
                    Text(value).bold().font(.system(size: 100)).foregroundStyle(.black)
                    
                }).padding(.all,40)
            
            ForEach(buttons, id: \.self){row in
                HStack(spacing:10){
                    ForEach(row,id:\.self){elem in
                        Button(action: {
                            self.didTap(button: elem)
                        }, label: {
                            Text(elem.rawValue).font(.system(size: 30))
                                .foregroundStyle(.black)
                                .frame(width: self.getWidth(elem:elem), height: self.getHeight(elem:elem)).background(elem.buttonColor).shadow(color: .pink, radius: 30, x: 0, y: 0)
                        }).mask {
                            RoundedRectangle(cornerRadius: 30)
                            // or Capsule()
                        }
                        
                    }
                }
                
            }.padding(.bottom,10)
            
        }
    }
    func getWidth(elem:Keys) ->CGFloat{
        if elem == .zero{
            return getWidth(elem: .seven) * 2
        }
        return (((UIScreen.main.bounds.width)-( 5 * 10 )) / 4)
    }
    
    func didTap(button:Keys){
        switch button{
        case .multiply,.divide,.subtract,.add,.equal:

            if button == .add{
                self.currentOperation = Operation.add
                self.runningNumber = Int(self.value) ?? 0

            }
            else if button == .subtract{
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0

            }
            else if button == .multiply{
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0

            }
            else if button == .divide{
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0

            }
            else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation{
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .subtract:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
                
            }
            if button != .equal{
                self.value="0"
            }
        case .clear:
            self.value = "0"
        case .decimal,.negative,.percent:
            break
        default:
            let number = button.rawValue
            self.value = number
            
        }
    }
    func getHeight(elem:Keys) -> CGFloat{
        return (((UIScreen.main.bounds.width)-( 5 * 10 )) / 5)
    }
}

#Preview {
    KeyView()
}
