//
//  ViewController.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2021/11/09.
//

import UIKit
import RxCocoa
import RxSwift
import SwiftUI

class ViewController: UIViewController {
    
    private let reportButtonTapped = PublishRelay<Void>()
    
    private let nextPageButtonTapped = PublishRelay<Void>()
    
    private let disposeBag = DisposeBag()
    
    let reloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("modal", for: UIControl.State.normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        return button
    }()
    
    let nextPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("next", for: UIControl.State.normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    init () {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        // MARK: - SDWebImageManagerDelegate
//        let vc: UIHostingController = UIHostingController(rootView: ContentView())
        ///SwiftUiで作ったStructのViewをUIKitで呼び出すためのお作法的コード。これ以外でも下記のように大きさを指定しなければ表示はされない。
//        view.addSubview(vc.view)
//        vc.view.translatesAutoresizingMaskIntoConstraints = false
//        vc.view.heightAnchor.constraint(equalToConstant: 600).isActive = true
//        vc.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
//        vc.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
//        vc.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        ///
        // MARK: - ↓ main
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(reloadButton)
        view.addSubview(nextPageButton)

        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reloadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        reloadButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        reloadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nextPageButton.translatesAutoresizingMaskIntoConstraints = false
        nextPageButton.topAnchor.constraint(equalTo: reloadButton.bottomAnchor, constant: 4).isActive = true
        nextPageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextPageButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextPageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        reloadButton.rx.tap.map { () }.asSignal(onErrorSignalWith: Signal.empty()).emit(to: self.reportButtonTapped).disposed(by: disposeBag)
//        reloadButton.rx.tap.asSignal()
//            .emit(to: self.reportButtonTapped)
//            .disposed(by: disposeBag)
        
        nextPageButton.rx.tap.map { () }.asSignal(onErrorSignalWith: Signal.empty()).emit(to: self.nextPageButtonTapped).disposed(by: disposeBag)
        
        reportButtonTapped.asSignal().emit(onNext: { [weak self] _ in
            self?.popUp()
        }).disposed(by: disposeBag)
        
        nextPageButtonTapped.asSignal().emit(onNext: { [weak self] _ in
            self?.presentModals()
            print("押した")
        }).disposed(by: disposeBag)
    }

    func popUp() {
       print("押されたよ")
    }
    
    func presentModals() {
        let vc = RxCollectionViewController()
//        self.presentModal(vc, modalTransitionStyle: .crossDissolve)
        self.presentModal(vc, modalTransitionStyle: .crossDissolve)
    }
}
