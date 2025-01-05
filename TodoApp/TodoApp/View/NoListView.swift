//
//  NoListView.swift
//  TodoApp
//
//  Created by ACC3611701 on 06/08/24.
//

import SwiftUI

struct NoListView: View {
    @State var animate:Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                Text("There is no items !!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                
                Text("Be more productive and add some todos to finish them on time").padding(.bottom,20)
                
                NavigationLink(destination: {
                    AddView()
                }) {
                    Text("Add Something 😀").foregroundColor(.black).font(.headline).frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(animate ?
                                Color("NewColor"):
                                    Color.accentColor)
                    .cornerRadius(10)
                }.padding(.horizontal,animate ? 30:50).shadow(color: animate ? Color("NewColor").opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30:50, x:0 , y: animate ? 30:50)
            }.multilineTextAlignment(.center).padding(40).onAppear(perform:addAnimation)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
    }
    func addAnimation(){
        guard  !animate else{
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            withAnimation(
                Animation.easeInOut(duration: 2.0).repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoListView()
}
