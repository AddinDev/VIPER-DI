//
//  CategoryMapper.swift
//  charlieexpert
//
//  Created by addin on 09/03/21.
//

import Foundation

final class CategoryMapper {
  static func mapCategoryToDomain(input categories: [CategoryResponse]) -> [CategoryModel] {
    return categories.map { result in
      return CategoryModel(id: result.id ?? "",
                           title: result.title ?? "",
                           image: result.image ?? "",
                           description: result.description ?? "")
    }
  }
}
