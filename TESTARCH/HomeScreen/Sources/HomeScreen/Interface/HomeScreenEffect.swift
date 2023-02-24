//
//  HomeScreenEffect.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import Foundation

public enum HomeScreenEffect {}

public protocol HomeScreenControllerDelegate: AnyObject {
  func handle(_ effect: HomeScreenEffect)
}
