//
//  Pokemon.swift
//  pokemon09
//
//  Created by ACC3611701 on 10/08/24.
//

import Foundation
import SwiftUI

struct Pokemon:Codable,Identifiable{
    let id : Int
    let name : String
    let type : String
    let weight : Int
    let height : Int
    let attack : Int
    let defense : Int
    let imageUrl : String
    
    func backgroundColor() -> UIColor {
        switch self.type {
            case "fire": return .orange
            case "poison": return .purple
            case "water": return .blue
            case "electric": return .yellow
            case "psychic": return .brown
            case "normal": return .magenta
            case "ground": return .green
            case "flying": return .cyan
            case "fairy": return .systemTeal
            default: return .systemPink
            }
        }
}

let samplePoke = Pokemon(id: 1, name: "Bulbasur", type: "Fire", weight:60 , height: 30, attack: 45, defense: 45, imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F62294490-1131-48DD-81E3-D328E54FAD12?alt=media&token=8aa9f6b8-3ee2-43a1-a48e-6e2218afc528")
