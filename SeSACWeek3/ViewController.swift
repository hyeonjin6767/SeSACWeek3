//
//  ViewController.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/11/25.
//

import UIKit

import Toast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        print(2)
        print(3)
        
        print(4)
        print(5)
        
        
        print(6)
        
        print(7)
        print(8)
        
        print(10)
        print(11)
        print(12)
        print(13)
        
        print(14)
        print(15)

        //“Working directory” 상태 :
        //주석 추가
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Toast-Swift써보자 //바탕뷰에만 적용 (레이블같은곳에는 적용불가)
        view.makeToast("안녕하세요 만나서 반갑습니다.", duration: 5, position: .top) //5초동안 떠있게, 상단에
        
        
        
    }
}

