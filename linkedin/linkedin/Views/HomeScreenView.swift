//
//  HomeScreenView.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        VStack(alignment: .leading){
            SearchBarView().padding(.trailing)
            Divider()
            HStack(spacing:10,content: {
                Image(systemName:"square.and.pencil").resizable().aspectRatio(contentMode: .fit).frame(width: 25,height: 25)
                Text("Start a Post").font(.title2)
                
            }).padding(.horizontal)
            Divider()
            HStack{
                           Image(systemName: "photo")
                               .foregroundColor(.blue)
                           Text("photo")
                           Spacer()
                           
                           Image(systemName: "video.fill")
                               .foregroundColor(.green)
                           Text("photo")
                           
                           Spacer()
                           Image(systemName: "calendar")
                               .foregroundColor(.orange)
                           Text("photo")
                       }.padding(.horizontal)
            ScrollView(.vertical,showsIndicators: false){
                ForEach(postData,id:\.id){post in
                    PostCardView(post: post)
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
