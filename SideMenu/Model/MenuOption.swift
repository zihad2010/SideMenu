//
//  MenuOption.swift
//  SideMenu
//
//  Created by Steve JobsOne on 6/3/20.
//  Copyright © 2020 Steve JobsOne. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible,CaseIterable{
    
    case profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
        case .profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .profile: return UIImage(named: "Profile") ?? UIImage()
        case .Inbox: return UIImage(named: "Inbox") ?? UIImage()
        case .Notifications:  return UIImage(named: "alarm") ?? UIImage()
        case .Settings:  return UIImage(named: "Settings") ?? UIImage()
        }
    }
}
