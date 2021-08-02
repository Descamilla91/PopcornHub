//
//  Seeds.swift
//  PopcornHubTests
//
//  Created by Diego Escamilla on 01/08/21.
//

@testable import PopcornHub
import Foundation

enum Dummies {
	enum Common {
		static let displayablePopularMovies = [DisplayablePopularMovie(title: "title1", firstInformationData: "firstInformationData", secondInformationData: "secondInformationData", mediaImageUrl: "mediaImageUrl", mediaSection: .Popular),
											   DisplayablePopularMovie(title: "title2", firstInformationData: "firstInformationData2", secondInformationData: "secondInformationData2", mediaImageUrl: "mediaImageUrl2", mediaSection: .Popular),
											   DisplayablePopularMovie(title: "title3", firstInformationData: "firstInformationData3", secondInformationData: "secondInformationData3", mediaImageUrl: "mediaImageUrl3", mediaSection: .Popular)]
		
		static let displayableTopRatedMovies = [DisplayableTopRatedMovie(title: "title1", firstInformationData: "firstInformationData", secondInformationData: "secondInformationData", mediaImageUrl: "mediaImageUrl", mediaSection: .Popular),
												DisplayableTopRatedMovie(title: "title2", firstInformationData: "firstInformationData2", secondInformationData: "secondInformationData2", mediaImageUrl: "mediaImageUrl2", mediaSection: .Popular),
												DisplayableTopRatedMovie(title: "title3", firstInformationData: "firstInformationData3", secondInformationData: "secondInformationData3", mediaImageUrl: "mediaImageUrl3", mediaSection: .Popular)]
		
		static let displayableUpcomingMovies = [DisplayableUpcomingMovie(title: "title1", firstInformationData: "firstInformationData", secondInformationData: "secondInformationData", mediaImageUrl: "mediaImageUrl", mediaSection: .Popular),
												DisplayableUpcomingMovie(title: "title2", firstInformationData: "firstInformationData2", secondInformationData: "secondInformationData2", mediaImageUrl: "mediaImageUrl2", mediaSection: .Popular),
												DisplayableUpcomingMovie(title: "title3", firstInformationData: "firstInformationData3", secondInformationData: "secondInformationData3", mediaImageUrl: "mediaImageUrl3", mediaSection: .Popular)]
		
		static let error = NSError(domain: Bundle.main.bundleIdentifier!, code: 404, userInfo: ["error": "404 - Server Not Found"])
		
		static func getPopularMoviesResponse() -> PopularMoviesResponse {
			let firstMediaResult = MediaResult()
			firstMediaResult.title = "title"
			firstMediaResult.originalTitle = "originalTitle"
			firstMediaResult.originalLanguage = "originalLanguage"
			firstMediaResult.releaseeDate = "releaseeDate"
			firstMediaResult.backdropPath = "backdropPath"
			firstMediaResult.posterPath = "posterPath"
			firstMediaResult.overview = "overview"
			firstMediaResult.hasAdultContent = false
			firstMediaResult.hasVideo = false
			firstMediaResult.genreIds = [0, 1, 2]
			firstMediaResult.id = 10
			firstMediaResult.popularity = 100
			firstMediaResult.voteAverage = 100
			firstMediaResult.voteCount = 10
			
			let popularMoviesResponse = PopularMoviesResponse()
			popularMoviesResponse.page = 1
			popularMoviesResponse.totalPages = 1
			popularMoviesResponse.totalResult = 0
			popularMoviesResponse.results = [firstMediaResult]
			
			return popularMoviesResponse
		}
		
		static func getMediaList() -> [MediaResult] {
			let firstMediaResult = MediaResult()
			firstMediaResult.title = "title"
			firstMediaResult.originalTitle = "originalTitle"
			firstMediaResult.originalLanguage = "originalLanguage"
			firstMediaResult.releaseeDate = "releaseeDate"
			firstMediaResult.backdropPath = "backdropPath"
			firstMediaResult.posterPath = "posterPath"
			firstMediaResult.overview = "overview"
			firstMediaResult.hasAdultContent = false
			firstMediaResult.hasVideo = false
			firstMediaResult.genreIds = [0, 1, 2]
			firstMediaResult.id = 10
			firstMediaResult.popularity = 100
			firstMediaResult.voteAverage = 100
			firstMediaResult.voteCount = 10
			
			let secondMediaResult = MediaResult()
			secondMediaResult.title = "title1"
			secondMediaResult.originalTitle = "originalTitle1"
			secondMediaResult.originalLanguage = "originalLanguage1"
			secondMediaResult.releaseeDate = "releaseeDate1"
			secondMediaResult.backdropPath = "backdropPath1"
			secondMediaResult.posterPath = "posterPath1"
			secondMediaResult.overview = "overview1"
			secondMediaResult.hasAdultContent = false
			secondMediaResult.hasVideo = false
			secondMediaResult.genreIds = [0, 1, 2]
			secondMediaResult.id = 10
			secondMediaResult.popularity = 100
			secondMediaResult.voteAverage = 100
			secondMediaResult.voteCount = 10
			
			return [firstMediaResult, secondMediaResult]
		}
	}
}
