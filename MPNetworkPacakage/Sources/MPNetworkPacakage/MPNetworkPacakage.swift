// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Alamofire

public protocol NetworkManagerProtocol {
    
    func makeCall<T: Codable> (withUrl url: URL, completion: @escaping (Result<T, AFError>) -> Void)
}

public final class NetworkManager: NetworkManagerProtocol {
    
    public init() {
        
    }
    
    public func makeCall<T: Codable> (withUrl url: URL, completion: @escaping (Result<T, AFError>) -> Void) {
        AF.request(url).responseDecodable(of: T.self) { response in
            switch response.result {
                case .success(let result):
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                case .failure(let error):
                    print(error)
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
            }
        }
    }
}
