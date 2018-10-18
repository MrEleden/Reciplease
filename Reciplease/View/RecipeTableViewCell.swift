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
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func convertIngredientsArrayIntoString(ingredients: [String]) -> String {
        let ingredientsArray = ingredients.map{ String($0) }
        return ingredientsArray.joined(separator: ",")
    }
    
    func configure(recipeName: String, recipeDetails: [String], ratings: Int, timer: Int, backgroundRecipeImageURL: String) {
        recipeTitleLabel.text = recipeName
        recipeDetailsLabel.text = self.convertIngredientsArrayIntoString(ingredients: recipeDetails)
        ratingsLabel.text = String(ratings)
        timerLabel.text = String(timer)
        recipeBackgroundImage.load(imageURL: backgroundRecipeImageURL)
    }
}
