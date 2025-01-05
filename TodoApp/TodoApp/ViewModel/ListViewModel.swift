//
//  ListViewModel.swift
//  TodoApp
//
//  Created by ACC3611701 on 06/08/24.
//

import Foundation
class ListViewModel:ObservableObject {
    @Published var items:[ItemModel] = [] {
        didSet{
            print(oldValue)
            print(items)
            saveItems()
    
        }
    }
    let itemsKey: String = "items_List"

    init(items: [ItemModel]) {
        self.items = items
    }
    func addItem(Title:String){
        let newItem=ItemModel(title: Title, isCompleted: false)
        items.append(newItem)
    }
    func update(item:ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index]=items[index].updateCompleted()
        }
    }
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from:IndexSet,to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else{
            return
        }
        if let decodedItems = try? JSONDecoder().decode([ItemModel].self, from: data){
            self.items = decodedItems
        }
    }
    func saveItems(){
        if let encodedData=try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
