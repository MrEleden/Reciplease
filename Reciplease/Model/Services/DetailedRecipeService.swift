//
//  DetailedRecipeService.swift
//  Reciplease
//
//  Created by Christophe DURAND on 19/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation
import Alamofire

class DetailedRecipeService {
    
    func getDetailedRecipe(recipeID: String, completion: @escaping (Bool, DetailedRecipe?) -> Void) {
        let url = YummlyAPI.baseURL + "\(recipeID)?" + YummlyAPI.appIDURL + YummlyAPI.appID + YummlyAPI.appKeyURL + YummlyAPI.appKey
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { response in
            print(response)
            guard let data = response.data, response.error == nil else {
                print(String(describing: response.error?.localizedDescription))
                completion(false, nil)
                return }
            guard let detailedRecipeResponseJSON = try? JSONDecoder().decode(DetailedRecipe.self, from: data) else {
                print(String(describing: response.error?.localizedDescription))
                completion(false, nil)
                return }
            print(detailedRecipeResponseJSON)
            completion(true, detailedRecipeResponseJSON)
        }
    }
}
