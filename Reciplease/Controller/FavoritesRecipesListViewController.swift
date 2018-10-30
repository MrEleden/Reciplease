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
    }
    
    private func saveContext() {
        do {
            try AppDelegate.viewContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedFavoriteRecipeSegue",
            let detailedFavoriteRecipeVC = segue.destination as? DetailedFavoriteRecipeViewController,
            let indexPath = self.favoritesRecipesListTableView.indexPathForSelectedRow {
            let selectedFavoriteRecipe = favoritesRecipes[indexPath.row]
            detailedFavoriteRecipeVC.detailedFavoriteRecipe = selectedFavoriteRecipe
        }
    }
}

extension FavoritesRecipesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favoritesRecipes.count > 0 {
            favoritesRecipesListTableView.backgroundView = nil
            favoritesRecipesListTableView.separatorStyle = .singleLine
            return favoritesRecipes.count
        } else {
            let rect = CGRect(x: 0,
                              y: 0,
                              width: favoritesRecipesListTableView.bounds.size.width,
                              height: favoritesRecipesListTableView.bounds.size.height)
            let noFavoriteRecipeLabel: UILabel = UILabel(frame: rect)
            noFavoriteRecipeLabel.text = "Hit the favorite button to add a recipe in your favorite list!"
            noFavoriteRecipeLabel.textColor = UIColor.gray
            noFavoriteRecipeLabel.font = UIFont.boldSystemFont(ofSize: 24)
            noFavoriteRecipeLabel.numberOfLines = 0
            noFavoriteRecipeLabel.textAlignment = NSTextAlignment.center
            favoritesRecipesListTableView.backgroundView = noFavoriteRecipeLabel
            favoritesRecipesListTableView.separatorStyle = .none
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoritesRecipesListTableView.dequeueReusableCell(withIdentifier: "favoriteRecipeCell", for: indexPath) as? FavoriteRecipeTableViewCell else {
            return UITableViewCell()
        }
        let favoriteRecipe = favoritesRecipes[indexPath.row]
        cell.selectionStyle = .none
        cell.favoriteRecipeCellConfigure(favoriteRecipeName: favoriteRecipe.recipeName!, favoriteRecipeDetails: favoriteRecipe.ingredients!, ratings: Int(favoriteRecipe.rating), timer: Int(favoriteRecipe.totalTimeInSeconds) / 60, backgroundRecipeImageURL: favoriteRecipe.image!)
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
}

