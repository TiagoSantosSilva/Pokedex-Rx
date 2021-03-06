//
//  PokedexListCoordinator.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit
import RxSwift
import Action

protocol PokedexListNavigation {
  var showDetails: Action<String, Void> { get }
}

class PokedexListCoordinator {

  // MARK: - DEPENDENCIES
  
  fileprivate let navigator: NavigatorRepresentable
  fileprivate let dataDependencies: DataDependencies
  
  // MARK: - NAVIGATION
  
  fileprivate struct Navigation: PokedexListNavigation {
    let showDetails: Action<String, Void>
  }
  
  // MARK: - INITIALIZER
  
  init(navigator: NavigatorRepresentable, dataDependencies: DataDependencies) {
    self.navigator = navigator
    self.dataDependencies = dataDependencies
  }
  
}

extension PokedexListCoordinator: Coordinator {
  
  func start() {
    let pokedexListViewController = PokedexListViewController()
    let navigation = buildNavigationActions()
    let pokedexListViewModel = PokedexListViewModel(dataDependencies: dataDependencies, navigation: navigation)
    pokedexListViewController.viewModel = pokedexListViewModel
    navigator.transition(to: pokedexListViewController, type: .root)
  }
  
  private func buildNavigationActions() -> Navigation {
    // show details
    let showDetails = Action<String, Void> { pokemonId in
      let podedexDetailsCoordinator = PokedexDetailsCoordinator(navigator: self.navigator, dataDependencies: self.dataDependencies, pokemonId: pokemonId)
      podedexDetailsCoordinator.start()
      return Observable.empty()
    }
    
    return Navigation(showDetails: showDetails)
  }
  
}
