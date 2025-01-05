//
//  InvitationSectionCardView.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import SwiftUI

struct InvitationSectionCardView: View {
    let invitations:[NetworkModel]
    var body: some View {
        VStack(alignment:.leading,spacing:10)
        {
            
            HStack {
                Text("Invitation").font(.title2).foregroundStyle(.blue)
                Spacer()
                Image(systemName: "chevron.right")
            }.padding(.horizontal)
            Divider()
            ForEach(invitations, id: \.id) { invite in
                InvitationTileView(invite: invite)
            }
        }
    }
}

#Preview {
    InvitationSectionCardView(invitations: networkData)
}
