//
//  PostViewModel.swift
//  TestNav
//
//  Created by Максим Разумов on 08.09.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation

class PostViewModel {
    let name: String
    let geopos: String
    let countLike: Int
    let avatarURL: URL?
    let postURL: URL?
    let isLiked: Bool
    
    var onTapLike: ((_ isLiked: Bool) -> Void)?
    
    init(name: String,
         geopos: String,
         countLike: Int,
         avatarURL: URL?,
         postURL: URL?,
         isLiked: Bool) {
        self.name = name
        self.geopos = geopos
        self.countLike = countLike
        self.avatarURL = avatarURL
        self.postURL = postURL
        self.isLiked = isLiked

    }
}
