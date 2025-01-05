//
//  NearYouView.swift
//  shopping
//
//  Created by ACC3611701 on 15/07/24.
//

import SwiftUI

struct NearYouView: View {
    let dataArray: [PlacesModel] = [
        .init(id: 0, name: "Food 365 Valley", time: "9:00 - 10:00", rating: "★ 4.7 |📍 1.5 km", image: "1"),
        .init(id: 1, name: "Super Store", time: "8:00 - 10:00", rating: "★ 4.5 |📍 1.7 km", image: "2"),
        .init(id: 2, name: "Organic Farm", time: "6:00 - 11:00", rating: "★ 4.9 |📍 2.0 km", image: "3"),
        .init(id: 3, name: "Big Basket", time: "9:00 - 10:00", rating: "★ 3.7 |📍 2.2 km", image: "4"),
        .init(id: 4, name: "Easy Mart", time: "8:00 - 12:00", rating: "★ 4.7 |📍 2.7 km", image: "5"),
        .init(id: 5, name: "Let's Shop", time: "7:00 - 11:00", rating: "★ 4.0 |📍 3.0 km", image: "6")
    ]
    var body: some View {
        VStack(alignment:.leading,spacing:10){
            Text("Near You").font(.system(size: 30)).bold()
            ScrollView(.vertical,showsIndicators: false) {
                VStack(alignment:.center,spacing: 40){
                    ForEach(dataArray,id: \.id){place in
                        NearYouCardView(place: place)
                        
                    }
                }
            }
            
        }
    }
}

struct NearYouCardView:View {
    let place:PlacesModel
    var body: some View {
        HStack(alignment:.center,spacing: 10){
            Image(place.image).resizable().scaledToFit().padding(CGFloat()).frame(width: 120,height: 120).background(.gray.opacity(0.4)).clipShape(RoundedRectangle(cornerRadius: 25))
            VStack(alignment:.leading,spacing: 3){
                Text(place.name).font(.system(size: 20)).bold().foregroundStyle(.black)
                Text(place.time).font(.system(size: 20)).bold().foregroundStyle(.gray)
                Text(place.rating).font(.system(size: 20)).bold().foregroundStyle(.black)
                
            }
        }
        
        
    }
}

#Preview {
    NearYouView()
}
