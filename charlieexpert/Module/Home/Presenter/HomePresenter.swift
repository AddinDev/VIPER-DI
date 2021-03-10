//
//  HomePresenter.swift
//  charlieexpert
//
//  Created by addin on 09/03/21.
//

import SwiftUI

class HomePresenter: ObservableObject {
  
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  
  @Published var categories: [CategoryModel] = []
  @Published var loadingState: Bool = false
  @Published var errorMessage: String = ""

  init(useCase: HomeUseCase) {
    self.homeUseCase = useCase
  }
  
  func getCategories() {
    loadingState = true
    homeUseCase.getCategories { result in
      switch result {
      case .success(let categories):
        DispatchQueue.main.async {
          self.categories = categories
          self.loadingState = false
        }
      case .failure(let error):
        self.loadingState = false
        self.errorMessage = error.localizedDescription
      }
    }
  }
  
  func linkBuilder<Content: View>(for category: CategoryModel, @ViewBuilder content: () -> Content) -> some View {
    NavigationLink(destination: router.makeDetailView(for: category)) { content() }
  }
  
}
