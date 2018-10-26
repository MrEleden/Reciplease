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
    
    func getDetailedRecipe(id: String, completion: @escaping (Bool, DetailedRecipe?) -> Void) {
        let url = YummlyDetailedRecipeAPI.baseURL + "\(id)?" + YummlyDetailedRecipeAPI.appIDURL + YummlyDetailedRecipeAPI.appID + YummlyDetailedRecipeAPI.appKeyURL + YummlyDetailedRecipeAPI.appKey
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { response in
            guard let data = response.data, response.error == nil else {
                print(String(describing: response.error?.localizedDescription))
                completion(false, nil)
                return }
            guard let detailedRecipeResponseJSON = try? JSONDecoder().decode(DetailedRecipe.self, from: data) else {
                print(String(describing: response.error?.localizedDescription))
                completion(false, nil)
                return }
            completion(true, detailedRecipeResponseJSON)
        }
    }
}
