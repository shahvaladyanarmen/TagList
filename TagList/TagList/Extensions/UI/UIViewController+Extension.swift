//
//  UIViewController+Extension.swift
//  TagList
//
//  Created by Armen Shahvaladyan on 31.01.22.
//

import UIKit
 
extension UIViewController {
    func showAlert(with error: Errorable) {
        let ac = UIAlertController(title: error.title,
                                   message: error.message,
                                   preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        ac.addAction(okAction)
        ac.preferredAction = okAction
        present(ac, animated: true)
    }
}
