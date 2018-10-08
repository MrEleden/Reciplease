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
    
    let searchRecipeService = SearchRecipeService()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleActivityIndicator(shown: false)
    }
    
    @IBAction func clear(_ sender: UIButton) {

    }
    
    @IBAction func add(_ sender: UIButton) {
       
    }
    
    @IBAction func searchForRecipes(_ sender: UIButton) {
        searchRecipe()
    }
    
    private func searchRecipe() {
        guard let searchIngredientstextField = ingredientsTextField.text else { return }
        searchRecipeService.getSearchRecipe(searchParameters: searchIngredientstextField) { (success, recipe) in
            self.toggleActivityIndicator(shown: true)
            if success {
                self.toggleActivityIndicator(shown: false)
            } else {
                self.showAlert(title: "Error", message: "Recipes data download failed!")
            }
        }
    }
    
    private func toggleActivityIndicator(shown: Bool) {
        activityIndicator.isHidden = !shown
        searchForRecipesButton.isHidden = shown
    }
}




