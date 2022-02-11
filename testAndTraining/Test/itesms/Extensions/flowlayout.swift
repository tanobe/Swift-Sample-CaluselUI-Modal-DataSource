//
//  flowlayout.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/02/08.
//

import UIKit

class CollectionViewFlowLayoutLeftAlign: UICollectionViewFlowLayout {
    /**
     予め決定されている表示領域内のレイアウト属性を取得し
     それぞれのレイアウト属性を layoutAttributesForItem 経由で書き換える
     layoutAttributesForItem 経由で書き換えるのは、セルの追加・削除にも対応するため
     */
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }

        var attributesToReturn = attributes.map { $0.copy() as! UICollectionViewLayoutAttributes }
        for (index, attr) in attributes.enumerated() where attr.representedElementCategory == .cell {
            attributesToReturn[index] = layoutAttributesForItem(at: attr.indexPath) ?? UICollectionViewLayoutAttributes()
        }
        return attributesToReturn
    }

    /**
     itemごとにレイアウト属性を書き換える
      - 先頭要素であれば、x座標を Section Inset の左端にする
      - 現在のセルの行内に一つ前のセルが収まっているかを比較する
        - 収まっていなければ、x座標を左端にして返す
        - 収まっていれば、一つ前のセルからminimumInteritemSpacing分だけ離れた位置にx座標をずらす
     */
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let currentAttributes = super.layoutAttributesForItem(at: indexPath)?.copy() as? UICollectionViewLayoutAttributes,
              let viewWidth = collectionView?.frame.width else { return nil }

        let sectionInsetsLeft = sectionInsets(at: indexPath.section).left

        guard indexPath.item > 0 else {
            currentAttributes.frame.origin.x = sectionInsetsLeft
            return currentAttributes
        }

        let prevIndexPath = IndexPath(row: indexPath.item - 1, section: indexPath.section)
        guard let prevFrame = layoutAttributesForItem(at: prevIndexPath)?.frame else {
            return nil
        }
        let validWidth = viewWidth - sectionInset.left - sectionInset.right
        let currentColumnRect = CGRect(x: sectionInsetsLeft, y: currentAttributes.frame.origin.y, width: validWidth, height: currentAttributes.frame.height)
        guard prevFrame.intersects(currentColumnRect) else {
            currentAttributes.frame.origin.x = sectionInsetsLeft
            return currentAttributes
        }

        let prevItemTailX = prevFrame.origin.x + prevFrame.width
        currentAttributes.frame.origin.x = prevItemTailX + minimumInteritemSpacing(at: indexPath.section)
        return currentAttributes
    }

    private func sectionInsets(at index: Int) -> UIEdgeInsets {
        guard let collectionView = collectionView,
              let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout else { return sectionInset }
        return delegate.collectionView?(collectionView, layout: self, insetForSectionAt: index) ?? sectionInset
    }

    private func minimumInteritemSpacing(at index: Int) -> CGFloat {
        guard let collectionView = collectionView,
              let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout else { return minimumInteritemSpacing }
        return delegate.collectionView?(collectionView, layout: self, minimumInteritemSpacingForSectionAt: index) ?? minimumInteritemSpacing
    }
}

