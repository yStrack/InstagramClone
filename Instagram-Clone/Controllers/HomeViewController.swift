//
//  ViewController.swift
//  Instagram-Clone
//
//  Created by Yuri Strack on 27/04/20.
//  Copyright © 2020 Yuri Strack. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var posts:[Post] = []
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = fetchData()
        configController()
    }
    
    func configController(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
//        print(posts)
        cell.set(post: post)
        return cell
    }
}

extension HomeViewController{
    func fetchData() -> [Post]{
        let user1 = User(name: "Yuri Strack", profilePic: UIImage(named: "profile-pic")!)
        let post1 = Post(user: user1, location: "Rio de Janeiro", image: UIImage(named: "InstaPost")!, likes: "Curtido por Alex", description: "CarnaVRAU")
//        print(user1)
//        print(post1)
        return [post1]
    }
}
