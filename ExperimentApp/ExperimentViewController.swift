//
//  ExperimentViewController.swift
//  ExperimentApp
//
//  Created by XHQ on 2019/6/10.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit

class ExperimentViewController: UIViewController, UITabBarDelegate  {

    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var recentItem: UITabBarItem!
    @IBOutlet weak var publishedItem: UITabBarItem!
    @IBOutlet weak var chatItem: UITabBarItem!
    @IBOutlet weak var profileItem: UITabBarItem!
    
    @IBAction func informaitonPublish(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var floatingButton: UIButton!
    @IBAction func floatingButton(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        self.tabBar.delegate = self

        var insets = UIEdgeInsets()
        insets.top = 3
        insets.bottom = -3.0
        
        self.recentItem.imageInsets = insets
        self.recentItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 3)
        self.publishedItem.imageInsets = insets
        self.publishedItem.titlePositionAdjustment = UIOffset(horizontal: -27, vertical: 3)
        self.chatItem.imageInsets = insets
        self.chatItem.titlePositionAdjustment = UIOffset(horizontal: 27, vertical: 3)
        self.profileItem.imageInsets = insets
        self.profileItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 3)
        
        self.publishedItem.imageInsets = UIEdgeInsets(top: 0, left: -1, bottom: 0, right: 1)
        self.chatItem.imageInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: -1)
        
        tabBar.tintColor = #colorLiteral(red: 0.09080412239, green: 0.2870057821, blue: 0.5362405777, alpha: 1)
        tabBar.selectedItem = tabBar.items?.first
        
        self.floatingButton.alpha = 0.8
    
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }


}
