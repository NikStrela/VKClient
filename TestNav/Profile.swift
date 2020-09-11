//
//  Profile.swift
//  TestNav
//
//  Created by Максим Разумов on 09.09.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation
import EasyPeasy
import UIKit
import Kingfisher

class Profile: UIViewController {
    
    let insertEventButton = UIButton()
    let nikNameButton = UIButton()
    let propertyButton = UIButton()
    
    let avatarImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    let avatarURL = URL(string: "https://www.iii.org/insuranceindustryblog/wp-content/uploads/2018/06/architecture-buildings-business-358502-1.jpg")
    
    let countPostsButton = UIButton()
    let countSubscribersButton = UIButton()
    let countSubscriptionsButton = UIButton()
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    
    let editProfileButton = UIButton()
    
    let addHistoryButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        view.backgroundColor = .white
        insertEventButton.setImage(.add, for: .normal)
        nikNameButton.setTitle("NIKNAME", for: .normal)
        nikNameButton.setTitleColor(.black, for: .normal)
        propertyButton.setImage(.actions, for: .normal)
        avatarImage.kf.setImage(with: avatarURL)
        countPostsButton.titleLabel?.numberOfLines = 0
        countPostsButton.setTitle("0\n Постов", for: .normal)
//        countPostsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        countPostsButton.setTitleColor(.black, for: .normal)
        countPostsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        countSubscribersButton.titleLabel?.numberOfLines = 0
        countSubscribersButton.setTitle("0\n Подписчиков", for: .normal)
        countSubscribersButton.setTitleColor(.black, for: .normal)
        countSubscribersButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        countSubscriptionsButton.titleLabel?.numberOfLines = 0
        countSubscriptionsButton.setTitle("0\n Подписки", for: .normal)
        countSubscriptionsButton.setTitleColor(.black, for: .normal)
        countSubscriptionsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        nameLabel.text = "First Second"
        descriptionLabel.text = "Description"
        
        editProfileButton.setTitle("редактировать профиль", for: .normal)
        editProfileButton.setTitleColor(.black, for: .normal)
        editProfileButton.backgroundColor = .gray
        
        addHistoryButton.setImage(UIImage(named: "add"), for: .normal)
        
        
    }
    
    func setUp() {
        
        view.addSubview(insertEventButton)
        view.addSubview(nikNameButton)
        view.addSubview(propertyButton)
        
        view.addSubview(avatarImage)
        
        view.addSubview(countPostsButton)
        view.addSubview(countSubscribersButton)
        view.addSubview(countSubscriptionsButton)
        
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        
        view.addSubview(editProfileButton)
        view.addSubview(addHistoryButton)
        
        insertEventButton.easy.layout(Top(40),
                                      Leading(20),
                                      Height(50),
                                      Width(50))
        
        nikNameButton.easy.layout(Top(40),
                                  CenterY().to(insertEventButton,.centerY),
                                  CenterX())
        
        propertyButton.easy.layout(Top(40),
                                   CenterY().to(nikNameButton,.centerY),
                                   Trailing(20),
                                   Height(40),
                                   Width(40))
        
        avatarImage.easy.layout(Top(30).to(insertEventButton,.bottom),
                                Leading(20),
                                Height(60),
                                Width(60))
        
        countPostsButton.easy.layout(CenterY().to(avatarImage,.centerY),
                                     Leading(15).to(avatarImage,.trailing))
        
        countSubscribersButton.easy.layout(CenterY().to(countPostsButton,.centerY),
                                           Leading(15).to(countPostsButton,.trailing))
        
        countSubscriptionsButton.easy.layout(CenterY().to(countSubscribersButton,.centerY),
                                             Leading(15).to(countSubscribersButton,.trailing))
        
        nameLabel.easy.layout(Top(10).to(avatarImage,.bottom),
                              Leading(20))
        
        descriptionLabel.easy.layout(Top(10).to(nameLabel,.bottom),
                                     Leading(20))
        
        editProfileButton.easy.layout(Top(20).to(descriptionLabel,.bottom),
                                        Trailing(20),
                                        Leading(20))
        
        addHistoryButton.easy.layout(Top(20).to(editProfileButton,.bottom),
                                     Leading(20),
                                     Height(40),
                                     Width(40))
        
        
    }
}

