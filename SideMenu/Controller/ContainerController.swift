//
//  ContainerController.swift
//  SideMenu
//
//  Created by Steve JobsOne on 6/3/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    //MARK: - properties
    var isExpand: Bool = false
    let storyboardName: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    var menuController = MenuController()
    var homeController = HomeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configarationHome()
        self.configarationMenu()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    func configarationHome() {
        homeController  = storyboardName.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        homeController.delegate = self
        self.view.addSubview(homeController.self.view)
        self.addChild(homeController)
        homeController.didMove(toParent: self)
    }
    
    func configarationMenu() {
        
        self.menuController  = storyboardName.instantiateViewController(withIdentifier: "MenuController") as! MenuController
        self.menuController.delegate = self
        self.menuController.view.frame = CGRect(x: -UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.addSubview(menuController.self.view)
        self.addChild(menuController)
        menuController.didMove(toParent: self)
        self.menuController.view.backgroundColor = .clear
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.gestureToRespond))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.gestureToRespond))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
}

extension ContainerController:MenuDelegate {
    
    func menuHandler(forMenuOption menuOption: MenuOption?) {
        isExpand = !isExpand
        showOrCloseMenu(isExpand:isExpand, menuOption: menuOption)
    }
    
    func showOrCloseMenu(isExpand: Bool, menuOption: MenuOption?) {
        
        if isExpand {
            UIView.animate(withDuration: 0.5, animations: {
                self.menuController.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                self.addChild(self.menuController)
                self.view.addSubview(self.menuController.view)
            })
        }else{
            UIView.animate(withDuration: 0.5, animations: { ()->Void in
                self.menuController.view.frame = CGRect(x: -UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }){ (_) in
                guard let menuOption = menuOption else{return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .profile:
            var profileController = ProfileController()
            profileController  = storyboardName.instantiateViewController(withIdentifier: "ProfileController") as! ProfileController
            self.navigationController?.pushViewController(profileController, animated: true)
            print("Show Profile")
        case .Inbox:
            print("Show Inbox")
        case .Notifications:
            print("Show Notifications")
        case .Settings:
            print("Show Settings")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isExpand = !isExpand
        showOrCloseMenu(isExpand:isExpand, menuOption: nil)
    }
    
    @objc func gestureToRespond(gesture: UISwipeGestureRecognizer) {
        print(isExpand)
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            showOrCloseMenu(isExpand:isExpand, menuOption: nil)
        case UISwipeGestureRecognizer.Direction.left:
            showOrCloseMenu(isExpand:isExpand, menuOption: nil)
        default:
            break
        }
    }
}
