//
//  SocialViewModel.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import Foundation
struct SocialViewModel {
    var ids: Int
    var image: String
    var title: String
}

var socialView: [SocialViewModel] = [
    .init(ids: 0, image: "hand.thumbsup", title: "Like"),
    .init(ids: 1, image: "text.bubble", title: "Comment"),
    .init(ids: 2, image: "arrow.turn.up.right", title: "Share"),
    .init(ids: 3, image: "paperplane.fill", title: "Send")
]
