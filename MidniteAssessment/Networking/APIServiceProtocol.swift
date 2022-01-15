//
//  APIServiceProtocol.swift
//  MidniteAssessment
//
//  Created by Yenting Chen on 2022/1/14.
//
import Foundation

protocol APIServiceProtocol {
    
    associatedtype RequestDataType
    associatedtype ResponseDataType
    
    func makeRequest(from request: RequestDataType) throws -> URLRequest
    func parseResponse(from response: Data) throws -> ResponseDataType
}
