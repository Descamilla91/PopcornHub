//
//  UpcomingMoviesPresenter.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 27/07/21.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UpcomingMoviesPresenterInterface {
    func presentUpcomingMovies(response: UpcomingMoviesModels.FetchUpcomingMovies.Response)
	func presentMovieDetail()
}

class UpcomingMoviesPresenter: UpcomingMoviesPresenterInterface {
    
    // MARK: - Properties
    
    weak var viewController: UpcomingMoviesDisplayInterface?
    
    // MARK: - UpcomingMoviesPresenterInterface
    
    func presentUpcomingMovies(response: UpcomingMoviesModels.FetchUpcomingMovies.Response) {
		let displayableUpcomingMovies = getDisplayableUpcomingMovies(mediaList: response.mediaList)
        let viewModel = UpcomingMoviesModels.FetchUpcomingMovies.ViewModel(displayableMediaList: displayableUpcomingMovies)
        viewController?.displayUpcomingMovies(upcomingMoviesViewModel: viewModel)
    }
	
	func presentMovieDetail() {
		viewController?.displayMovieDetail()
	}
	
	private func getDisplayableUpcomingMovies(mediaList: [MediaResult]) -> [DisplayableUpcomingMovie] {
		mediaList.map { mediaResult in
			let title = mediaResult.title ?? LocalStrings.Common.doNotExist
			let date = LocalStrings.MediaCell.dateKeyLabel + (mediaResult.releaseeDate ?? LocalStrings.Common.doNotExist)
			let image = mediaResult.posterPath ?? ""
			return DisplayableUpcomingMovie(title: title, firstInformationData: date, secondInformationData: "", mediaImageUrl: image, mediaSection: .Upcoming)
		}
	}
}
