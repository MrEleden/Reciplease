//
//  DetailedRecipesViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 19/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class DetailedRecipesViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var detailedRecipeView: DetailedRecipeView!
    
    //MARK: - Properties
    var detailedRecipe: DetailedRecipe!
    var favoriteRecipe = FavoriteRecipe.all
    let defaults = UserDefaults.standard
    var noFavoriteButtonImage = UIImage(named: "favorite")
    var favoriteButtonImage = UIImage(named: "noFavorite")
    var isFavorite = false
    var buttonFavoriteTapped: Bool!

    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedRecipeView.toggleActivityIndicator(shown: false)
        setupNavigationRightBarButtonItem()
        setDetailedRecipeUI()
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //buttonFavoriteTapped = defaults.bool(forKey: "favoriterecipe")
//        if buttonFavoriteTapped == true {
//            buttonFavoriteTapped = false
//            favoriteButton.setImage(noFavoriteButtonImage, for: .normal)
//        } else {
//            buttonFavoriteTapped = true
//            favoriteButton.setImage(favoriteButtonImage, for: .normal)
//        }

        
        
        
        
    }
    
    //MARK: - Actions
    

    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func addToFavoriteList(_ sender: UIButton) {
        saveFavoriteRecipe()
        //defaults.set(buttonFavoriteTapped, forKey: "favoriterecipe")
    }
    
    
    
    
    
    
    @IBAction func getDirections(_ sender: Any) {
        getDirectionsFromSourceRecipeURL()
    }
    
    @IBAction func share(_ sender: UIButton) {
        sharingRecipeButtonTapped()
    }
    
    //MARK: - Methods
    private func sharingRecipeButtonTapped() {
        let activityController = UIActivityViewController(activityItems: ["Can you cook that for me?", detailedRecipe.source.sourceRecipeUrl], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    @objc private func addToFavorite() {
        let noFavoriteButton = UIBarButtonItem(image: noFavoriteButtonImage, style: .plain, target: self, action: #selector(removeFromFavorite))
        navigationItem.rightBarButtonItem = noFavoriteButton
        saveFavoriteRecipe()
    }

    @objc private func removeFromFavorite() {
        let favoriteButton = UIBarButtonItem(image: favoriteButtonImage, style: .plain, target: self, action: #selector(addToFavorite))
        navigationItem.rightBarButtonItem = favoriteButton
        
        
        
        
        removeFavoriteRecipe()
    }

    private func setupNavigationRightBarButtonItem() {
       defaults.set(isFavorite, forKey: "favoriterecipe")
        isFavorite = defaults.bool(forKey: "favoriterecipe")
        if isFavorite == true {
            addToFavorite()
            
          
                isFavorite = false
                navigationItem.rightBarButtonItem?.image = noFavoriteButtonImage
          
            
            
        } else {
            removeFromFavorite()
         
                isFavorite = true
                navigationItem.rightBarButtonItem?.image = favoriteButtonImage
            
            
            
            
        }
    }
    
    private func getDirectionsFromSourceRecipeURL() {
        if let detailedRecipe = detailedRecipe {
            guard let url = URL(string: detailedRecipe.source.sourceRecipeUrl) else { return }
            UIApplication.shared.open(url)
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
        favoritesRecipes.ingredients = convertIngredientsArrayIntoString(ingredients: detailedRecipe.ingredientLines)
        favoritesRecipes.rating = Int16(detailedRecipe.rating)
        favoritesRecipes.totalTimeInSeconds = Int16(detailedRecipe.totalTimeInSeconds)
        favoritesRecipes.sourceUrl = detailedRecipe.source.sourceRecipeUrl
        saveContext()
    }
    
    private func removeFavoriteRecipe() {
        //TODO
    }
    
    private func convertIngredientsArrayIntoString(ingredients: [String]) -> String {
        let ingredientsArray = ingredients.map{ String($0) }
        return ingredientsArray.joined(separator: ", ")
    }
    
    private func saveContext() {
        do {
            try AppDelegate.viewContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
}







