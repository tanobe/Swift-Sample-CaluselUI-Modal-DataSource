//
//  RxCollectionViewCellViewModel.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/01/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

protocol RxCollectionViewCellViewModelType: AnyObject {
    var inputs: RxCollectionViewCellViewModelInput { get }
    var outputs: RxCollectionViewCellViewModelOutput { get }
}


// MARK: Input

protocol RxCollectionViewCellViewModelInput {
    var dataFetchTrigger: PublishRelay<[UserChallengeProfileModel]> { get }
}

// MARK: Output

protocol RxCollectionViewCellViewModelOutput {
    var sectionItems: Driver<[UserChallengeProfileModel]> { get }
}

class RxCollectionViewCellViewModel: RxCollectionViewCellViewModelType, RxCollectionViewCellViewModelInput, RxCollectionViewCellViewModelOutput {
    var inputs: RxCollectionViewCellViewModelInput { self }
    
    var outputs: RxCollectionViewCellViewModelOutput { self }
    
    // input
    var dataFetchTrigger = PublishRelay<[UserChallengeProfileModel]>()
   
    // output
    var sectionItems: Driver<[UserChallengeProfileModel]>
    
    private let disposeBag = DisposeBag()
    
    init() {
        let signal = Signal.just(dataFetchTrigger)
        
///     Variable 'self.sectionItems' used before being initialized というエラーを吐くため移動。何故なのか原因追求するのもあり。
//        signal
//            .emit(onNext: { [weak self] _ in
//                guard let self = self else { return }
//                self.action2()
//            })
//            .disposed(by: disposeBag)
        
        let driver = Driver.just(dataFetchTrigger)

        driver
            .drive(onNext: { result in
                print("drriveの結果: \(result)")
            })
            .disposed(by: disposeBag)
        
//        let dataDriver = dataFetchTrigger
//            .asDriver(onErrorDriveWith: Driver.empty())
    
        let dataDriver = dataFetchTrigger
            .asDriver(onErrorDriveWith: Driver.empty())
//            .drive(memberProfile)
//            .disposed(by: disposeBag)
        
//        dataDriver
//            .drive(onNext: { result in
//                self.sectionItems  = result
//                self.action3(text: result.userImage)
//            })
//            .disposed(by: disposeBag)
                
        sectionItems = dataDriver
        
        signal
            .emit(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.action2()
            })
            .disposed(by: disposeBag)
        
    }
    
    private func action2() {
        print("何かしらの処理2")
    }
    
    private func action3(text: String) {
        print("action3: \(text)")
    }
    
}


































//
//protocol UserChallengeProfileViweModelType: AnyObject {
//    var inputs: UserChallengeProfileViewModelInput { get }
//    var outputs: UserChallengeProfileViewModelOutput { get }
//}
//
//protocol UserChallengeProfileViewModelInput: AnyObject {
//    var requestUserProfileTrigger: PublishRelay<Void> { get }
//    var refreshOneWord: PublishRelay<String> { get }
//    var userProfileDidAppear: PublishRelay<Void> { get }
//}
//
//protocol UserChallengeProfileViewModelOutput: AnyObject {
//    var sectionItems: Driver<[UserChallengeProfileModel]> { get }
//    var userProfile: Driver<UserProfile> { get }
//    var badgesReload: Driver<Void> { get }
//    var updatedChallengeProfile: Driver<ChallengeProfile> { get }
////    var apiErrorAlertEvent: Driver<RxApiClientError> { get }
//}
//
//
//class RxCollectionViewCellViewModel: UserChallengeProfileViweModelType, UserChallengeProfileViewModelInput, UserChallengeProfileViewModelOutput{
//    var refreshOneWord: PublishRelay<String>
//
//    var badgesReload: Driver<Void>
//
//    var inputs: UserChallengeProfileViewModelInput { self }
//
//    var outputs: UserChallengeProfileViewModelOutput { self }
//
//    // inputs
//
//    var requestUserProfileTrigger = PublishRelay<Void>()
//
//    var userProfileDidAppear = PublishRelay<Void>()
//
//    // outputs
//
//    var sectionItems: Driver<[UserChallengeProfileModel]>
//
//    var userProfile: Driver<UserProfile>
//
//    var updatedChallengeProfile: Driver<ChallengeProfile>
//
//    // var apiErrorAlertEvent: Driver<RxApiClientError>
//
//    // internal
//
//    private var userProfileRelay = BehaviorRelay<UserProfile>(value: UserProfile())
//
//
//    init() {
////        userProfile =
////
////        updatedChallengeProfile =
////
////        sectionItems =
//
//        self.initView()
//    }
//
//    func initView() {
//        print("after delete")
//    }
//}
//
//
//
//
//// MARK: Data
//
////struct UserChallengeProfileModel {
////    var items: [UserChallengeProfileRowItem]
////}
////
////extension UserChallengeProfileModel: SectionModelType {
////    typealias Item = UserChallengeProfileRowItem
////
////    init(original: UserChallengeProfileModel, items: [Item]) {
////        self = original
////        self.items = items
////    }
////}
////
////enum UserChallengeProfileRowItem {
////    case top(UserChallengeProfile)
////    case selfIntroduction(String?)
////    case oneWord(UserChallengeOneWord)
////}
////
////struct UserChallengeProfile {
////    let nickname: String
////    let summary: String?
////    let isSupporter: Bool
////}
////
////struct UserChallengeOneWord {
////    let text: String?
////}
////
////struct UserProfile {
////    var id: Int = 0
////    var email: String?
////}
////
////
////struct ChallengeProfile {
////    var userId: Int!
////    var teamId: Int!
////}
////
