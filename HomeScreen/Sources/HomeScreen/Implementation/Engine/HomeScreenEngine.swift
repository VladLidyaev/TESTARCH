//
//  HomeScreenEngine.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit

enum HomeScreenAction {
  case shouldBePresented(on: UIViewController)
  case presented
}

enum HomeScreenEngine {
 static func process(
   _ model: inout HomeScreenModel,
   with action: HomeScreenAction
 ) -> HomeScreenEffect? {
   switch action {
   case .shouldBePresented(let controller):
     model = .presenting(on: controller)
     return .none
   case .presented:
     model = .presented
     return .none
   }
 }
}
