//
//  PostCell.swift
//  TestNav
//
//  Created by Максим Разумов on 08.09.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy
import Kingfisher

class PostCell: UITableViewCell {
    
    let nikNameLabel = UILabel()
    let geolocationLabel = UILabel()
    let likeLabel = UILabel()
    
    let likeButton = UIButton()
    let commentButton = UIButton()
    let forwardButton = UIButton()
    
    let personImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    let postImage = UIImageView()
    
    private var countLike: Int? = 0
    private var isLiked: Bool = false {
        didSet {
            if isLiked {
                likeButton.setImage(UIImage(named: "heart"), for: .normal)
            } else {
                likeButton.setImage(UIImage(named: "like"), for: .normal)
            }
        }
    }
    
    var onTapLike: ((_ isLiked: Bool) -> Void)?
    
    var viewModel: PostViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        
        
        commentButton.setImage(UIImage(named: "comment"), for: .normal)
        forwardButton.setImage(UIImage(named: "forward"), for: .normal)
        likeButton.addTarget(self, action: #selector(upCount(_:)), for: .touchUpInside)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        addSubview(geolocationLabel)
        addSubview(nikNameLabel)
        addSubview(likeLabel)
        addSubview(likeButton)
        addSubview(personImage)
        addSubview(postImage)
        addSubview(commentButton)
        addSubview(forwardButton)
        
        personImage.easy.layout(Top(20),
                                Leading(20),
                                Width(60),
                                Height(60))
        personImage.contentMode = .scaleAspectFill
        nikNameLabel.easy.layout(Top(20),
                                 Leading(20).to(personImage,.trailing))
        
        geolocationLabel.easy.layout(Top().to(nikNameLabel,.bottom),
                                     Leading(20).to(personImage,.trailing), CenterY().to(personImage,.centerY))
        
        postImage.easy.layout(Top(10).to(personImage,.bottom),
                              Leading(10),
                              Trailing(10),
                              Width(100),
                              Height(400))
        postImage.contentMode = .scaleAspectFill
        likeButton.easy.layout(Top(20).to(postImage,.bottom),
                               Leading(20),
                               Height(24),
                               Width(24))
        
        commentButton.easy.layout(CenterY().to(likeButton, .centerY),
                                  Leading(10).to(likeButton,.trailing),
                                  Height(24),
                                  Width(24))
        
        forwardButton.easy.layout(CenterY().to(likeButton, .centerY),
                                  Leading(10).to(commentButton,.trailing),
                                  Height(24),
                                  Width(24))
        
        likeLabel.easy.layout(Top(20).to(likeButton,.bottom),
                              Leading(20),
                              Bottom(10))
    }
    
    func setUp(viewModel: PostViewModel) {
        
        self.viewModel = viewModel
        
        onTapLike = self.viewModel?.onTapLike
        
        nikNameLabel.text = self.viewModel?.name
        geolocationLabel.text = self.viewModel?.geopos
        countLike = self.viewModel?.countLike
        isLiked = self.viewModel?.isLiked ?? false
        
        
        if let avatar = self.viewModel?.avatarURL {
            personImage.kf.setImage(with: avatar)
        }
        if let post = self.viewModel?.postURL {
            postImage.kf.setImage(with: post)
        }
        
        
        likeLabel.text = "Нравится: \(countLike ?? 0)"
    }
    
    @objc func upCount(_ sender: Any) {
        isLiked = !isLiked
        if isLiked {
            countLike? += 1
        } else {
            countLike? -= 1
        }
        
        likeLabel.text = "Нравится: \(countLike ?? 0)"
        
        onTapLike?(isLiked)
    }
}
