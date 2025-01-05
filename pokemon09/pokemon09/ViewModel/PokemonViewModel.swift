//
//  PokemonViewModel.swift
//  pokemon09
//
//  Created by ACC3611701 on 10/08/24.
//

import Foundation

import SwiftUI

class PokemonViewModel : ObservableObject{
    @Published var pokemons : [Pokemon] = []
    let baseurl="https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        guard let url =  URL(string:baseurl) else{
            return
        }
        URLSession.shared.dataTask(with: url)
        {(data, response, error) in
            
            guard let data = data?.parsedData(removeString : "null," ) else {
                return             }
            
            guard let pokemon = try? JSONDecoder().decode( [ Pokemon ].self , from: data ) else {
                return
            }
            self.pokemons = pokemon
                
        }.resume()
        print(self.pokemons.count)
        
    }
    func backgroundColor(forType type: String) -> UIColor {
            switch type {
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


extension Data{
    func parsedData(removeString string : String) ->  Data? {
                
        guard let dataString = String(data : self , encoding : .utf8 ) else {
            return nil
        }
        let replacedString =  dataString.replacingOccurrences(of : string, with : "")
        
        guard  let  dataToString = replacedString.data(using : .utf8) else {
            return nil
        }
       return dataToString
        
    }
}
