//
//  APIRequestLoader.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//

import Foundation

class APIRequestLoader<T: APIServiceProtocol > {
    
    let apiService: T
    
    var urlSession: URLSession
    
    init(apiService: T, urlSession: URLSession = .shared) {
        
        self.apiService = apiService
        
        self.urlSession = urlSession
        
    }
    
    func loadAPIRequest(request: T.RequestDataType, completionHandler: @escaping (Result<T.ResponseDataType?, APIError>) -> Void) {
        
        do {
            let request = try apiService.makeRequest(from: request)
            
            urlSession.dataTask(with: request) { [weak self] data, response, error in
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    switch httpResponse.statusCode {
                        
                    case 200:
                        do {
                            
                            guard let data = data else {
                                
                                return completionHandler(.success(nil))
                            }

                            let response = try self?.apiService.parseResponse(from: data)
                            completionHandler(.success(response))
                            
                        } catch {
                            completionHandler(.failure(.parseError))
                        }
                        
                    case 500:
                        completionHandler(.failure(.serverError))
                        
                    default:
                        completionHandler(.failure(.other))
                    }
                    
                } else {
                    
                    completionHandler(.failure(.other))
                    
                }
                
            }.resume()
            
        } catch {
            completionHandler(.failure(.other))
        }
        
    }
    
}
