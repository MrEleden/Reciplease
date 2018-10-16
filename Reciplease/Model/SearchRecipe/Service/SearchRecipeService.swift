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
    
    func getRecipe(ingredients: [String], completion: @escaping (SearchRecipe?) -> Void) {
        let url = YummlyAPI.baseURL + YummlyAPI.appIDURL + YummlyAPI.appID + YummlyAPI.appKeyURL + YummlyAPI.appKey + YummlyAPI.picturesURL + YummlyAPI.query
        let parameters = ["q": ingredients]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data, response.error == nil else {
                    completion(nil)
                    return }
                guard let searchRecipeResponseJSON = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                    completion(nil)
                    return
                }
                completion(searchRecipeResponseJSON)
            case .failure:
                completion(nil)
            }
        }
    }
}

    
    
    
    
    
    
    

