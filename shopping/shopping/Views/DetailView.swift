//
//  DetailView.swift
//  shopping
//
//  Created by ACC3611701 on 15/07/24.
//

import SwiftUI


struct RoudedCornerShape:Shape{
    let corner:UIRectCorner
    let radius:CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner,cornerRadii:CGSize(width: radius, height: radius))
        return Path(path.cgPath)
        
        
    }
}
struct DetailView: View {
    @State var fruit:fruitTitle
    var body: some View {
        VStack(alignment:.leading,spacing: 20){
            Image("bg").resizable().edgesIgnoringSafeArea(.top).clipShape(RoudedCornerShape.init(corner: [.bottomLeft,.bottomRight], radius: 50)).frame(width: .infinity,height: .infinity,alignment: .top).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).shadow(color:.gray,radius: 5,y:5).overlay(content: {
                Image("\(fruit.rawValue)").resizable().frame(width: 250,height: 250).offset(y:60)
            })
          
            Spacer(minLength:60)
            Text("\(fruit.rawValue)-Medium").fontWeight(.medium).font(.system(size: 20)).foregroundStyle(.black).padding(.horizontal).textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
            Text("Each(500g - 700g)").padding(.horizontal)
            Text("Organic agriculture is intended to produce high quality, nutritious food that contributes to preventive health care and well-being. In view of this, it avoids the use of fertilizers, pesticides, animal drugs and food additives that may have adverse health effects.").font(.body).foregroundStyle(.black).fontWeight(.regular).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(6).padding(.horizontal)
            
            HStack(alignment:.center,spacing: 10){
                RoundedRectangle(cornerRadius: 8).fill(Color("bgColor")).opacity(0.15).overlay(alignment: .center, content: {
                    Image(systemName: "hourglass").resizable().aspectRatio(contentMode: .fit).padding().frame(width: 70,height: 70)
                }).frame(width: 80,height: 80)
                VStack(alignment: .leading, content: {
                    Text("Delivery Time").font(.title3)
                    Text("20 - 30 Min")
                })
                
                
            }.padding(.horizontal)
            HStack(){
                Text("$1.99").font(.largeTitle)
                Spacer()
                CounterView()
            }.padding(.horizontal)
            
            Image("bg").resizable().frame(width: .infinity,height: 50).clipShape( RoudedCornerShape.init(corner: [.topLeft,.topRight,.bottomLeft,.bottomRight], radius: 10)).padding(.horizontal).overlay(content: {
                Text("Add to cart").font(.title2).foregroundStyle(.black)
            }).shadow(color: .gray, radius: 5,x:5,y: 5)
            
    
            
         
            
        }
    }
}

#Preview {
    DetailView(fruit: .apple)
}
