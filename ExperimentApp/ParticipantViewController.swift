//
//  ParticipantViewController.swift
//  ExperimentApp
//
//  Created by XHQ on 2019/6/7.
//  Copyright © 2019 XHQ. All rights reserved.
//

import UIKit

class ParticipantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBAction func searchButton(_ sender: UIBarButtonItem) {
    }
    
    
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var recentItem: UITabBarItem!
    @IBOutlet weak var bookedItem: UITabBarItem!
    @IBOutlet weak var chatItem: UITabBarItem!
    @IBOutlet weak var profileItem: UITabBarItem!
    
    @IBOutlet weak var floatingButton: UIButton!
    @IBAction func floatingButton(_ sender: UIButton) {
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            print("recentItem be tapped")
        case 2:
            self.performSegue(withIdentifier: "goToBooked", sender: self)
        case 3:
            self.performSegue(withIdentifier: "goToMessager", sender: self)
        case 4:
            self.performSegue(withIdentifier: "goToProfile", sender: self)
        default:
            return
        }
    }
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        allButton.setTitleColor(#colorLiteral(red: 0.7567955852, green: 0.7569057345, blue: 0.7567715049, alpha: 1), for: .normal)
        favoriteButton.setTitleColor(#colorLiteral(red: 0.2523448765, green: 0.5975832939, blue: 0.8585820794, alpha: 1), for: .normal)
        allButton.layer.shadowOpacity = 0
        favoriteButton.layer.shadowOpacity = 0.5
    }
    @IBAction func allButton(_ sender: UIButton) {
        allButton.setTitleColor(#colorLiteral(red: 0.2523448765, green: 0.5975832939, blue: 0.8585820794, alpha: 1), for: .normal)
        favoriteButton.setTitleColor(#colorLiteral(red: 0.7567955852, green: 0.7569057345, blue: 0.7567715049, alpha: 1), for: .normal)
        allButton.layer.shadowOpacity = 0.5
        favoriteButton.layer.shadowOpacity = 0
    }
    
    var information: [Information] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tabBar.delegate = self
        
        information = createArray()
        
        
        var insets = UIEdgeInsets()
        insets.top = 3
        insets.bottom = -3.0
        
        self.recentItem.imageInsets = insets
        self.recentItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 3)
        self.bookedItem.imageInsets = insets
        self.bookedItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 3)
        self.chatItem.imageInsets = insets
        self.chatItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 3)
        self.profileItem.imageInsets = insets
        self.profileItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 3)
        
        tabBar.tintColor = #colorLiteral(red: 0.2523448765, green: 0.5975832939, blue: 0.8585820794, alpha: 1)
        tabBar.selectedItem = tabBar.items?.first
        
        self.floatingButton.alpha = 0.8
    }
    
    func createArray() -> [Information] {
        
        var tempImage: [Information] = []
        let dates = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: dates)
        let month = calendar.component(.month, from: dates)
        
        let Image1 = Information(image: #imageLiteral(resourceName: "onsei_ninshiki_computer"), title: "音声識別実験", price:"￥1000", date: "\(month).\(day)")
        let Image2 = Information(image: #imageLiteral(resourceName: "medical_nouha_shindan"), title: "EEG実験", price: "￥1500", date: "\(month).\(day)")
        let Image3 = Information(image: #imageLiteral(resourceName: "pasokon_kyoushitsu_woman"), title: "行動実験", price: "￥1000", date: "\(month).\(day)")
        let Image4 = Information(image: #imageLiteral(resourceName: "kenkoushindan_mri_man"), title: "FMRI実験", price: "￥2000", date: "\(month).\(day)")
        
        tempImage.append(Image1)
        tempImage.append(Image2)
        tempImage.append(Image3)
        tempImage.append(Image4)
        
        return tempImage
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let informations = information[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.setInformation(informations: informations)
        cell.saveButton.setImage(#imageLiteral(resourceName: "Image-2"), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
