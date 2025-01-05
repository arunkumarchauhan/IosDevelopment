//
//  ListView.swift
//  TodoApp
//
//  Created by ACC3611701 on 06/08/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listVirewModel:ListViewModel
    var body: some View {
        ZStack{
            if listVirewModel.items.isEmpty{
                NoListView()
            }
            else{
                List{
                    ForEach(listVirewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                            withAnimation(.linear){
                                listVirewModel.update(item: item)
                            }
                        }
                        
                    }
                   
                    .onDelete(perform:listVirewModel.deleteItem)
                        .onMove(perform: listVirewModel.moveItem)
                    
                }
            }
        }.navigationTitle("Todo List 🖊️").navigationBarItems(leading: EditButton(),trailing: NavigationLink("Add", destination: {
            AddView()
        }))
    }
}

#Preview {
    ListView()
}
