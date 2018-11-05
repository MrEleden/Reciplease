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
    
    //MARK: - Properties
    private var detailedRecipeSessionManager: SessionManager
    
    init(detailedRecipeSessionManager: SessionManager = SessionManager.default) {
        self.detailedRecipeSessionManager = detailedRecipeSessionManager
    }
    
    //MARK: - Method
    func getDetailedRecipe(id: String, completion: @escaping (Bool, DetailedRecipe?) -> Void) {
        let url = YummlyDetailedRecipeAPI.baseURL + "\(id)?" + YummlyDetailedRecipeAPI.appIDURL + YummlyDetailedRecipeAPI.appID + YummlyDetailedRecipeAPI.appKeyURL + YummlyDetailedRecipeAPI.appKey
        detailedRecipeSessionManager.request(url, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { response in
            guard let data = response.data, response.error == nil else {
                print(String(describing: response.error?.localizedDescription))
                completion(false, nil)
                return
            }
            guard let response = response.response, response.statusCode == 200 else {
                completion(false, nil)
                return
            }
            guard let detailedRecipeResponseJSON = try? JSONDecoder().decode(DetailedRecipe.self, from: data) else {
                completion(false, nil)
                return
            }
            completion(true, detailedRecipeResponseJSON)
        }
    }
}
