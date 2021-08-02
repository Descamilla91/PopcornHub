//
//  LocalImages.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 27/07/21.
//

import Foundation
import UIKit

enum LocalImages {
	enum Common {
		static let placeHolder = UIImage(named: "placeholder")!
		static let searchImages = UIImage(named: "search")!
	}
	
	enum PopularMovies {
		static let popularIcon = UIImage(named: "popular")!
	}
	
	enum TopRatedMovies {
		static let podiumIcon = UIImage(named: "podium")!
	}
	
	enum UpcomingMovies {
		static let soonIcon = UIImage(named: "comingsoon")!
	}
	
	enum SearchMovies {
		static let searchIcon = UIImage(named: "search")!
	}
}
