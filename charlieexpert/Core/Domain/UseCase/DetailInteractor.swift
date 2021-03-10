//
//  DetailInteractor.swift
//  charlieexpert
//
//  Created by addin on 10/03/21.
//

import Foundation

protocol DetailUseCase {
  func getCategory() -> CategoryModel
}

class DetailInteractor: DetailUseCase {
  
  private let repository: MealRepositoryProtocol
  private let category: CategoryModel
  
  init(repository: MealRepositoryProtocol, category: CategoryModel) {
    self.repository = repository
    self.category = category
  }
  
  func getCategory() -> CategoryModel {
    return category
  }

  
}
