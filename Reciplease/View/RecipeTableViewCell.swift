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
    @IBOutlet weak var ratingsImageView: UIImageView!
    @IBOutlet weak var timerImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func convertIngredientsArrayIntoString(ingredients: [String]) -> String {
        let ingredientsArray = ingredients.map{ String($0) }
        return ingredientsArray.joined(separator: ", ")
    }
    
    func cellConfigure(recipeName: String, recipeDetails: [String], ratings: Int, timer: Int, backgroundRecipeImageURL: String) {
        recipeTitleLabel.text = recipeName
        recipeDetailsLabel.text = self.convertIngredientsArrayIntoString(ingredients: recipeDetails)
        ratingsLabel.text = String(ratings)
        timerLabel.text = String(timer) + " min"
        recipeBackgroundImage.load(imageURL: backgroundRecipeImageURL)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(red: 222/255, green: 225/255, blue: 227/255, alpha: 1).cgColor
    }
}
