//
//  NetworkManager.swift
//  NetflixClone
//
//  Created by NhiVHY on 30/01/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL: String
    
    private init() {
        self.baseURL = "https://api.themoviedb.org/3"
    }
    
    private func makeFullURL(endpoint: String) -> String {
        return baseURL + endpoint
    }

    // MARK: - Generic Request
    
    private func request<T: Decodable>(endpoint: String,
                                        method: HTTPMethod,
                                        parameters: Parameters? = nil,
                                        encoding: ParameterEncoding = URLEncoding.default,
                                        headers: HTTPHeaders? = nil,
                                        completion: @escaping (Result<T, Error>) -> Void) {
        
        let fullURL = makeFullURL(endpoint: endpoint)
        
        AF.request(fullURL,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: T.self) { response in
                
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
//                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                        print("Response data: \(utf8Text)")
//                    }
                    completion(.failure(error))
                }
        }
    }

    // MARK: - HTTP Methods
    
    func get<T: Decodable>(endpoint: String,
                           parameters: Parameters? = nil,
                           headers: HTTPHeaders? = nil,
                           completion: @escaping (Result<T, Error>) -> Void) {
        
        request(endpoint: endpoint, method: .get, parameters: parameters, headers: headers, completion: completion)
    }
    
    func post<T: Decodable>(endpoint: String,
                            parameters: Parameters? = nil,
                            encoding: ParameterEncoding = JSONEncoding.default,
                            headers: HTTPHeaders? = nil,
                            completion: @escaping (Result<T, Error>) -> Void) {
        
        request(endpoint: endpoint, method: .post, parameters: parameters, encoding: encoding, headers: headers, completion: completion)
    }
    
    func put<T: Decodable>(endpoint: String,
                           parameters: Parameters? = nil,
                           encoding: ParameterEncoding = JSONEncoding.default,
                           headers: HTTPHeaders? = nil,
                           completion: @escaping (Result<T, Error>) -> Void) {
        
        request(endpoint: endpoint, method: .put, parameters: parameters, encoding: encoding, headers: headers, completion: completion)
    }
    
    func delete<T: Decodable>(endpoint: String,
                              parameters: Parameters? = nil,
                              headers: HTTPHeaders? = nil,
                              completion: @escaping (Result<T, Error>) -> Void) {
        
        request(endpoint: endpoint, method: .delete, parameters: parameters, headers: headers, completion: completion)
    }

}
