//
//  DetailedRecipeView.swift
//  Reciplease
//
//  Created by Christophe DURAND on 19/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class DetailedRecipeView: UIView {
    @IBOutlet weak var detailedRecipeBackgroundImageView: UIImageView!
    @IBOutlet weak var detailedRecipeNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var detailedRecipeDescriptionTextView: UITextView!
    @IBOutlet weak var getDirectionsButton: UIButton!
    
    
    private func getStringDetailedRecipeFromArray(detailedRecipe: [String]) -> String {
        var descriptions = ""
        for recipeDescription in detailedRecipe {
            descriptions += "- " + recipeDescription + "\n"
        }
        return descriptions
    }
    
    func detailedRecipeConfigure(detailedRecipeName: String, detailedRecipeDetails: [String], rating: Int, timer: Int, backgroundDetailedRecipeImageURL: String) {
        detailedRecipeNameLabel.text = detailedRecipeName
        detailedRecipeDescriptionTextView.text = getStringDetailedRecipeFromArray(detailedRecipe: detailedRecipeDetails)
        ratingLabel.text = String(rating)
        timerLabel.text = String(timer)
        detailedRecipeBackgroundImageView.load(imageURL: backgroundDetailedRecipeImageURL)
    }
}
