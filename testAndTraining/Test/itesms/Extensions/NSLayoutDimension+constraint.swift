//
//  NSLayoutDimension+constraint.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/01/22.
//

//import UIKit
//
//extension NSLayoutDimension {
//    @discardableResult
//    func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
//                    to anchor: NSLayoutDimension,
//                    with constant: CGFloat = 0.0,
//                    multiplyBy multiplier: CGFloat = 1.0,
//                    identifier: String = "") -> NSLayoutConstraint {
//        let constraint: NSLayoutConstraint
//
//        switch relation {
//        case .equal:
//            constraint = self.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
//        case .greaterThanOrEqual:
//            constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
//        case .lessThanOrEqual:
//            constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
//        @unknown default:
//            fatalError("unknown case!!!!!!")
//        }
//        constraint.identifier = identifier
//        return constraint
//    }
//
//    @discardableResult
//    func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
//                    to constant: CGFloat = 0.0,
//                    identifier: String = "") -> NSLayoutConstraint {
//        let constraint: NSLayoutConstraint
//
//        switch relation {
//        case .equal:
//            constraint = self.constraint(equalToConstant: constant)
//        case .greaterThanOrEqual:
//            constraint = self.constraint(greaterThanOrEqualToConstant: constant)
//        case .lessThanOrEqual:
//            constraint = self.constraint(lessThanOrEqualToConstant: constant)
//        @unknown default:
//            fatalError("unknown case!!!!!!")
//        }
//        constraint.identifier = identifier
//        return constraint
//    }
//}
//
