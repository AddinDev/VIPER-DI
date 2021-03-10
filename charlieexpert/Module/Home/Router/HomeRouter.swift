//
//  HomeRouter.swift
//  charlieexpert
//
//  Created by addin on 10/03/21.
//

import SwiftUI

class HomeRouter {
  
  func makeDetailView(for category: CategoryModel) -> some View {
    let detailUseCase = Injection.init().provideDetil(category: category)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    return DetailView(presenter: presenter)
  }
  
}
