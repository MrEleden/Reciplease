//
//  ResultRecipesListViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 12/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class ResultRecipesListViewController: UIViewController {

    @IBOutlet weak var resultRecipeListTableView: UITableView!
    
    var matchingRecipes = [Matches]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultRecipeListTableView.reloadData()
        self.navigationItem.title = "List of recipes"
    }
}

extension ResultRecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingRecipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = resultRecipeListTableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        //TODO
        let matchingRecipe: Matches
        matchingRecipe = matchingRecipes[indexPath.row]

        cell.configure(recipeName: matchingRecipe.recipeName, recipeDetails: matchingRecipe.ingredients, ratings: matchingRecipe.rating, timer: matchingRecipe.totalTimeInSeconds / 60)
    
        return cell
    }
}

