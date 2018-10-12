//
//  RecipeService.swift
//  Reciplease
//
//  Created by Christophe DURAND on 12/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation

class RecipeService {
    
    static let shared = RecipeService()
    private init() {}
    
    var recipes: [Recipe] = []
}
