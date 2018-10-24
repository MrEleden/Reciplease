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
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedRecipeView.toggleActivityIndicator(shown: false)
        setupNavigationRightBarButtonItem()
        setUI()
    }
    
    @IBAction func getDirections(_ sender: Any) {
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

    private func getDirectionsFromSourceRecipeURL() {
        if let detailedRecipe = detailedRecipe {
            let detailedRecipeURL = URL(string: detailedRecipe.source.sourceRecipeUrl)
            let safariVC = SFSafariViewController(url: detailedRecipeURL!)
            present(safariVC, animated: true, completion: nil)
        } else {
            showAlert(title: "Error", message: "Failed to get you any directions. Try again!")
        }
    }
    
    private func setUI() {
        detailedRecipeView.detailedRecipeConfigure(detailedRecipeName: detailedRecipe.name, detailedRecipeDetails: detailedRecipe.ingredientLines, rating: detailedRecipe.rating, timer: detailedRecipe.totalTimeInSeconds / 60, backgroundDetailedRecipeImageURL: detailedRecipe.images[0].hostedLargeUrl)
    }
}







