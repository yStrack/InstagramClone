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

// TableView extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
//        print(posts)
        cell.set(post: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let separatorView = UIView(frame: CGRect(x:0, y: headerView.frame.height, width: tableView.frame.width, height: 1))
        separatorView.backgroundColor = UIColor.separator
        headerView.addSubview(separatorView)
        return headerView
    }
}

// CollectionView extension
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}

extension HomeViewController{
    func fetchData() -> [Post]{
        let user1 = User(name: "yuri_strack", profilePic: UIImage(named: "profile-pic")!)
        let post1 = Post(user: user1, location: "Rio de Janeiro", image: UIImage(named: "InstaPost")!, likes: "Curtido por Alex", description: "CarnaVRAU")
        let post2 = Post(user: user1, location: "Rio de Janeiro", image: UIImage(named: "InstaPost")!, likes: "Curtido por Alex", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        let post3 = Post(user: user1, location: "Rio de Janeiro", image: UIImage(named: "InstaPost")!, likes: "Curtido por Alex", description: "CarnaVRAU")
//        print(user1)
//        print(post1)
        return [post1,post2,post3]
    }
}
