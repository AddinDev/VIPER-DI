//
//  DetailView.swift
//  charlieexpert
//
//  Created by addin on 10/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter
  
  var body: some View {
    ZStack {
      if presenter.loadingState {
        loadingIndicator
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
            imageCategory
            spacer
            content
            spacer
          }.padding()
        }
      }
    }.navigationBarTitle(Text(self.presenter.category.title), displayMode: .large)
  }
}

extension DetailView {
  var spacer: some View {
    Spacer()
  }
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
    }
  }
  
  var imageCategory: some View {
    WebImage(url: URL(string: self.presenter.category.image))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .frame(width: 250.0, height: 250.0, alignment: .center)
  }
  
  var description: some View {
    Text(self.presenter.category.description)
      .font(.system(size: 15))
  }
  
  func headerTitle(_ title: String) -> some View {
    return Text(title)
      .font(.headline)
  }
  
  var content: some View {
    VStack(alignment: .leading, spacing: 0) {
      headerTitle("Description")
        .padding([.top, .bottom])
      description
    }
  }
}

