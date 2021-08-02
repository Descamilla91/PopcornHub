//
//  NetworkRouter.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 28/07/21.
//

import Foundation
import Alamofire

public enum NetworkRouter: URLRequestConvertible {
	case PopularMovies(page: Int)
	case TopRatedMovies(page: Int)
	case UpcomingMovies(page: Int)
	case MovieDetail(page: Int, searchString: String)
	
	var baseUrl: String {
		Environment.getEnvironmentVariable(name: .baseUrl)
	}
	
	var method: HTTPMethod {
		return .get
	}
	
	var path: String {
		switch self {
			case .PopularMovies:
				return "movie/popular"
			case .TopRatedMovies:
				return "movie/top_rated"
			case .UpcomingMovies:
				return "movie/upcoming"
			case .MovieDetail:
				return "search/movie"
		}
	}
	
	var parameters: [String: Any]? {
		var servicePage = 0
		var requestParameters = [String: Any]()
		switch self {
			case let .PopularMovies(page):
				servicePage = page
			case let .TopRatedMovies(page):
				servicePage = page
			case let .UpcomingMovies(page):
				servicePage = page
			case let .MovieDetail(page, stringQuery):
				servicePage = page
				requestParameters.updateValue(stringQuery, forKey: "query")
		}
		requestParameters.updateValue(Environment.getEnvironmentVariable(name: .apiKey), forKey: "api_key")
		requestParameters.updateValue("es-MX", forKey: "language")
		requestParameters.updateValue(servicePage, forKey: "page")
		return requestParameters
	}
	
	public func asURLRequest() throws -> URLRequest {
		let url = try baseUrl.asURL()
		
		var request = URLRequest(url: url.appendingPathComponent(path))
		request.httpMethod = method.rawValue
		request.timeoutInterval = TimeInterval(10 * 1000)
		
		return try URLEncoding.default.encode(request, with: parameters)
	}
}
