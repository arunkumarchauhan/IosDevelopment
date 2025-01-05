//
//  ContentView.swift
//  BreakingBad08
//
//  Created by ACC3611701 on 08/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var infos:[University]=[]
    var body: some View {
        VStack {
            NavigationView{
                List(infos,id:\.name){
                    info in
                    VStack(alignment:.leading){
                        Text("name \(info.name ?? "")")
                        Text("alpha_two_code \(info.alpha_two_code ?? "")")
                        Text("country : \(info.country ?? "")")
                        Text("state_province \(info.alpha_two_code ?? "")")
                        Text("state_province \(info.state_province ?? "")")
                    }
                    
                }.task {
                    await fetchData()
                }
            }.navigationTitle("Breaking Bad")
        }
        .padding()
    }
    func fetchData()async{
        guard let url:URL = URL(string: "http://universities.hipolabs.com/search?country=United States") else{
            print("URL Does not exist")
            return
        }
        do{
        let (data, error) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([University].self, from: data) {
                infos=decodedResponse
            }
        }catch{
            print("Invalid data or failed to fetch request")
            
        }
        
    }
}

#Preview {
    ContentView()
}
