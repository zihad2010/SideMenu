//
//  MenuController.swift
//  SideMenu
//
//  Created by Steve JobsOne on 6/3/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

class MenuController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //MARK: Info
    
    var delegate : MenuDelegate?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MenuItemsCell") as! MenuItemsCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.menuImageView.image = menuOption?.image
        cell.menuDescriptionLabel.text = menuOption?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let menuOption = MenuOption(rawValue: indexPath.row)
        self.delegate?.menuHandler(forMenuOption: menuOption)
    }
    
}
