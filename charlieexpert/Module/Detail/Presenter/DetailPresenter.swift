//
//  DetailPresenter.swift
//  charlieexpert
//
//  Created by addin on 10/03/21.
//

import Foundation

class DetailPresenter: ObservableObject {
  
  private let detailUseCase: DetailUseCase
  
  @Published var category: CategoryModel
  @Published var loadingState: Bool = false
  @Published var errorMessage: String = ""
  
  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
    self.category = detailUseCase.getCategory()
  }
  
}
