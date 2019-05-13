//
//  UIImageView+AsyncLoading.swift
//  BioBeatsApp
//
//  Created by Sweta Jaiswal on 08/05/2019.
//  Copyright © 2019 Sweta Jaiswal. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
    
    func load(url: URL) {
        
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
        
        
        DispatchQueue.global(qos: .default).async(execute: {
            let imageData: Data? = try? Data(contentsOf: url)
            var image: UIImage? = nil
            if let imageData = imageData {
                image = UIImage(data: imageData)
            }
            DispatchQueue.main.async(execute: {
                self.image = image
            })
        })

    }
    
    
}
