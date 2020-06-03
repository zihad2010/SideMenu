//
//  HomeController.swift
//  SideMenu
//
//  Created by Steve JobsOne on 6/3/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    var menuController = MenuController()
    var delegate : MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ShowSideMenu(_ sender: Any) {
        delegate?.menuHandler(forMenuOption: nil)
      //  self.showMenu()
    }
    
    
  
    
}
