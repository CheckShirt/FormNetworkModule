//
//  RequestSender.swift
//  LottoUI
//
//  Created by CheckShirt on 2020/09/13.
//  Copyright © 2020 한상민. All rights reserved.
//

import UIKit

public protocol RequestSender {

}

extension RequestSender {
        
    func send<ResponseDataType: Decodable>(_ request: URLRequest,
                      completionHandler: @escaping (Result<ResponseDataType, Error>) -> Void) {
        Session.shared.request(request) { (result) in
            switch result {
            case .success(let data):
            do {
                let result = try JSONDecoder().decode(ResponseDataType.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
            
            case .failure(let error):
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }
    }
}

public protocol RequestRouter {
    
    func stop()
    
    func suspend()
}

extension RequestRouter {
    
    func stop() {
        Session.shared.cancel()
    }
    
    func suspend() {
        Session.shared.suspend()
    }
}

