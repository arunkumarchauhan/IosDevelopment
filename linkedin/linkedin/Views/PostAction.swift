//
//  PostAction.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import SwiftUI

struct PostAction: View {
    let social:SocialViewModel
    var body: some View {
        VStack(alignment:.center,spacing: 2){
            Image(systemName:social.image)
            Text(social.title)
        }
    }
}

#Preview {
    PostAction(social: socialView.first!)
}
