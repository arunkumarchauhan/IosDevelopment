//
//  PokeCell.swift
//  pokemon09
//
//  Created by ACC3611701 on 10/08/24.
//

import SwiftUI
import Kingfisher
struct PokeCell: View {
    let pokemon: Pokemon
    @EnvironmentObject var pokeVm : PokemonViewModel
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            VStack(alignment:.leading,spacing:20){
                Text("Name: \(pokemon.name)").foregroundStyle(.white).font(.headline).fontWeight(.bold).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).lineLimit(3)
                Text("Height :  \(pokemon.height)").foregroundStyle(.white).font(.subheadline).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }.padding(20)
                .background(Color(pokeVm.backgroundColor(forType: pokemon.type))).clipShape(RoundedRectangle(cornerRadius: 20))
            KFImage(URL(string: pokemon.imageUrl)).resizable().scaledToFit().frame(width: 60,height: 60).offset(x: 10,y: 5)
            
        }.padding().frame(height:180)
            
            
    }
}

#Preview {
    PokeCell(pokemon: samplePoke)
}
