//
//  CGFloat+Extension.swift
//  JustoTest
//
//  Created by Alan Eduardo Benavides Lira on 01/08/23.
//

import Foundation

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
