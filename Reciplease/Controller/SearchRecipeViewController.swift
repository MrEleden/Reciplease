//
//  SearchRecipeViewController.swift
//  Reciplease
//
//  Created by Christophe DURAND on 05/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class SearchRecipeViewController: UIViewController {

    @IBOutlet weak var ingredientsTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var searchForRecipesButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleActivityIndicator(shown: false)
        registerIngredientsTableView()
    }
    
    @IBAction func add(_ sender: UIButton) {
        addIngredientIntoList()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        clearList()
    }
    
    @IBAction func searchForRecipes(_ sender: UIButton) {
        searchRecipe()
    }

    private func addIngredientIntoList() {
        guard let inputs = ingredientsTextField.text else { return }
        if inputs != "" {
            let ingredients = inputs.components(separatedBy: ",")
            for ingredient in ingredients {
                let ingredientToAdd = ingredient
                let ingredientName = Ingredient(name: ingredientToAdd)
                IngredientService.shared.add(ingredient: ingredientName)
            }
            ingredientsTableView.reloadData()
            ingredientsTextField.text = ""
        } else {
            showAlert(title: "Hey!", message: "You need to tell me what's in your fridge first!")
        }
    }
    
    private func clearList() {
        if IngredientService.shared.ingredients.isEmpty == false  {
            IngredientService.shared.ingredients.removeAll()
            ingredientsTableView.reloadData()
        } else {
            showAlert(title: "Hey!", message: "Don't clear what you already don't have!")
        }
    }
    
    private func searchRecipe() {
        guard let searchIngredientstextField = ingredientsTextField.text else { return }
        SearchRecipeService.shared.getSearchRecipe(searchParameters: searchIngredientstextField) { (success, recipe) in
            self.toggleActivityIndicator(shown: true)
            if success, let recipe = recipe {

                self.toggleActivityIndicator(shown: false)
            } else {
                self.showAlert(title: "Error", message: "Recipes data download failed!")
            }
        }
    }
    
    private func registerIngredientsTableView() {
        ingredientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ingredientCell")
        ingredientsTableView.reloadData()
    }
    
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        searchForRecipesButton.isHidden = shown
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension SearchRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IngredientService.shared.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        
        let ingredient = IngredientService.shared.ingredients[indexPath.row]
        
        cell.textLabel?.text = "- " + ingredient.name
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        
        return cell
    }
}

    




