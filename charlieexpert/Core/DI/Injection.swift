//
//  Injection.swift
//  charlieexpert
//
//  Created by addin on 09/03/21.
//

import Foundation

class Injection {
  
  private func provideRepo() -> MealRepository {
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    return MealRepository.sharedInstance(remote)
  }
  
  func provideHome() -> HomeUseCase {
    return HomeInteractor(repo: provideRepo())
  }
  
  func provideDetil(category: CategoryModel) -> DetailUseCase {
    return DetailInteractor(repository: provideRepo(), category: category)
  }
  
}
