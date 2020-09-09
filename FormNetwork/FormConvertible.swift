//
//  FormConvertible.swift
//  LottoUI
//
//  Created by HahnDante on 2020/08/24.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

/**
    HTTP 통신을 사용함에 있어 Presentor에 주입할 Form 파일입니다.
  
# Parameter

 */
public protocol FormConvertible {
    
    var url: URL { get }
             
    var httpMethod: HTTPMethod { get }
    
    var headers: [String: String]? { get }
    
    var parameter: [String: Any]? { get }
    
    var body: Data? { get }    
}
