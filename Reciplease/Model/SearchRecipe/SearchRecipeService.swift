//
//  SearchRecipeService.swift
//  Reciplease
//
//  Created by Christophe DURAND on 02/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SearchRecipeService {
    
    var id: String = ""
    var recipeName: String = ""
    var recipeImage: URL = URL(string: "")!
    var ingredients = [String]()
    var totalTime: Int = 0
    var rating: Int = 0
    
    
    private func urlSearchRecipe(searchParameters: String) -> String {
        var searchRecipeURL: String
        guard let searchParameters = searchParameters.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return "" }
        searchRecipeURL = YummlyAPI.baseURL + YummlyAPI.appIDURL + YummlyAPI.appID + YummlyAPI.appKeyURL + YummlyAPI.appKey + YummlyAPI.parametersURL + searchParameters + YummlyAPI.picturesURL
        let url = searchRecipeURL
        return url
    }
    
//    func getSearchRecipe(searchParameter: String, completion: @escaping (, Error?)) -> Void {
//        guard let url = URL(string: urlSearchRecipe(parameter: searchParameter)) else { return }
//        DispatchQueue.main.async {
//            Alamofire.request(url, method: .get).validate().responseJSON { response in
//                switch response.result {
//                case .success:
//                    if let response = response.result.value as? [String: Any] {
//                        if let matches = response["matches"] as? [String: Any] {
//
//                        }
//
//                    }
//                case .failure(let error):
//                    print("Error: \(error.localizedDescription)")
//                    completion(nil, error)
//                }
//            }
//        }
//    }
    func searchRecipe(searchParameters: String, parameters: [String: String]) {
        guard let url = URL(string: urlSearchRecipe(searchParameters: searchParameters)) else { return }
        DispatchQueue.main.async {
            Alamofire.request(url, method: .get, parameters: parameters).validate().responseJSON { response in
                switch response.result {
                case .success:
                    let searchRecipeJSON: JSON = JSON(response.result.value!)
                    self.updateSearchRecipeData(json: searchRecipeJSON)
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    //TODO: show alert
                }
            }
        }
    }
    
    func updateSearchRecipeData(json: JSON) {
        guard let idRecipe = json["matches"]["id"].string else {
            //TODO: show alert
            return }
        id = idRecipe
        recipeName = json["recipeName"].stringValue
        recipeImage = json["imageUrlsBySize"]["90"].url!
        ingredients = json["ingredients"].arrayObject as! [String]
        totalTime = json["totalTimeInSecond"].intValue
        rating = json["rating"].intValue
    }
}
