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
    
    static let shared = SearchRecipeService()
    private init() {}

    func getRecipe(ingredients: [String], completion: @escaping ([Matches]?) -> Void) {
        let url = YummlyAPI.baseURL + YummlyAPI.appIDURL + YummlyAPI.appID + YummlyAPI.appKeyURL + YummlyAPI.appKey + YummlyAPI.picturesURL
        let searchParameters = ["q": ingredients]
        Alamofire.request(url, parameters: searchParameters, encoding: URLEncoding.queryString).validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                guard response.error == nil else { return }
                let searchRecipeResponseJSON = try? JSONDecoder().decode(SearchRecipe.self, from: data)
                completion(searchRecipeResponseJSON?.matches)
            case .failure:
                completion(nil)
            }
        }
    }
    
    
    
    
    
    
    
    
    
}
