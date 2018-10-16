//
//  IngredientService.swift
//  Reciplease
//
//  Created by Christophe DURAND on 11/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation

class IngredientService {
    
    var ingredients: [String] = []

    func add(ingredient: String) {
        ingredients.append(ingredient)
    }
}
