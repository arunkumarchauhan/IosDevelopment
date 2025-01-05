//
//  FruitCardView.swift
//  shopping
//
//  Created by ACC3611701 on 15/07/24.
//

import SwiftUI


let image: FruitModel = FruitModel(id: 1, title: .orange, image: "apple", price: "$3.44", color: "1")

struct FruitCardView: View {
    let fruit:FruitModel
    var body: some View {
        
                ZStack(){
                    VStack(alignment: .leading,spacing:5){
                        Text(fruit.title.rawValue).font(.largeTitle).foregroundStyle(.black)
                        Text("\(fruit.price) each").font(.title2).foregroundStyle(.black)
                        
                        Spacer()
                    }.padding()
                        .frame(width: 200, height: 190, alignment: .center).background(Color(fruit.color)).cornerRadius(20)
                    
                    ZStack(content: {
                        Image(fruit.image).resizable().aspectRatio(contentMode:.fit).offset(y:70).frame(width: 140,height: 120,alignment: .center)
                    })
                    
                }.frame(width: 180,height: 270)
                }
}

#Preview {
    FruitCardView(fruit: image)
}
