//
//  TabBarController.swift
//  Profile
//
//  Created by Алексей Маяков on 14.06.2022.
//

import UIKit

class TabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let  profile = ProfileViewController()
        let feed = FeedController()
        profile.title = "Profile"
        feed.title = "Feed"
        self.setViewControllers([feed,profile], animated: false)
        let  images = ["house","person.crop.circle"]
        guard let items = self.tabBar.items else  {return}
        
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
    }

    
}
