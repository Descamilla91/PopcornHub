//
//  MovieDetailRouter.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 30/07/21.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MovieDetailRouterInterface {
    
}

protocol MovieDetailDataPassing {
    var dataStore: MovieDetailDataStore? { get }
}

class MovieDetailRouter: MovieDetailRouterInterface, MovieDetailDataPassing {
    
    // MARK: - Properties
    
    weak var viewController: MovieDetailViewController?
    var dataStore: MovieDetailDataStore?
}