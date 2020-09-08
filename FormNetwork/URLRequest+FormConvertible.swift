//
//  URLRequest+FormConvertible.swift
//  LottoUI
//
//  Created by HahnDante on 2020/08/30.
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
