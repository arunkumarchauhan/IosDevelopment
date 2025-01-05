//
//  InvitationTileView.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import SwiftUI

struct InvitationTileView: View {
    let invite:NetworkModel
    var body: some View {
        VStack (alignment:.leading){
            HStack(alignment:.center,spacing: 10){
                Image(invite.image).resizable().aspectRatio(contentMode: .fit).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width:80,height:80)
                VStack(alignment:.leading,spacing: 2){
                    Text("\(invite.name)").font(.title2)
                    Text("\(invite.position)").font(.subheadline).foregroundStyle(.gray)
                    Text("🔗 \(invite.mutual) mutual connections").font(.caption).foregroundStyle(.gray.opacity(0.9))
                 
                    

                }
                Spacer()
                HStack(alignment:.center,spacing: 10){
                    Image(systemName: "multiply.circle").font(.system(size: 35)).foregroundStyle(.gray)

                    Image(systemName: "checkmark.circle").font(.system(size: 35)).foregroundStyle(.blue)

                }
            }.padding(.horizontal)
            Divider()
        }
    }
}

#Preview {
    InvitationTileView(invite: networkData.first!)
}
