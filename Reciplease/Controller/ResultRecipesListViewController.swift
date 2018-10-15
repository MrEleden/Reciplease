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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultRecipeListTableView.reloadData()
        self.navigationItem.title = "List Of Recipes"
    }
}

//extension ResultRecipesListViewController: UITableViewDelegate, UITableViewDataSource {
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return 1
////    }
////
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return RecipeService.shared.recipes.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        guard let cell = resultRecipeListTableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as? RecipeTableViewCell else {
////            return UITableViewCell()
////        }
////        let recipe = RecipeService.shared.recipes[indexPath.row]
////       // cell.configure(withBackgroundImage: recipe.backgroundImage, title: recipe.title, subtitle: recipe.details)
////
////        return cell
////    }
//}

