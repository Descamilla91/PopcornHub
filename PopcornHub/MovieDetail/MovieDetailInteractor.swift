//
//  MovieDetailInteractor.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 30/07/21.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol MovieDetailInteractorInterface {
    func fetchMovieDetail()
}

protocol MovieDetailDataStore {
	var movieDetail: MediaResult { get set }
}

class MovieDetailInteractor: MovieDetailInteractorInterface, MovieDetailDataStore {
    // MARK: - Properties
    
    var presenter: MovieDetailPresenterInterface?
    var worker: MovieDetailWorkerInterface = MovieDetailWorker()
	var movieDetail = MediaResult()
    
    // MARK: - MovieDetailInteractorInterface
    
    func fetchMovieDetail() {
		let response = MovieDetailModels.FetchMovieDetail.Response(movieDetail: movieDetail)
        presenter?.presentMovieDetail(response: response)
    }
}
