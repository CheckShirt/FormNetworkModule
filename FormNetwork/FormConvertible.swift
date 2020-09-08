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
 
    /// 요청할 URL
    var url: URL { get set }
    
 
    /// 요청할 Method
    var httpMethod: HTTPMethod { get }
 
    /// 요청할 헤더
    var headers: [String: Any]? { get }
 
    /// 요청할 Body 데이터
    var body: Data? { get }
 
 */
public protocol FormConvertible {
    
    var url: URL { get }
             
    var httpMethod: HTTPMethod { get }
    
    var headers: [String: String]? { get }
    
    var parameter: [String: Any]? { get }
    
    var body: Data? { get }    
}
