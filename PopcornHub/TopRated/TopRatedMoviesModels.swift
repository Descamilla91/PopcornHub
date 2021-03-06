//
//  TopRatedMoviesModels.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 27/07/21.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum TopRatedMoviesModels {
    
    // MARK: Use cases
    
    enum FetchTopRatedMovies {
        
        struct Request {
            var page = 1
        }
        
        struct Response {
			var mediaList = [MediaResult]()
			var error: Error?
        }
        
        struct ViewModel {
            var displayableMediaList = [DisplayableTopRatedMovie]()
        }
    }
	
	enum SelectTopRatedMovie {
		
		struct Request {
			var index: Int
		}
	}
}
