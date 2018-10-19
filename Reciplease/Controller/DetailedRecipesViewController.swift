//
//  DetailedRecipesViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 19/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class DetailedRecipesViewController: UIViewController {

    @IBOutlet weak var detailedRecipeView: DetailedRecipeView!
    
    var detailedRecipe: DetailedRecipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedRecipeView.detailedRecipeConfigure(detailedRecipeName: detailedRecipe.name, detailedRecipeDetails: detailedRecipe.ingredientLines, rating: detailedRecipe.rating, timer: detailedRecipe.totalTime, backgroundDetailedRecipeImageURL: detailedRecipe.images[0].hostedLargeUrl)
    }
    

    
    
    
}

