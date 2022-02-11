//
//  RxCollectionViewModel.swift
//  testAndTraining
//
//  Created by Kai Tanobe on 2022/01/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SwiftUI

protocol UserChallengeProfilesViweModelType: AnyObject {
    var outputs: UserChallengeProfilesViewModelOutput { get }
}

protocol UserChallengeProfilesViewModelOutput: AnyObject {
    var sectionItems: Driver<[UserChallengeProfilesModel]> { get }
}
    

class RxCollectionViewModel: UserChallengeProfilesViweModelType, UserChallengeProfilesViewModelOutput {
    var outputs: UserChallengeProfilesViewModelOutput { self }
    
    // outputs
    var sectionItems: Driver<[UserChallengeProfilesModel]>
    
    private let disposeBag = DisposeBag()
    
    init() {
        var sections: [UserChallengeProfilesModel] = [
            UserChallengeProfilesModel(items: [UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー1")]))]),
            UserChallengeProfilesModel(items: [UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー2")]))]),
            UserChallengeProfilesModel(items: [UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー3"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("2行目")]))]),
            UserChallengeProfilesModel(items: [UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー4"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("2行目")]))]),
            UserChallengeProfilesModel(items: [UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー5"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("2行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("3行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("4行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("5行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("6行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("7行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("8行目"),]))])
        ]
        
        sectionItems = Driver.just(sections)
    }
}

// MARK: - Data (5人分のユーザー情報のデータ)

struct UserChallengeProfilesModel {
    var items: [UserChallengeProfilesRowItem]
}

extension UserChallengeProfilesModel: SectionModelType {
    typealias Item = UserChallengeProfilesRowItem

    init(original: UserChallengeProfilesModel, items: [Item]) {
        self = original
        self.items = items
    }
}

enum UserChallengeProfilesRowItem {
    case memberProfile(UserChallengeProfileModel)
}

// MARK: - Data (1人分のユーザー情報のデータ）

struct UserChallengeProfileModel {
    var items: [Item]
}

extension UserChallengeProfileModel: SectionModelType {
    typealias Item = UserChallengeProfileRowItem
    
    init(original: UserChallengeProfileModel, items: [Item]) {
        self = original
        self.items = items
    }
}

enum UserChallengeProfileRowItem {
//    case top(MemberProfile)
    case selfIntroduction(String?)
}

struct MemberProfile {
    let userChallengeProfile: String?
    let userImage: String!
}





//let testPath = "https://s3-ap-northeast-1.amazonaws.com/minchalle/users/17/action/9a41bb7a-b10b-4984-b6c5-6e6747492707/thumb.jpg"

//        var sections: [UserChallengeProfilesModel] = [
//            UserChallengeProfilesModel(items: [
//                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー１")]))
//            ]),
//            UserChallengeProfilesModel(items: [
//                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー2")]))
//            ]),
//            UserChallengeProfilesModel(items: [
//                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー3")]))
//            ]),
//            UserChallengeProfilesModel(items: [
//                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー4")]))
//            ]),
//            UserChallengeProfilesModel(items: [
//                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー5")])),
//                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー6")])),
//                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー7")])),
//                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー8")]))
//            ])
//        ]
