//
//  MyNetworkScreenView.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import SwiftUI

struct MyNetworkScreenView: View {
    var body: some View {
        VStack (spacing:10){
            SearchBarView()
            HStack(spacing:10){
                Text("Manage my network").font(.title2).foregroundStyle(.blue)
                Spacer()
                Image(systemName: "chevron.right")
            }.padding(.horizontal)
            RoundedRectangle(cornerRadius: 0).fill(.gray.opacity(0.6)).frame(width: .infinity,height: 10)
            ScrollView(.vertical,showsIndicators: false){
                InvitationSectionCardView(invitations: networkData)
            }
            
        }
    }
}

#Preview {
    MyNetworkScreenView()
}
