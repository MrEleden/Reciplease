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
    
    var matchingRecipes = [SearchRecipe]()
    var recipes: SearchRecipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerRecipeListTableView()
        self.navigationItem.title = "List of recipes"
    }
    
    private func registerRecipeListTableView() {
        resultRecipeListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ingredientCell")
        resultRecipeListTableView.reloadData()
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
        let matchingRecipe: SearchRecipe
        matchingRecipe = matchingRecipes[indexPath.row]

        cell.configure(recipeName: matchingRecipe.matches[indexPath.row].recipeName, recipeDetails: matchingRecipe.matches[indexPath.row].ingredients, ratings: matchingRecipe.matches[indexPath.row].rating, timer: matchingRecipe.matches[indexPath.row].totalTimeInSeconds / 60)
    
        return cell
    }
}

