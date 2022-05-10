//
//  RxCollectionViewCell.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/01/24.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa
import SwiftUI

class RxCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "RxCollectionViewCell"
    
    private let viewModel: RxCollectionViewCellViewModel
    
    private let headerRefreshControl = UIRefreshControl()
    
    private let disposeBag = DisposeBag()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.sectionFooterHeight = .leastNormalMagnitude
        tableView.sectionHeaderHeight = .leastNormalMagnitude
        tableView.rowHeight = 100
        tableView.clipsToBounds = true
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        viewModel = RxCollectionViewCellViewModel()
        super.init(frame: frame)
        
        viewModel.outputs.sectionItems
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        print("知りたい: \(viewModel.outputs.sectionItems)")
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<UserChallengeProfileModel>(configureCell: { [weak self] _, tableView, indexPath, items in
        switch items {
        case let .selfIntroduction(text):
            
//            cell.configureCell(title: member.userChallengeProfile)
            
            let cell: RxTableViewCell = tableView.dequeueReusableCell(withIdentifier: RxTableViewCell.reuseIdentifier, for: indexPath) as! RxTableViewCell
        
            guard let self = self else {
                return cell
            }
            
            cell.configureCell(with: text!)
            
            return cell
        }
    })
    
    private func initView() {
        tableView.register(RxTableViewCell.self, forCellReuseIdentifier: RxTableViewCell.reuseIdentifier)
//      忌々しいクソコード
//        backgroundColor = .systemYellow
        
        contentView.addSubview(tableView)
        tableView.addSubview(titleLabel)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        tableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                print("セレクト")
                print("1index_tableView: \(indexPath)")
            })
            .disposed(by: disposeBag)
        print("1index_tableView_item: \(tableView.rx.itemSelected)")
//        tableView.reloadData()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    func configureCell(with member: [UserChallengeProfileModel]) {
//        titleLabel.text = member.
        // input pubishを発火させる
        viewModel.dataFetchTrigger.accept(member)
    }
    
}
