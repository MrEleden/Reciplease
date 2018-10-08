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
    
    private func urlSearchRecipe(searchParameters: String) -> String {
        var searchRecipeURL: String
        guard let searchParameters = searchParameters.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        searchRecipeURL = YummlyAPI.baseURL + YummlyAPI.appIDURL + YummlyAPI.appID + YummlyAPI.appKeyURL + YummlyAPI.appKey + YummlyAPI.parametersURL + searchParameters + YummlyAPI.picturesURL
        let url = searchRecipeURL
        return url
    }
    
    func getSearchRecipe(searchParameters: String, completion:@escaping (Bool, SearchRecipe?) -> Void) {
        guard let url = URL(string: urlSearchRecipe(searchParameters: searchParameters)) else { return }
        Alamofire.request(url, method: .get, parameters: nil).responseJSON { response in
            guard let data = response.data, response.error == nil else {
                completion(false, nil)
                return
            }
            guard response.response?.statusCode == 200 else {
                completion(false, nil)
                return
            }
            guard let searchRecipeResponseJSON = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                completion(false, nil)
                return
            }
            completion(true, searchRecipeResponseJSON)
        }
    }
}
