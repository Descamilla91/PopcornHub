//
//  Network+Utilities.swift
//  PopcornHub
//
//  Created by Diego Escamilla on 01/08/21.
//

import Foundation
import Network

public enum Networkutilty {
	static func checkIfIsInternetConnection(completion: @escaping (Bool) -> Void ) {
		let monitor = NWPathMonitor()
		let queue = DispatchQueue(label: "InternetConnectionMonitor")
		monitor.pathUpdateHandler = { pathUpdateHandler in
			let hasInternet = pathUpdateHandler.status == .satisfied
			completion(hasInternet)
		}
		monitor.start(queue: queue)
	}
}
