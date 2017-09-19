//
//  DataServices.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

struct DataDependencies: HasNetworkService, HasParsingService {
  
  // MARK: - PROPERTIES
  
  let networkService: PokemonNetworkProtocol
  let parserService: PokemonParserProtocol
  
  // MARK: - INITIALIZER
  
  init() {
    networkService = PokemonNetwork()
    parserService = PokemonParser()
  }
  
}
