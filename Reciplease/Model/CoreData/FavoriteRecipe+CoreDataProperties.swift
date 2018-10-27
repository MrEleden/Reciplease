//
//  FavoriteRecipe+CoreDataProperties.swift
//  Reciplease
//
//  Created by Christophe DURAND on 26/10/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//
//

import Foundation
import CoreData

extension FavoriteRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteRecipe> {
        return NSFetchRequest<FavoriteRecipe>(entityName: "FavoriteRecipe")
    }

    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var rating: Int16
    @NSManaged public var recipeName: String?
    @NSManaged public var sourceUrl: String?
    @NSManaged public var totalTimeInSeconds: Int16

}
