//
//  LottoService.swift
//  LottoUI
//
//  Created by CheckShirt on 2020/09/13.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

struct LottoService {
            
    func fetchLottoNumber(_ number: Int,
                          success: @escaping LottoSuccess,
                          failture: @escaping FailHandler) {
        adapter.fetch(LottoForm.lottoNumber(roundNumber: number)) { (result: Result<Lotto, Error>) in
            switch result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failture(error)
            }
        }
    }
    
    func stopRequest() {
        adapter.stop()
    }
    
    func suspendRequest() {
        adapter.suspend()
    }
    
    private var adapter = Adpater()
    
    typealias LottoSuccess = (Lotto) -> Void
    
    typealias FailHandler = (Error) -> Void
}
