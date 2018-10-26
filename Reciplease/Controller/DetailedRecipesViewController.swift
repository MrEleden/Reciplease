//
//  DetailedRecipesViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 19/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit
import SafariServices

class DetailedRecipesViewController: UIViewController {
    
    @IBOutlet weak var detailedRecipeView: DetailedRecipeView!
    
    var detailedRecipe: DetailedRecipe!
    var favoriteRecipe = FavoriteRecipe.all
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedRecipeView.toggleActivityIndicator(shown: false)
        setupNavigationRightBarButtonItem()
        setDetailedRecipeUI()
    }
    
    @IBAction func getDirections(_ sender: Any) {
        getDirectionsFromSourceRecipeURL()
    }

    @objc private func addToFavorite() {
        let noFavoriteButton = UIBarButtonItem(image: UIImage(named: "favorite"), style: .plain, target: self, action: #selector(removeFromFavorite))
        navigationItem.rightBarButtonItem = noFavoriteButton
        saveFavoriteRecipe()
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

    private func getDirectionsFromSourceRecipeURL() {
        if let detailedRecipe = detailedRecipe {
            let detailedRecipeURL = URL(string: detailedRecipe.source.sourceRecipeUrl)
            let safariVC = SFSafariViewController(url: detailedRecipeURL!)
            present(safariVC, animated: true, completion: nil)
        } else {
            showAlert(title: "Error", message: "Failed to get you any directions. Try again!")
        }
    }
    
    private func setDetailedRecipeUI() {
        detailedRecipeView.detailedRecipeConfigure(detailedRecipeName: detailedRecipe.name, detailedRecipeDetails: detailedRecipe.ingredientLines, rating: detailedRecipe.rating, timer: detailedRecipe.totalTimeInSeconds / 60, backgroundDetailedRecipeImageURL: detailedRecipe.images[0].hostedLargeUrl)
    }
    
    private func saveFavoriteRecipe() {
        let favoritesRecipes = FavoriteRecipe(context: AppDelegate.viewContext)
        favoritesRecipes.image = detailedRecipe.images[0].hostedLargeUrl
        favoritesRecipes.recipeName = detailedRecipe.name
        for ingredient in detailedRecipe.ingredientLines {
            favoritesRecipes.ingredients = ingredient
        }
        favoritesRecipes.rating = Int16(detailedRecipe.rating)
        favoritesRecipes.totalTimeInSeconds = Int16(detailedRecipe.totalTimeInSeconds)
        saveContext()
    }
    
    private func saveContext() {
        do {
            try AppDelegate.viewContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
}







