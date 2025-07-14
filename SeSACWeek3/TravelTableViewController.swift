//
//  TravelTableViewController.swift
//  SeSACWeek3
//
//  Created by 박현진 on 7/14/25.
//

import UIKit

class TravelTableViewController: UITableViewController {

    let nickname = "고래밥" //공간을 하나만 만들어두고 가져다 쓰는게 효율적이지 매번 고래밥 공간을 만드는 것보다. DateFormatter() 얘도 마찬가지
    //과제 피드백
    let format = DateFormatter() //셀 생성시 cellForRowAt에서는 DateFormatter도 하나씩 같이 생성됨..그럴 필요가 있나 : 그래서 cellForRowAt에 쓰는 것보다  여기에 쓰는게 효율적 :연산비용, 인스턴스 생성비용이 큰 DateFormatter같은 애는 특히 여기에 쓰는게 나아
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //기존 방법처럼 테이블뷰 만들고 빌드하면 스레드에러 발생
        //별도 셀을 원래 셀 자리에 등록해주는 과정이 필요
        //XIB셀로 구성하는 순간 등록 과정 필수
        let xib = UINib(nibName: "TravelTableViewCell", bundle: nil) //파일명, nil(같은 파일 내에서 가져오는 거라 불필요한 과정:위치를 알려주는게 bundle)
        tableView.register(xib, forCellReuseIdentifier: "TravelTableViewCell") //identifier
        
        tableView.rowHeight = UITableView.automaticDimension //유동적 높이 설정
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        
        
        cell.travelLabel.text = "\(nickname)"
        
        cell.travelLabel.text = "dddddgsjddgsjdjdjdjjdjddgsjdjdjdjjdjddgsjdjdjdjjdjdjdjdjjdjdjdjdjdjdj"
        cell.travelLabel.numberOfLines = 0
        
        
        format.dateFormat = "yy년 MM월 dd일 hh시"
        
        let value = format.string(from: Date())
        cell.dateLabel.text = value
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //return 100
        
        //셀높이를 유동적으로 만드는 법
        //테이블뷰의 "automaticDimension":프로퍼티이름 같은거(self-sizing cell, expandable cell, dynamic cell)
        return UITableView.automaticDimension //현재는 글자의 높이 만큼만 나옴 //길게 내용을 넣어도 ...으로 나옴 //numberofLines를 0으로 설정해줘야함:몇줄로 보여질지 무한대로 설정해줘야 자동으로 높이가 적용됨
        //레이아웃이 잘 맞아떨어져야한다는 전제가 필수! 레이아웃에 따라 오토메틱디멘션이 잘 적용되기도 안되기도.:셀 크기를 기준으로 어디로 늘어날지 레이아웃이 잘 적용되어 있어야함("여백기준으로" 늘어나게 되어 있어야함):늘어날 곳이 셀이나 객체에 의존될수 있는 레이아웃(사방고정?)
        /*
        if indexPath.row < 3 {
            return UITableView.automaticDimension
        } else {
            return 100
        }
        */
        //유동적이지 않고 다 고정된 높이라면 "뷰디드로드에 한줄로" 프로퍼티 사용
        
    }

}
