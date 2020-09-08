//
//  Service.swift
//  LottoUI
//
//  Created by HahnDante on 2020/09/07.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

struct Adpater: RequestSender, RequestRouter {
    
    func fetch<ResponseDataType: Codable>(_ form: FormConvertible, completionHandler: @escaping ((Result<ResponseDataType, Error>) -> Void)) {
        send(form.asURLRequest(), completionHandler: completionHandler)
    }
}
