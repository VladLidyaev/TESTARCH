//
//  HomeScreenEngine.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit

enum HomeScreenAction {
  case shouldBePresented(on: UIViewController)
  case fetchingNews
  case successFetchedNews(NewsModel)
  case failureFetchedNews
}

enum HomeScreenEngine {
 static func process(
   _ model: inout HomeScreenModel,
   with action: HomeScreenAction
 ) -> HomeScreenEffect? {
   switch action {
   case .shouldBePresented(let controller):
     model = .presenting(on: controller)
   case .fetchingNews:
     model = .loading
   case .successFetchedNews(let newsModel):
     model = .data(newsModel)
   case .failureFetchedNews:
     model = .error
   }
   return .none
 }
}
