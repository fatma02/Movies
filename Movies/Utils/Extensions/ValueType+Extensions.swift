//
//  ValueType+Extensions.swift
//  Movies
//
//  Created by Fatma Fitouri on 17/5/2022.
//

import Foundation

extension Array {

    func uniqueItems( includeElement: (_ lhs: Element, _ rhs: Element) -> Bool) -> [Element] {
        var lRet: [Element] = []

        forEach { (element) in
            let existingElements = lRet.filter { includeElement(element, $0) }
            if existingElements.isEmpty {
                lRet.append(element)
            }
        }
        return lRet
    }

//    func mostFrequent<T: Hashable>(array: [T]) -> T? {
//
//        let counts = array.reduce(into: [:]) { $0[$1, default: 0] += 1 }
//
//        if let (value, _) = counts.max(by: { $0.1 < $1.1 }) {
//            return value
//        }
//
//        // array was empty
//        return nil
//    }
}
