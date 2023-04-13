//
//  HomeScreenControllerDelegate.swift
//  
//
//  Created by Vladislav Lidiaev on 25.02.2023.
//

import UIKit

public enum HomeScreenEffect {}

public protocol HomeScreenControllerDelegate: AnyObject {
  func handle(_ effect: HomeScreenEffect)
}
