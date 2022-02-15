//
//  RxCollectionViewController.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/01/21.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa


class RxCollectionViewController: UIViewController {
    
    private let viewModel: RxCollectionViewModel
    
    private let disposeBag = DisposeBag()
    
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = CarouselCollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
        
//    private let collectionView: UICollectionView = {
//        let flowLayout: CollectionViewFlowLayoutLeftAlign = {
//            let layout = CollectionViewFlowLayoutLeftAlign()
//            layout.estimatedItemSize = CGSize(width: 75, height: 25)
//            layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
//            layout.minimumLineSpacing = 1
//            layout.minimumInteritemSpacing = 1
//            return layout
//        }()
//
//        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), collectionViewLayout: flowLayout)
//        collectionView.backgroundColor = .clear
//        return collectionView
//    }()
    
    
    init() {
        self.viewModel = RxCollectionViewModel()
        super.init(nibName: nil, bundle: nil)
                
        viewModel.outputs.sectionItems
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "modal_Mask")
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.register(RxCollectionViewCell.self, forCellWithReuseIdentifier: RxCollectionViewCell.reuseIdentifier)
        
    }
    
    private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<UserChallengeProfilesModel>(configureCell: { [weak self] _, collectionView, indexPath, items in
        switch items {
        case let .memberProfile(member):
            let cell: RxCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: RxCollectionViewCell.reuseIdentifier, for: indexPath) as! RxCollectionViewCell

            cell.configureCell(with: [member])
            return cell
        }
    })
    
//    private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<UserChallengeProfilesModel>(configureCell: { _, collectionView, indexPath, item in
//        let cell: RxCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: RxCollectionViewCell.reuseIdentifier, for: indexPath) as! RxCollectionViewCell
//        cell.configureCell(with: [item])
//        return cell
//    })
    
}

extension RxCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = dataSource[indexPath]
        switch item {
        case .memberProfile:
            return CGSize(width: view.bounds.width - 40, height: view.bounds.height)
        }
    }
}


