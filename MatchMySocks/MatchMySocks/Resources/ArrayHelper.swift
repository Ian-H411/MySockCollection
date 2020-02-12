//
//  ArrayHelper.swift
//  MatchMySocks
//
//  Created by Ian Hall on 2/5/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import Foundation

extension Array {
    func chunked(by size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[0..<Swift.min($0 + size, count)])
        }
    }
}
