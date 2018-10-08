//
//  SearchRecipe.swift
//  Reciplease
//
//  Created by Christophe DURAND on 08/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation

struct SearchRecipe: Decodable {
    var matches: Matches
}

struct Matches: Decodable {
    let id: String
    let recipeName: String
    let ingredients: [String]
    let imageUrlsBySize: URL
    let smallImageUrls: URL
    let totalTimeInSeconds: Int
    let rating: Int
}
