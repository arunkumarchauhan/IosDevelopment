//
//  ItemModel.swift
//  TodoApp
//
//  Created by ACC3611701 on 06/08/24.
//

import Foundation
struct ItemModel:Identifiable,Codable{
    let title: String
    let isCompleted: Bool
    let id: String
    
    init(id: String=UUID().uuidString,title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
        self.id = id
    }
    
    
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
