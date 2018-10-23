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
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private func convertIntoStringDetailedRecipe(detailedRecipe: [String]) -> String {
        var descriptions = ""
        for recipeDescription in detailedRecipe {
            descriptions += "- " + recipeDescription + "\n"
        }
        return descriptions
    }
    
    func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        getDirectionsButton.isHidden = shown
    }
    
    func detailedRecipeConfigure(detailedRecipeName: String, detailedRecipeDetails: [String], rating: Int, timer: Int, backgroundDetailedRecipeImageURL: String) {
        detailedRecipeNameLabel.text = detailedRecipeName
        detailedRecipeDescriptionTextView.text = convertIntoStringDetailedRecipe(detailedRecipe: detailedRecipeDetails)
        ratingLabel.text = String(rating)
        timerLabel.text = String(timer) + " min"
        detailedRecipeBackgroundImageView.load(imageURL: backgroundDetailedRecipeImageURL)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.init(red: 222/255, green: 225/255, blue: 227/255, alpha: 1).cgColor
    }
}
