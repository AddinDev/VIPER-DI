//
//  MealRepository.swift
//  charlieexpert
//
//  Created by addin on 09/03/21.
//

import Foundation

protocol MealRepositoryProtocol {
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void)

}

class MealRepository {
  
  typealias MealInstance = (RemoteDataSource) -> MealRepository
  fileprivate let remote: RemoteDataSource
  
  static let sharedInstance: MealInstance = { remoteRepo in
    return MealRepository(remote: remoteRepo)
  }
  
  init(remote: RemoteDataSource) {
    self.remote = remote
  }
  
}

extension MealRepository: MealRepositoryProtocol {
  
  func getCategories(result: @escaping (Result<[CategoryModel], Error>) -> Void) {
    remote.getCategories { remoteResponse in
      switch remoteResponse {
      case .success(let categoryResponses):
        let resultList = CategoryMapper.mapCategoryToDomain(input: categoryResponses)
        result(.success(resultList))
      case .failure(let error):
        result(.failure(error))
      }
    }
  }

}
