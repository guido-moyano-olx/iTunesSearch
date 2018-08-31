//
//  APIRouter.swift
//  iTunesSearch
//
//  Created by Guido Moyano on 30/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case search(term:String, mediaType:String)
    
    private var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .search:
            return API.Endpoints.search
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .search(let term, let mediaType):
            return [API.Parameters.term: term, API.Parameters.media: mediaType]
        }
    }
    
    private var encoding: ParameterEncoding {
        switch self.method {
        case .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try API.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}
