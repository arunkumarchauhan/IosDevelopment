//
//  ContentView.swift
//  slotmachine
//
//  Created by ACC3611701 on 07/07/24.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
        let p1=CGPoint(x: 0, y: 20)
            let p2=CGPoint(x: 0, y:rect.height-20)
            let p3=CGPoint(x: rect.width/2, y: rect.height)
            let p4=CGPoint(x:rect.width , y: rect.height-20)
            let p5=CGPoint(x: rect.width, y: 20)
            let p6=CGPoint(x: rect.width/2, y: 0)
            path.move(to: p6)
            let radius:CGFloat=20.0
            path.addArc(tangent1End: p1, tangent2End: p2, radius: radius)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: radius)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: radius)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: radius)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: radius)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: radius)
            
        }
    }
    
  
}
enum Choice : Int,Identifiable{
    var id:Int {
        rawValue
    }
    case sucess,failure
}

struct ContentView: View {
    @State public var symbols=["eating","happy","love"]
    @State public var numbers=[0,1,2]
    @State public var counter=0
    @State private var showingAlert:Choice?
    @State private var alertVisible:Bool=false
    
    var body: some View {
        ZStack(alignment: .center){
            Image("sunshine").resizable().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/ )
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 50){
                HStack(alignment:.center,spacing: 20){
                    Image("fire").resizable().scaledToFit().shadow(color: .orange,radius: 1,y:3)
                    Text("SLOT MACHINE").fontWeight(.black).font(.title3)
                    Image("fire").resizable().scaledToFit()
                        .shadow(color: .orange,radius: 1,y:3)
                }.frame(width: .infinity,height: 50)
                
                HStack(alignment: .center,spacing: 35){
                    Hexagon().fill(.gray.opacity(0.5)).overlay(alignment: .center, content: {
                        Image(self.symbols[numbers[0]]).resizable().scaledToFit().frame(width: 80,height: 70).shadow(color: .orange, radius: 5,x:4,y: 5)
                    }).frame(width: 100,height: 120)
                    
                    Hexagon().fill(.gray.opacity(0.5)).overlay(alignment: .center, content: {
                        Image(self.symbols[numbers[1]]).resizable().scaledToFit().frame(width: 80,height: 70).shadow(color: .orange, radius: 5,x:4,y: 5)
                    }).frame(width: 100,height: 120)
                    
                }
                
                
                Hexagon().fill(.gray.opacity(0.5)).overlay(alignment: .center, content: {
                    Image(self.symbols[numbers[2]]).resizable().scaledToFit().frame(width: 80,height: 70).shadow(color: .orange, radius: 5,x:4,y: 5)
                }).frame(width: 100,height: 120)
                HStack(alignment: .center,spacing: 35){
                    Hexagon().fill(.gray.opacity(0.5)).overlay(alignment: .center, content: {
                        Image(self.symbols[numbers[0]]).resizable().scaledToFit().frame(width: 80,height: 70).shadow(color: .orange, radius: 5,x:4,y: 5)
                    }).frame(width: 100,height: 120)
                    
                    Hexagon().fill(.gray.opacity(0.5)).overlay(alignment: .center, content: {
                        Image(self.symbols[numbers[1]]).resizable().scaledToFit().frame(width: 80,height: 70).shadow(color: .orange, radius: 5,x:4,y: 5)
                    }).frame(width: 100,height: 120)
                    
                }
                Button(action: {
                    numbers[0]=Int.random(in: 0...symbols.count-1)
                    numbers[1]=Int.random(in: 0...symbols.count-1)
                    numbers[2]=Int.random(in: 0...symbols.count-1)
                    counter+=1
                    if numbers[0] == numbers[1] && numbers[1] == numbers[2]{
                        self.showingAlert = .sucess
                        alertVisible=true
                        counter=0
                    }

                    else if counter>5{
                        self.showingAlert = .failure
                        alertVisible=true
                        counter=0
                    }
                    else{
                        alertVisible=false
                    }

                    
                    
                }, label: {
                    RoundedRectangle(cornerRadius: 10).fill(.color) .overlay(alignment:.center){
                        Text("Spin").fontWeight(.black).font(.title3).foregroundStyle(.black)
                        
                    }.frame(width: 200,height: 50,alignment: .center).shadow(color:.gray,radius: 4,y: 4)
                })
            }
            .alert(isPresented: $alertVisible , content:{
                switch showingAlert{
                case .sucess:
                    return Alert(title: Text("Yeaah!.you won."), message:Text("Born with the charm"), dismissButton: .cancel())
                case .failure:
                    return Alert(title: Text("OOps!"), message:Text("Better luck next time"), dismissButton: .cancel())

                    
                case .none:
                    return Alert(title: Text("OOps!"), message:Text("Better luck next time"), dismissButton: .cancel())

                }
                
                
            })
        }
    }
}

#Preview {
    ContentView()
}
