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
    
    var selfIntro: String = " "
    
    init() {
        let section: [UserChallengeProfilesModel] = [
            UserChallengeProfilesModel(items: [
                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー1")])),
                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー2")])),
                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー3")])),
                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー4"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/2行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/3行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/4行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/5行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/6行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/7行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/8行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/9行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/10行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/11行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/12行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/13行目"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー4/14行目")])),
                UserChallengeProfilesRowItem.memberProfile(UserChallengeProfileModel(items: [UserChallengeProfileRowItem.selfIntroduction("ユーザー5"),
                     UserChallengeProfileRowItem.selfIntroduction("ユーザー5/2行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/3行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/4行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/5行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/6行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/7行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/8行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/9行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/10行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/11行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/12行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/13行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/14行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/15行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/16行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/17行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/18行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/19行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/20行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/21行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/22行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/23行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/24行目"),
                                                                                                                            UserChallengeProfileRowItem.selfIntroduction("ユーザー5/25行目")]))
                                              ])
        ]
        sectionItems = Driver.just(section)
        let access = section[0].items[0]
        print("------------------------------kai")
        print(access)
        print("---------------------------------")
        
        
        
        
         
        var item: Test = Test(items: [
            HogeRows.selfIntroduction("ユーザー1")
        ])
        print("------------------------------kai2")
        print(item.items)
        print("------------------------------")
        
        
        var testenum:HogeRows = .selfIntroduction("acjapan")
        func PrintColorName(hoge:HogeRows){
            switch hoge {
            case .selfIntroduction(let metaStr):
                print("\(hoge) metaStr=\(String(describing: metaStr!))" )
                self.selfIntro = metaStr!
            default:
                print("\(hoge)" )
            }
        }
        PrintColorName(hoge: testenum)
        print(selfIntro)
    }
}

struct Test {
    var items: [HogeRows]
}

enum HogeRows {
    case selfIntroduction(String?)
     case top(Top)
}

struct Top {
    var number: Int
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
    var items: [UserChallengeProfileRowItem]
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


enum TestUserChallengeProfileRowItem {
    case top(TestMemberProfile)
}

struct TestMemberProfile {
    let userChallengeProfile: String?
    let userImage: String!
}
