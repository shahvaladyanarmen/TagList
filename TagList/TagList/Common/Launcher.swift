//
//  Launcher.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import UIKit

struct Launcher {
    enum RootScreen {
        case tagList
    }
    
    static func perform(segue: RootScreen, window: UIWindow) {
        switch segue {
        case .tagList:
            let vc = TagListRouter.createTagListViewController()
            let nc = NavigationController(rootViewController: vc)
            window.rootViewController = nc
            window.makeKeyAndVisible()
        }
    }
}
