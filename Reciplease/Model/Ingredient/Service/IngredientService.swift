//
//  IngredientService.swift
//  Reciplease
//
//  Created by Christophe DURAND on 11/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation

class IngredientService {
    
    static let shared = IngredientService()
    private init() {}
    
    var ingredients: [Ingredient] = []

    
    func add(ingredient: Ingredient) {
        ingredients.append(ingredient)
    }
}
