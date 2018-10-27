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
        setupNavigationRightBarButtonItem()
        setDetailedFavoriteRecipeUI()
    }
    
    @IBAction func getDirectionsButtonTapped(_ sender: Any) {
        getDirectionsFromSourceRecipeURL()
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
        detailedFavoriteRecipeView.detailedFavoriteRecipeConfigure(detailedFavoriteRecipeName: detailedFavoriteRecipe.recipeName!, detailedFavoriteRecipeDetails: , rating: Int(detailedFavoriteRecipe.rating), timer: Int(detailedFavoriteRecipe.totalTimeInSeconds / 60), backgroundDetailedFavoriteRecipeImageURL: detailedFavoriteRecipe.image!)
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
