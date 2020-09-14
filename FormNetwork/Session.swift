//
//  HTTPClient.swift
//  LottoUI
//
//  Created by CheckShirt on 2020/09/13.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

public class Session {
    
    public static let shared = Session(session: URLSession.shared)
    
    public func request(_ urlRequest: URLRequest,
                            completionHandler: @escaping (Result<Data, Error>) -> Void) {        
        task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(error))
                    }
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(.success(data))
            }
        }
        task?.resume()
    }

    public func request(_ url: URL,
                        completionHandler: @escaping (Result<Data, Error>) -> Void) {        
        let urlRequest = URLRequest(url: url)
        task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(error))
                    }
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(.success(data))
            }
        }
        task?.resume()
    }
    
    public func suspend() {
        task?.suspend()
    }
    
    public func cancel() {
        task?.cancel()
    }
    
    public init(session: URLSession) {
        self.session = session
    }
    
    private let session: URLSession
    private var task: URLSessionTask?
}
