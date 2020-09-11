//
//  TableViewController.swift
//  TestNav
//
//  Created by Максим Разумов on 07.09.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy


class PostsViewController: UIViewController {
    
    var posts: [Post] = [Post(name: "vano777",
                              geopos: "Russia",
                              countLike: 0,
                              avatarURL: URL(string: "https://m.thepeoplesdialogue.org.za/Assets/images/about-herman.png"),
                              postURL: URL(string: "https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?ixlib=rb-1.2.1&w=1000&q=80"),
                              isLiked: false),
                         Post(name: "max_official",
                              geopos: "USA",
                              countLike: 0,
                              avatarURL: URL(string: "https://pbs.twimg.com/profile_images/719644517272391680/rSvoKhZ5_400x400.jpg"),
                              postURL: URL(string: "https://www.iii.org/insuranceindustryblog/wp-content/uploads/2018/06/architecture-buildings-business-358502-1.jpg"),
                              isLiked: false),
                        Post(name: "prank_tv",
                                 geopos: "Казахстан",
                                 countLike: 0,
                                 avatarURL: URL(string: "https://m.buro247.ru/images/andreeva/670x830_zen.jpg"),
                                 postURL: URL(string: "https://www.visitrussia.org.uk/images/st_4"),
                                 isLiked: false),
                        Post(name: "prank_tv",
                                 geopos: "Сербия",
                                 countLike: 0,
                                 avatarURL: URL(string: "https://cdn.cnn.com/cnnnext/dam/assets/191112224140-john-legend-sexiest-man-file-exlarge-169.jpg"),
                                postURL: URL(string: "https://kubnews.ru/upload/iblock/432/432c8277c0e8ab5a463e3b74feba1194.jpg"),
                                isLiked: false),
                        Post(name: "vano777",
                                 geopos: "Russia",
                                 countLike: 0,
                                 avatarURL: URL(string: "https://m.thepeoplesdialogue.org.za/Assets/images/about-herman.png"),
                                 postURL: URL(string: "https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?ixlib=rb-1.2.1&w=1000&q=80"),
                                 isLiked: false),
                        Post(name: "max_official",
                                 geopos: "USA",
                                 countLike: 0,
                                 avatarURL: URL(string: "https://pbs.twimg.com/profile_images/719644517272391680/rSvoKhZ5_400x400.jpg"),
                                 postURL: URL(string: "https://www.iii.org/insuranceindustryblog/wp-content/uploads/2018/06/architecture-buildings-business-358502-1.jpg"),
                                 isLiked: false),
                        Post(name: "prank_tv",
                                    geopos: "Казахстан",
                                    countLike: 0,
                                    avatarURL: URL(string: "https://m.buro247.ru/images/andreeva/670x830_zen.jpg"),
                                   postURL: URL(string: "https://www.visitrussia.org.uk/images/st_4"),
                                   isLiked: false),
                        Post(name: "prank_tv",
                                    geopos: "Сербия",
                                    countLike: 0,
                                    avatarURL: URL(string: "https://cdn.cnn.com/cnnnext/dam/assets/191112224140-john-legend-sexiest-man-file-exlarge-169.jpg"),
                                   postURL: URL(string: "https://kubnews.ru/upload/iblock/432/432c8277c0e8ab5a463e3b74feba1194.jpg"),
                                   isLiked: false)]
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PostCell.self, forCellReuseIdentifier: "cellId")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.easy.layout(Top(), Leading(), Trailing(), Bottom())
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return nikName.count
        return posts.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! PostCell
        
        
        let viewModel = PostViewModel(name: posts[indexPath.row].name,
                                      geopos: posts[indexPath.row].geopos,
                                      countLike: posts[indexPath.row].countLike,
                                      avatarURL: posts[indexPath.row].avatarURL,
                                      postURL: posts[indexPath.row].postURL,
                                      isLiked: posts[indexPath.row].isLiked)
        
        viewModel.onTapLike = { [weak self] isLiked in
            self?.posts[indexPath.row].isLiked = isLiked
            if isLiked {
                self?.posts[indexPath.row].countLike += 1
            } else {
                self?.posts[indexPath.row].countLike -= 1
            }
        }
        
        cell.setUp(viewModel: viewModel)
        return cell
        
    }
    
}
