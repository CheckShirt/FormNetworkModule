//
//  URLRequest+FormConvertible.swift
//  LottoUI
//
//  Created by CheckShirt on 2020/09/13.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

extension FormConvertible {
    
    func asURLRequest() -> URLRequest {
        var urlRequest = URLRequest(url: self.url)
        urlRequest.allHTTPHeaderFields = self.headers
        urlRequest.httpBody = self.body
        urlRequest.httpMethod = self.httpMethod.rawValue        
        return urlRequest
    }
}
