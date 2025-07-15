//
//  Resource.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/15/25.
//

import Foundation
import UIKit


//자주 사용하는 것들

struct Color {
    
    //let jackRed = UIColor.red //"인스턴스 저장(값을 가지고 있냐 없냐) 프로퍼티" ==인스턴스 프로퍼티(==저장 프로퍼티)
    static let jackRed = UIColor.red //타입 저장 프로퍼티: 타입 프로퍼티이면서 저장프로퍼티
    let jackBlack = UIColor.black
}
struct Image {
    static let star = UIImage(systemName: "star") //static이 무조건은 아니야 //자주사용하냐 안하냐에 때에 따라 달라
    //호출하지 않으면 올라가지 않아서 공간을 차지 하지 않아
}



