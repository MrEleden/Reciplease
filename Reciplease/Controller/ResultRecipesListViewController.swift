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
        self.navigationItem.title = "List of recipes"        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
        cell.configure(recipeName: matchingRecipes[indexPath.row].recipeName, recipeDetails: matchingRecipes[indexPath.row].ingredients, ratings: matchingRecipes[indexPath.row].rating, timer: matchingRecipes[indexPath.row].totalTimeInSeconds / 60, backgroundRecipeImageURL: matchingRecipes[indexPath.row].imageUrlsBySize.image)
    
        return cell
    }
}

