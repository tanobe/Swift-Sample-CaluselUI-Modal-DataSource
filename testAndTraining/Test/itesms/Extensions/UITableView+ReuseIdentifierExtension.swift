//
//  UITableView+ReuseIdentifierExtension.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/02/04.
//

import struct Foundation.IndexPath
//import Rswift
import class UIKit.UITableView
import class UIKit.UITableViewCell

protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

extension UITableView {
    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: T.reuseIdentifier)
    }

//    func register(_ nibResourceType: Rswift.NibResourceType) {
//        // Rswift.NibResourceType.name と String(describing: self) が一致することを想定している
//        register(UINib(resource: nibResourceType), forCellReuseIdentifier: nibResourceType.name)
//    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

