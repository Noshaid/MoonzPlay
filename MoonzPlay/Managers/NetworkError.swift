//
//  NetworkError.swift
//  MoonzPlay
//
//  Created by Noshaid Ali on 03/09/2024.
//

import Foundation

public enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case noInternet
    case generic(Error)
    case emptyData

    /// The error message to be shown to user
    var errorMessageStr: String {
        switch self {
        case .error(let statusCode, _):
            return "Error Code: \(statusCode)"
        case .noInternet:
            return "No internet connection"
        case .generic(let error):
            return "\(error.localizedDescription)"
        case .emptyData:
            return "No data received"
        }
    }
}
