//
//  Person.swift
//  TestNav
//
//  Created by Максим Разумов on 08.09.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation
import UIKit

struct Post {
    let name: String
    let geopos: String
    var countLike: Int
    let avatarURL: URL?
    let postURL: URL?
    var isLiked: Bool
}
