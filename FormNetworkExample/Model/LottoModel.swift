//
//  Model.swift
//  LottoUI
//
//  Created by CheckShirt on 2020/09/13.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue: String
    let drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}

extension Lotto: CustomStringConvertible {
    var description: String {
        return "\(totSellamnt), \(returnValue), \(drwNoDate)"
    }
}

