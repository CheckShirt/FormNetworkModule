//
//  Service.swift
//  LottoUI
//
//  Created by HahnDante on 2020/08/24.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

protocol Service {
    
    associatedtype ModelType: Codable
    
    func fetch(_ completionHandler: @escaping ((Result<ModelType, Error>)->Void))
}
