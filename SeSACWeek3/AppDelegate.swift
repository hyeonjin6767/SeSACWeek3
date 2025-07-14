//
//  AppDelegate.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/11/25.
//

import UIKit

import IQKeyboardManagerSwift //한줄 추가

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { //앱에 빌드되는 최초시점에 모든 유아이에 적용되는
        
        
        //(전체 ui에)앞으로 추가하는 모든 화면의 텍스트필드에 글자크기를 15, 배경 오렌지, 센터, 버튼 파란색을 변경 한다고 가정
        UITextField.appearance().backgroundColor = .yellow
        UITextField.appearance().font = .boldSystemFont(ofSize: 15)
                
        //1개의 뷰컨을 제외하고 모든 뷰컨에 키보드가 없다면? 이 위치는 적절하지 않다 //모든 뷰컨에 키보드가 있는 경우는 여기가 알맞
        IQKeyboardManager.shared.isEnabled = true //키보드가 올라올 때 텍스트필드도 올라옴
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

