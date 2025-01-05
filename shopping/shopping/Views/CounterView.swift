//
//  CounterView.swift
//  shopping
//
//  Created by ACC3611701 on 15/07/24.
//

import SwiftUI

struct CounterView: View {
    @State private var count:Int=0
    var body: some View {
        
        RoundedRectangle(cornerRadius: 8.0).fill(.gray.opacity(0.15)).overlay(content: {
            HStack(alignment:.center,spacing: 10){
                Button(action: {
                    if count==10{
                        return
                    }
                    self.count+=1
                }, label: {
                    Image(systemName: "plus").resizable().scaledToFit().foregroundStyle(.black)
//                    Text("+").font(.system(size: 25)).foregroundStyle(.black)
                })
                Spacer()
                Text("\(count)").font(.system(size: 25)).bold().foregroundStyle(.black)
                Spacer()
                Button(action: {
                    if count==0{
                        return
                    }
                    self.count-=1
                }, label: {
                    Image(systemName: "minus").resizable().scaledToFit().foregroundStyle(.black)
                   // Text("-").font(.system(size: 25)).foregroundStyle(.black)
                })
            }.padding()
        }).frame(width: 150,height: 50)
            }
}

#Preview {
    CounterView()
}
