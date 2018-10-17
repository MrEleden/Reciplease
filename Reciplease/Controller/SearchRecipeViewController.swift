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
    
    var ingredients: [String] = []
    var recipes: SearchRecipe!
    var searchRecipeService = SearchRecipeService()
    var resultRecipesListViewController = ResultRecipesListViewController()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchForRecipeButtonIsEnabled()
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
                let ingredientAddToList = ingredient
                let ingredientName = ingredientAddToList
                self.add(ingredient: ingredientName)
            }
            ingredientsTableView.reloadData()
            ingredientsTextField.text = ""
        } else {
            showAlert(title: "Hey!", message: "You need to tell me what's in your fridge first!")
        }
    }
    
    private func add(ingredient: String) {
        ingredients.append(ingredient)
    }
    
    private func clearList() {
        if ingredients.isEmpty == false  {
            ingredients.removeAll()
            ingredientsTableView.reloadData()
            searchForRecipesButton.isEnabled = false
            searchForRecipesButton.backgroundColor = UIColor.lightGray
        } else {
            showAlert(title: "Hey!", message: "Don't clear what you already don't have!")
        }
    }
    
    private func searchRecipe() {
        searchRecipeService.getRecipe(ingredients: convertIngredientsArrayIntoString(ingredients: ingredients)) { (success, recipes) in
            //TODO
            self.toggleActivityIndicator(shown: true)
            if success, let recipes = recipes {
                self.recipes = recipes
                self.performSegue(withIdentifier: "segueToRecipesResults", sender: self)
                self.toggleActivityIndicator(shown: false)
                self.resultRecipesListViewController.resultRecipeListTableView.reloadData()
            } else {
                self.showAlert(title: "Error", message: "Recipes data download failed!")
            }
        }
    }
    
    private func searchForRecipeButtonIsEnabled() {
        searchForRecipesButton.isEnabled = false
        searchForRecipesButton.backgroundColor = UIColor.lightGray
    }
    
    func convertIngredientsArrayIntoString(ingredients: [String]) -> String {
        let ingredientsArray = ingredients.map{ String($0) }
        return ingredientsArray.joined(separator: ",")
    }
    
    private func registerIngredientsTableView() {
        ingredientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ingredientCell")
        ingredientsTableView.reloadData()
    }
    
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        searchForRecipesButton.isHidden = shown
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToRecipesResults" {
            let resultsVC = segue.destination as! ResultRecipesListViewController
            resultsVC.recipes = recipes
        }
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
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        
        let ingredient = ingredients[indexPath.row]
        
        cell.textLabel?.text = "-" + " \(ingredient)"
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        
        let cellTextLabel = cell.textLabel?.text
        
        if cellTextLabel?.isEmpty == false {
            searchForRecipesButton.isEnabled = true
            searchForRecipesButton.backgroundColor = UIColor.init(red: 0/255, green: 144/255, blue: 81/255, alpha: 1)
        }
        return cell
    }
}


    




