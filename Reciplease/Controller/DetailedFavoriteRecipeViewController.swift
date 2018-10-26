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
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedFavoriteRecipeView.toggleActivityIndicator(shown: false)
        setupNavigationRightBarButtonItem()
        setDetailedFavoriteRecipeUI()
    }
    
    @IBAction func getDirectionsButtonTapped(_ sender: Any) {
        
    }
    
    @objc private func addToFavorite() {
        let noFavoriteButton = UIBarButtonItem(image: UIImage(named: "favorite"), style: .plain, target: self, action: #selector(removeFromFavorite))
        navigationItem.rightBarButtonItem = noFavoriteButton
    }
    
    @objc private func removeFromFavorite() {
        let favoriteButton = UIBarButtonItem(image: UIImage(named: "noFavorite"), style: .plain, target: self, action: #selector(addToFavorite))
        navigationItem.rightBarButtonItem = favoriteButton
    }
    
    private func setupNavigationRightBarButtonItem() {
        if isFavorite {
            addToFavorite()
        } else {
            removeFromFavorite()
        }
    }

    private func setDetailedFavoriteRecipeUI() {
//       TODO detailedFavoriteRecipeView.detailedFavoriteRecipeConfigure(detailedFavoriteRecipeName: <#T##String#>, detailedFavoriteRecipeDetails: <#T##[String]#>, rating: <#T##Int#>, timer: <#T##Int#>, backgroundDetailedFavoriteRecipeImageURL: <#T##String#>)
    }
}
