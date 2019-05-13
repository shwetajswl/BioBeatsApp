//
//  UIViewController+Alert.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 09/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {

    //MARK: - Show alert
    
    func showAlert(msg: String) {
      
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Show alert and hide
    
    func showAlertAndHide(msg: String) {
        
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Setup Navigation Bar
    
    func setupNavigationbar() {
        
        // Navigation Bar
        self.navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 247/255, green: 78/255, blue: 40/255, alpha: 1.0)
        
        // Navigation Title Attributes
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
    }
    
    
    //MARK: - Stop and hide activity indicator
    
    func stopIndicator (activityIndicator: UIActivityIndicatorView) {
      
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
}
