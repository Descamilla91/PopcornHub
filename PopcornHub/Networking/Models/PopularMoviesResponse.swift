//
//  PopularMoviesResponse.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 27/07/21.
//

import Foundation

class PopularMoviesResponse: Decodable {
	var page: Int?
	var results: [MediaResult]?
	var totalPages: Double?
	var totalResult: Double?
	enum CodingKeys: String, CodingKey {
		case page
		case results
		case totalPages = "total_pages"
		case totalResult = "total_result"
	}
}

class MediaResult: Decodable {
	var originalLanguage: String?
	var originalTitle: String?
	var posterPath: String?
	var hasVideo: Bool?
	var voteAverage: Float?
	var title: String?
	var overview: String?
	var releaseeDate: String?
	var voteCount: Int?
	var hasAdultContent: Bool?
	var backdropPath: String?
	var id: Int?
	var popularity: Float?
	var mediaType: String?
	var genreIds: [Int]?
	enum CodingKeys: String, CodingKey {
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case posterPath = "poster_path"
		case backdropPath = "backdrop_path"
		case hasVideo = "video"
		case voteAverage = "vote_average"
		case title
		case overview
		case releaseeDate = "release_date"
		case voteCount = "vote_count"
		case hasAdultContent = "adult"
		case id
		case popularity
		case mediaType = "media_type"
		case genreIds = "genre_ids"
	}
}
