//
//  AddView.swift
//  TodoApp
//
//  Created by ACC3611701 on 06/08/24.
//

import SwiftUI

struct AddView: View {
    //dismiss a view
    @Environment(\.presentationMode) var presentatiomMode
    @EnvironmentObject var listViewModel:ListViewModel
    
    @State var textFieldText:String=""
    @State var alertTitle:String=""
    @State var showAlert:Bool=false
    
    var body: some View {
        ScrollView(){
            VStack{
                TextField("Type Something here ...", text: $textFieldText).padding().frame(height: 55).background(Color(hue: 0.621, saturation:0.048, brightness: 0.916, opacity: 0.916)).cornerRadius(10)
                Button(action: {
                    saveButtonTapped()
                }, label: {
                    Text("Save").foregroundStyle(.white).font(.headline).frame(height: 55).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color.accentColor).clipShape(RoundedRectangle(cornerRadius: 10))
            }.padding(.all,16)
        }.navigationTitle("Add an Item")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonTapped(){
        if textIsValid(){
            listViewModel.addItem(Title: textFieldText)
            presentatiomMode.wrappedValue.dismiss()
        }
    }
    func textIsValid()->Bool{
        if textFieldText.count < 3 {
            alertTitle="Your to do item should contains at least 3 characters 😀"
            showAlert.toggle()
            return false
        }
        return true
                
    }
    func getAlert()->Alert{
      return  Alert(title: Text(alertTitle))
    }
}

#Preview {
    AddView()
}
