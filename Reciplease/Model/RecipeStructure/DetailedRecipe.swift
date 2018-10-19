//
//  DetailedRecipe.swift
//  Reciplease
//
//  Created by Christophe DURAND on 19/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation

struct DetailedRecipe: Decodable {
    let name: String
    let ingredientLines: [String]
    let source: Source
    let images: [URLImages]
    let rating: Int
    let totalTimeInSeconds: Int
}

struct Source: Decodable {
    let sourceRecipeUrl: String
}

struct URLImages: Decodable {
    let hostedLargeUrl: String
}
