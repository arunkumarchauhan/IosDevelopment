//
//  SearchBarView.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack(spacing:10){
            Image("demo").resizable().aspectRatio(contentMode: .fit).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: 60,height: 60)
            RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.15)).frame(width: .infinity,height: 40).overlay(){
                HStack(spacing:10){
                    Image(systemName: "magnifyingglass") .resizable().aspectRatio(contentMode: .fit).foregroundStyle(.gray).frame(width: 30,height: 30)
                    Text("Search").font(.title2).foregroundStyle(.gray)
                    Spacer()
                    Image(systemName: "ellipsis.bubble.fill").resizable().aspectRatio(contentMode: .fit).foregroundStyle(.gray).frame(width: 30,height: 30)
                }.padding()
            }
          
            
        }
        
    }
}

#Preview {
    SearchBarView()
}
