//
//  UIView+NSLayoutAnchorExtension.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/01/22.
//

//import UIKit
//
//struct LayoutAnchor<Base> {
//    private let base: Base
//    init(_ base: Base) {
//        self.base = base
//    }
//}
//
//protocol LayoutAnchorCompatible {
//    associatedtype Compatible
//    static var la: LayoutAnchor<Compatible>.Type { get }
//    var la: LayoutAnchor<Compatible> { get }
//}
//
//extension LayoutAnchorCompatible {
//    static var la: LayoutAnchor<Self>.Type { LayoutAnchor<Self>.self }
//    var la: LayoutAnchor<Self> { LayoutAnchor(self) }
//}
//
//extension UIView: LayoutAnchorCompatible {}
//
//extension LayoutAnchor where Base: UIView {
//    @discardableResult func top(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.topAnchor.constraint(.equal, to: anchor, with: constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func bottom(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.bottomAnchor.constraint(.equal, to: anchor, with: -constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func bottom(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.bottomAnchor.constraint(.lessThanOrEqual, to: anchor, with: -constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func leading(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.leadingAnchor.constraint(.equal, to: anchor, with: constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func leading(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.leadingAnchor.constraint(.greaterThanOrEqual, to: anchor, with: constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func trailing(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.trailingAnchor.constraint(.equal, to: anchor, with: -constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func trailing(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.trailingAnchor.constraint(.lessThanOrEqual, to: anchor, with: -constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func centerX(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.centerXAnchor.constraint(.equal, to: anchor, with: constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func centerY(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.centerYAnchor.constraint(.equal, to: anchor, with: constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func width(equalToConstant width: CGFloat, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.widthAnchor.constraint(.equal, to: width, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func width(lessThanOrEqualToConstant width: CGFloat, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.widthAnchor.constraint(.lessThanOrEqual, to: width, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func width(equalTo anchor: NSLayoutDimension, multipliedBy m: CGFloat = 1.0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.widthAnchor.constraint(.equal, to: anchor, multiplyBy: m, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func height(equalToConstant height: CGFloat, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.heightAnchor.constraint(.equal, to: height, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func height(greaterThanOrEqualToConstant height: CGFloat, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.heightAnchor.constraint(.greaterThanOrEqual, to: height, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func height(lessThanOrEqualToConstant height: CGFloat, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.heightAnchor.constraint(.lessThanOrEqual, to: height, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func height(equalTo anchor: NSLayoutDimension, multipliedBy m: CGFloat = 1.0, with identifier: String = "") -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.heightAnchor.constraint(.equal, to: anchor, multiplyBy: m, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func size(equalToConstant size: CGSize) -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.widthAnchor.constraint(equalToConstant: size.width).isActive = true
//        base.heightAnchor.constraint(equalToConstant: size.height).isActive = true
//        return self
//    }
//
//    @discardableResult func edges(equalTo view: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) -> LayoutAnchor {
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
//        base.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom).isActive = true
//        base.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
//        base.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right).isActive = true
//        return self
//    }
//
//    @discardableResult func equalToSuperview(insets: UIEdgeInsets = UIEdgeInsets.zero) -> LayoutAnchor {
//        guard let superView = base.superview else {
//            return self
//        }
//        base.translatesAutoresizingMaskIntoConstraints = false
//        base.topAnchor.constraint(equalTo: superView.topAnchor, constant: insets.top).isActive = true
//        base.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -insets.bottom).isActive = true
//        base.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: insets.left).isActive = true
//        base.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -insets.right).isActive = true
//        return self
//    }
//
//    @discardableResult func updateTop(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        let currentConstraint = base.constraints.first { $0.identifier == identifier }
//        guard let constraint = currentConstraint else {
//            return self
//        }
//        constraint.isActive = false
//        base.topAnchor.constraint(.equal, to: anchor, with: constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func updateBottom(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, with identifier: String = "") -> LayoutAnchor {
//        let currentConstraint = base.constraints.first { $0.identifier == identifier }
//        guard let constraint = currentConstraint else {
//            return self
//        }
//        constraint.isActive = false
//        base.bottomAnchor.constraint(.equal, to: anchor, with: -constant, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func updateWidth(equalToConstant width: CGFloat, with identifier: String = "") -> LayoutAnchor {
//        let currentConstraint = base.constraints.first { $0.identifier == identifier }
//        guard let constraint = currentConstraint else {
//            return self
//        }
//        constraint.isActive = false
//        base.widthAnchor.constraint(.equal, to: width, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func updateHeight(equalTo anchor: NSLayoutDimension, multipliedBy m: CGFloat = 1.0, with identifier: String = "") -> LayoutAnchor {
//        let currentConstraint = base.constraints.first { $0.identifier == identifier }
//        guard let constraint = currentConstraint else {
//            return self
//        }
//        constraint.isActive = false
//        base.heightAnchor.constraint(.equal, to: anchor, multiplyBy: m, identifier: identifier).isActive = true
//        return self
//    }
//
//    @discardableResult func updateHeight(equalToConstant height: CGFloat, with identifier: String = "") -> LayoutAnchor {
//        let currentConstraint = base.constraints.first { $0.identifier == identifier }
//        guard let constraint = currentConstraint else {
//            return self
//        }
//        constraint.isActive = false
//        base.heightAnchor.constraint(.equal, to: height, identifier: identifier).isActive = true
//        return self
//    }
//}
//
