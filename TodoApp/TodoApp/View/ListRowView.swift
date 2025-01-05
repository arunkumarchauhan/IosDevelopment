//
//  ListRowView.swift
//  TodoApp
//
//  Created by ACC3611701 on 06/08/24.
//

import SwiftUI

struct ListRowView: View {
    var item:ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle").foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2).padding(.vertical,8)
    }
}
var item1 = ItemModel(title: "Titke", isCompleted: false)
var item2 = ItemModel(title: "Titke", isCompleted: true)
#Preview {
  
    Group(){
        ListRowView(item: item1)
        ListRowView(item: item2)
    }.previewLayout(.sizeThatFits)
}
