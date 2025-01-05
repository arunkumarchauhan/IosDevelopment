//
//  PokemonDetailView.swift
//  pokemon09
//
//  Created by ACC3611701 on 10/08/24.
//

import SwiftUI
import Kingfisher
struct PokemonDetailView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack(spacing:20){
            Text("Name : \(pokemon.name)")
            Text("Height : \(pokemon.height)")
            Text("Weight : \(pokemon.weight)")
            KFImage(URL(string: pokemon.imageUrl)).frame(width: .infinity,height: 200)
        }.padding()
    }
}

#Preview {
    PokemonDetailView(pokemon: samplePoke)
}
