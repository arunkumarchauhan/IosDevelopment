//
//  PokemonGridView.swift
//  pokemon09
//
//  Created by ACC3611701 on 10/08/24.
//

import SwiftUI

struct PokemonGridView: View {
    @ObservedObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView(){
            ZStack(){
                
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink
                    .opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(edges: .all)
                ScrollView(){
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], spacing:16){
                        ForEach(pokemonViewModel.pokemons,id: \.id){
                            pokemon in
                            
                            NavigationLink(destination: {
                                PokemonDetailView(pokemon: pokemon)
                            }, label: {
                                PokeCell(pokemon: pokemon)
                            })
                         
                        }
                    }
                }.navigationTitle("Pokemon :  \(pokemonViewModel.pokemons.count)")
            }
        }.navigationBarHidden(true).environmentObject(pokemonViewModel)
    }
}

#Preview {
    PokemonGridView(pokemonViewModel : PokemonViewModel())
}
