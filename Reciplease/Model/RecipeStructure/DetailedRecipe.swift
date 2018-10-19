//
//  DetailedRecipe.swift
//  Reciplease
//
//  Created by Christophe DURAND on 19/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation

struct DetailedRecipe: Decodable {
    let totalTime: Int
    let images: [Images]
    let name: String
    let source: Source
    let ingredientLines: [String]
    let rating: Int
}

struct Images: Decodable {
    let hostedLargeUrl: String
}

struct Source: Decodable {
    let sourceRecipeUrl: String
}


