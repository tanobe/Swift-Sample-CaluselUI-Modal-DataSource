//
//  NSLayoutAnchor+constraint.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/01/22.
//

//import UIKit
//
//extension NSLayoutAnchor {
//    @discardableResult
//    @objc func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
//                          to anchor: NSLayoutAnchor,
//                          with constant: CGFloat = 0.0,
//                          identifier: String = "") -> NSLayoutConstraint {
//        let constraint: NSLayoutConstraint
//
//        switch relation {
//        case .equal:
//            constraint = self.constraint(equalTo: anchor, constant: constant)
//        case .greaterThanOrEqual:
//            constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: constant)
//        case .lessThanOrEqual:
//            constraint = self.constraint(lessThanOrEqualTo: anchor, constant: constant)
//        @unknown default:
//            fatalError("unknown case!!!!!!")
//        }
//        constraint.identifier = identifier
//        return constraint
//    }
//}
//
