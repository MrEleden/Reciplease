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
    
    //MARK: - Properties
    private var searchRecipeSessionManager: SessionManager
    
    init(searchRecipeSessionManager: SessionManager = SessionManager.default) {
        self.searchRecipeSessionManager = searchRecipeSessionManager
    }
    
    //MARK: - Method
    func getRecipe(ingredients: [String], completion: @escaping (Bool, [Matches]?) -> Void) {
        let url = YummlyAPI.baseURL + YummlyAPI.appIDURL + YummlyAPI.appID + YummlyAPI.appKeyURL + YummlyAPI.appKey + YummlyAPI.picturesURL + YummlyAPI.query
        let parameters = ["q": ingredients]
        searchRecipeSessionManager.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            guard let data = response.data, response.error == nil else {
                completion(false, nil)
                return
            }
            guard let response = response.response, response.statusCode == 200 else {
                completion(false, nil)
                return
            }
            guard let searchRecipeResponseJSON = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                completion(false, nil)
                return
            }
            completion(true, searchRecipeResponseJSON.matches)
        }
    }
}

    
    
    
    
    
    
    

