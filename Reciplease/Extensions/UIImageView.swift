//
//  UIImageView.swift
//  Reciplease
//
//  Created by Christophe DURAND on 18/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(imageURL: String?) {
        guard let urlImageString = imageURL else { return }
        
        guard let urlImage = URL(string: urlImageString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            guard let imageData = try? Data(contentsOf: urlImage) else { return }
            if let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
