//
//  HomeView.swift
//  charlieexpert
//
//  Created by addin on 09/03/21.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
      ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
          ProgressView()
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(
            self.presenter.categories,
            id: \.id
          ) { category in
            ZStack {
              presenter.linkBuilder(for: category) { 
                CategoryRow(category: category)
              }
            }.padding(8)
          }
        }
      }
    }
      .onAppear {
        if presenter.categories.count == 0 {
          presenter.getCategories()
        }
      }
      .navigationBarTitle(
        Text("Meals Apps"),
        displayMode: .automatic
      )
  }
}
