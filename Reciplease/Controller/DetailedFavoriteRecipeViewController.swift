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
        setupNavigationBarItemTintColor()
        setDetailedFavoriteRecipeUI()
    }
    
    @IBAction func getDirectionsButtonTapped(_ sender: Any) {
        getDirectionsFromSourceRecipeURL()
    }
    
    @IBAction func share(_ sender: UIButton) {
        sharingRecipeNavigationLeftBarButtonItem()
    }
    
    private func sharingRecipeNavigationLeftBarButtonItem() {
        let activityController = UIActivityViewController(activityItems: ["Can you cook that for me?", detailedFavoriteRecipe.sourceUrl as Any], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    private func setDetailedFavoriteRecipeUI() {
        
        detailedFavoriteRecipeView.detailedFavoriteRecipeConfigure(detailedFavoriteRecipeName: detailedFavoriteRecipe.recipeName!, detailedFavoriteRecipeDetails: self.convertDetailedFavoriteRecipeIngredients(detailedFavoriteRecipeIngredients: detailedFavoriteRecipe.ingredients!), rating: Int(detailedFavoriteRecipe.rating), timer: Int(detailedFavoriteRecipe.totalTimeInSeconds / 60), backgroundDetailedFavoriteRecipeImageURL: detailedFavoriteRecipe.image!)
    }
    
    private func convertDetailedFavoriteRecipeIngredients(detailedFavoriteRecipeIngredients: String) -> String {
        var description = ""
        let detailedFavoriteRecipeIngredientsArray = detailedFavoriteRecipeIngredients.components(separatedBy: ", ")
        for ingredients in detailedFavoriteRecipeIngredientsArray {
            description += "- " + ingredients + "\n"
        }
        return description
    }
    
    private func getDirectionsFromSourceRecipeURL() {
        if let detailedFavoriteRecipe = detailedFavoriteRecipe {
            let detailedFavoriteRecipeURL = URL(string: detailedFavoriteRecipe.sourceUrl!)
            let safariVC = SFSafariViewController(url: detailedFavoriteRecipeURL!)
            present(safariVC, animated: true, completion: nil)
        } else {
            showAlert(title: "Error", message: "Failed to get you any directions. Try again!")
        }
    }
    
    private func setupNavigationBarItemTintColor() {
        navigationController?.navigationBar.tintColor = UIColor.black
    }
}
