//
//  TopRatedMoviesPresenter.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 27/07/21.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TopRatedMoviesPresenterInterface {
    func presentTopRatedMovies(response: TopRatedMoviesModels.FetchTopRatedMovies.Response)
	func presentSelectedTopRatedMovie()
}

class TopRatedMoviesPresenter: TopRatedMoviesPresenterInterface {
    
    // MARK: - Properties
    
    weak var viewController: TopRatedMoviesDisplayInterface?
    
    // MARK: - TopRatedMoviesPresenterInterface
    
    func presentTopRatedMovies(response: TopRatedMoviesModels.FetchTopRatedMovies.Response) {
		let displayableMediaList = getDisplayableMediaList(mediaList: response.mediaList)
		let viewModel = TopRatedMoviesModels.FetchTopRatedMovies.ViewModel(displayableMediaList: displayableMediaList)
        viewController?.displayTopRatedMovies(topRatedMoviesViewModel: viewModel)
    }
	
	func presentSelectedTopRatedMovie() {
		viewController?.displaySelectedMovie()
	}
	
	private func getDisplayableMediaList(mediaList: [MediaResult]) -> [DisplayableTopRatedMovie] {
		mediaList.map { mediaResult in
			let title = mediaResult.title ?? LocalStrings.Common.doNotExist
			let overview = mediaResult.overview ?? LocalStrings.Common.doNotExist
			let averageVote = LocalStrings.MediaCell.votesKeyLabel + (mediaResult.voteAverage == nil ? LocalStrings.Common.doNotExist : String(mediaResult.voteCount ?? 0))
			let image = mediaResult.posterPath ?? ""
			return DisplayableTopRatedMovie(title: title, firstInformationData: overview, secondInformationData: averageVote, mediaImageUrl: image, mediaSection: .TopRated)
		}
	}
}
