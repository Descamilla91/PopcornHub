//
//  UpcomingMoviesWorker.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 27/07/21.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Alamofire

protocol UpcomingMoviesWorkerInterface {
	func fetchUpcomingMovies(_ request: UpcomingMoviesModels.FetchUpcomingMovies.Request, completion: @escaping (Result<PopularMoviesResponse?, Error>) -> Void)
}

class UpcomingMoviesWorker: UpcomingMoviesWorkerInterface {
	func fetchUpcomingMovies(_ request: UpcomingMoviesModels.FetchUpcomingMovies.Request, completion: @escaping (Result<PopularMoviesResponse?, Error>) -> Void) {
		let networkRouter = NetworkRouter.UpcomingMovies(page: request.page)
		AF.request(networkRouter).response { response in
			if let data = response.data {
				do {
					let decoder = JSONDecoder()
					let movieResponse = try decoder.decode(PopularMoviesResponse.self, from: data)
					completion(.success(movieResponse))
				} catch let error {
					completion(.failure(error))
				}
			} else if let error = response.error {
				completion(.failure(error))
			}
		}
	}
}
