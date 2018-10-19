//
//  DetailedRecipesViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 19/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class DetailedRecipesViewController: UIViewController {
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeDescriptionLabel: UILabel!
    @IBOutlet weak var getDirectionsButton: UIButton!
    
    var detailedRecipe: DetailedRecipe?
    
    func setUI() {
        recipeImageView.image = detailedRecipe?.images

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
}

