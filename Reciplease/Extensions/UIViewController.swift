//
//  UIViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 08/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

extension UIViewController {
    //Method to show alerts when an error occurs
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
