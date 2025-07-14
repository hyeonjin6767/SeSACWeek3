//
//  UIViewController+Extension.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/14/25.
//

import UIKit

//배경색상을 다크그레이로 공통적으로 설정하고 싶을 때 extension으로 만들어서 사용
//다른 뷰컨트롤러에서 바로 함수명으로 다 사용가능
//반복적으로 자주 사용하는 거


extension UIViewController {
    
    func setBackground() {
        
        view.backgroundColor =  .darkGray
        
    }
    
    func showAlert() {
        
    }
    
}
