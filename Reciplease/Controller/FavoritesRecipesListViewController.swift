//
//  FavoritesRecipesListViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 23/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class FavoritesRecipesListViewController: UIViewController {
    
    @IBOutlet weak var favoritesRecipesListTableView: UITableView!
    
    var favoritesRecipes = [Matches]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "List of Favorites Recipes"
    }
    
    
    
    
    
    
    
}

extension FavoritesRecipesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoritesRecipesListTableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.cellConfigure(recipeName: favoritesRecipes[indexPath.row].recipeName,
                           recipeDetails: favoritesRecipes[indexPath.row].ingredients,
                           ratings: favoritesRecipes[indexPath.row].rating,
                           timer: favoritesRecipes[indexPath.row].totalTimeInSeconds / 60,
                           backgroundRecipeImageURL:
            favoritesRecipes[indexPath.row].imageUrlsBySize.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
