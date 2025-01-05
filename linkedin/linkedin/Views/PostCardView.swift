//
//  PostCardView.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import SwiftUI



struct PostCardView: View {
    let post:PostData
    var body: some View {
        VStack(spacing:10){
            HStack(spacing:10){
                Image(post.profileImage).resizable().aspectRatio(contentMode: .fit).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: 100,height: 100)
                VStack(alignment:.leading){
                    Text(post.title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("\(post.followers) followers").font(.title3).foregroundStyle(.gray)
                    
                    Text("8m").font(.subheadline).foregroundStyle(.gray)
                    
                    
                    
                }
                Spacer()
                Image(systemName: "ellipsis").resizable().aspectRatio(contentMode: .fit).frame(width: 30,height: 30)
            }.padding(.trailing)
            Text("Looking for IOS-15 online course?Learn Swift UI on Udemy.")
            Image(post.Image).resizable().aspectRatio(contentMode: .fit)
            Divider()
            HStack(alignment:.center,spacing:50){
                ForEach(socialView,id: \.ids){social in
                    PostAction(social: social)
                }
            }
        }
    }
}

#Preview {
    PostCardView(post: postData.first!)
}
