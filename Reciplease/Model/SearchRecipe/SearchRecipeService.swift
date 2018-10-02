//
//  SearchRecipeService.swift
//  Reciplease
//
//  Created by Christophe DURAND on 02/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class SearchRecipeService {
    
    private func urlSearchRecipe(parameter: String) -> String {
        var searchRecipeURL: String
        guard let searchParameter = parameter.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        searchRecipeURL = YummlyAPI.baseURL + YummlyAPI.appIDURL + YummlyAPI.appID + YummlyAPI.appKeyURL + YummlyAPI.appKey + YummlyAPI.parametersURL + searchParameter + YummlyAPI.picturesURL
        let url = searchRecipeURL
        return url
    }
    
    func getSearchRecipe(searchParameter: String) {
        guard let url = URL(string: urlSearchRecipe(parameter: searchParameter)) else { return }
        DispatchQueue.main.async {
            Alamofire.request(url)
                .responseJSON { response in

            }
        }
    }
}
