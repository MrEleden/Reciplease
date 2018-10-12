//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by Christophe DURAND on 12/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeBackgroundImage: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withBackgroundImage: String, title: String, subtitle: String) {
        //recipeBackgroundImage.image =
        recipeTitleLabel.text = title
        recipeDetailsLabel.text = subtitle
    }
    

}
