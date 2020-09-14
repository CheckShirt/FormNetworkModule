//
//  LottoForm.swift
//  LottoUI
//
//  Created by HahnDante on 2020/08/30.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

enum LottoForm: FormConvertible {
                            
    case lottoNumber(roundNumber: Int)
}

extension LottoForm {
    
    
    var baseURL: URL {
        guard let url = URL(string: BaseURL.lotto.rawValue) else { fatalError("Invalid URL") }
        return url
    }
    
    var path: String {
        switch self {
        case .lottoNumber(let roundNumber):
            return "common.do?method=getLottoNumber&drwNo=\(roundNumber)"
        }
    }
    
    var url: URL {
        switch self {
        case .lottoNumber(_):
            var URL = baseURL
            URL.appendPathComponent(path)
            return URL
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .lottoNumber(_):
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
    
    var parameter: [String : Any]? {
        return nil
    }
}
