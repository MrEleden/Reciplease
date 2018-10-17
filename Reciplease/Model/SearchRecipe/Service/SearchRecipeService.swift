//
//  SearchRecipeService.swift
//  Reciplease
//
//  Created by Christophe DURAND on 02/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation
import Alamofire

class SearchRecipeService {
    
    private func urlRecipe(ingredients: String) -> String {
        var recipeURL: String
        guard let ingredientsParametersURL = ingredients.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        recipeURL = YummlyAPI.baseURL + YummlyAPI.appIDURL + YummlyAPI.appID + YummlyAPI.appKeyURL + YummlyAPI.appKey + YummlyAPI.picturesURL + YummlyAPI.query + ingredientsParametersURL
        let url = recipeURL
        return url
    }
    
    func getRecipe(ingredients: String, completion: @escaping (Bool, [Matches]?) -> Void) {
        guard let url = URL(string: urlRecipe(ingredients: ingredients)) else { return }

        Alamofire.request(url, method: .get).responseJSON { response in
            guard let data = response.data, response.error == nil else {
                print("c'est de la merde data")
                completion(false, [])
                return }
            guard let response = response.response, response.statusCode == 200 else {
                print("c'est de la merde statuscode")
                completion(false, [])
                return
            }
            guard let searchRecipeResponseJSON = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                print("c'est de la merde searchreciperesponseJSON")
                completion(false, [])
                return }
            print("c'est bieng")
            completion(true, searchRecipeResponseJSON.matches)
            }
    }
}

    
    
    
    
    
    
    

