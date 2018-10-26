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
    
    var favoritesRecipes = FavoriteRecipe.all

    override func viewDidLoad() {
        super.viewDidLoad()
        setFavoritesRecipesTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favoritesRecipes = FavoriteRecipe.all
        favoritesRecipesListTableView.reloadData()
    }
    
    private func setFavoritesRecipesTableView() {
        self.navigationItem.title = "List of Favorites Recipes"
        favoritesRecipesListTableView.rowHeight = 120
    }
    
    private func saveContext() {
        do {
            try AppDelegate.viewContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedFavoriteRecipeSegue" {
            let detailedFavoriteRecipeVC = segue.destination as! DetailedFavoriteRecipeViewController
            detailedFavoriteRecipeVC.detailedFavoriteRecipe = sender as? FavoriteRecipe
        }
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
        guard let cell = favoritesRecipesListTableView.dequeueReusableCell(withIdentifier: "favoriteRecipeCell", for: indexPath) as? FavoriteRecipeTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.favoriteRecipeCellConfigure(favoriteRecipeName: favoritesRecipes[indexPath.row].recipeName!, favoriteRecipeDetails: favoritesRecipes[indexPath.row].ingredients!, ratings: Int(favoritesRecipes[indexPath.row].rating), timer: Int(favoritesRecipes[indexPath.row].totalTimeInSeconds) / 60, backgroundRecipeImageURL: favoritesRecipes[indexPath.row].image!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AppDelegate.viewContext.delete(favoritesRecipes[indexPath.row])
            favoritesRecipes.remove(at: indexPath.row)
            saveContext()
            favoritesRecipesListTableView.beginUpdates()
            favoritesRecipesListTableView.deleteRows(at: [indexPath], with: .automatic)
            favoritesRecipesListTableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = favoritesRecipesListTableView.cellForRow(at: indexPath) as? FavoriteRecipeTableViewCell else { return }
        self.performSegue(withIdentifier: "detailedFavoriteRecipeSegue", sender: cell.favoriteRecipeCellConfigure(favoriteRecipeName: favoritesRecipes[indexPath.row].recipeName!, favoriteRecipeDetails: favoritesRecipes[indexPath.row].ingredients!, ratings: Int(favoritesRecipes[indexPath.row].rating), timer: Int(favoritesRecipes[indexPath.row].totalTimeInSeconds) / 60, backgroundRecipeImageURL: favoritesRecipes[indexPath.row].image!))
    }
}

