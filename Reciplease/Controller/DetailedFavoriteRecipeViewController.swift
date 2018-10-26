//
//  DetailedFavoriteRecipeViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 26/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit
import SafariServices

class DetailedFavoriteRecipeViewController: UIViewController {
    
    @IBOutlet var detailedFavoriteRecipeView: DetailedFavoriteRecipeView!
    
    var detailedFavoriteRecipe: FavoriteRecipe!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailedFavoriteRecipeView.toggleActivityIndicator(shown: false)
        setUI()
    }
    
    @IBAction func getDirectionsButtonTapped(_ sender: Any) {
        
    }

    private func setUI() {
//       TODO detailedFavoriteRecipeView.detailedFavoriteRecipeConfigure(detailedFavoriteRecipeName: <#T##String#>, detailedFavoriteRecipeDetails: <#T##[String]#>, rating: <#T##Int#>, timer: <#T##Int#>, backgroundDetailedFavoriteRecipeImageURL: <#T##String#>)
    }
}
