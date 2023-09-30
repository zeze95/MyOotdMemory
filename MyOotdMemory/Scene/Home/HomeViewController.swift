//
//  HomeViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit

class HomeViewController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        settingTabbar()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        title = "추천 옷차림"
        let navigationItem = self.navigationItem
    
        let addButtonImg = UIImage(systemName: "square.and.pencil.circle")
        let addButton = UIBarButtonItem(image: addButtonImg, style: .plain, target: self, action: #selector(addButtonClicked))
        addButton.tintColor = .red
//        navigationItem.titleView?.tintColor = .blue
        // 글자 색상 안보이는 거랑 맨 처음 접속시 밑에 이상하게 뜨는거 수정해야함;
        navigationItem.rightBarButtonItem = addButton
   
    }
    @objc func addButtonClicked() {
        // 오른쪽 버튼(Add 버튼)이 탭됐을 때의 동작 구현
        // 여기서 오늘 중으로 글쓴 것이 있는지 확인하고 오늘 것을 수정하시겠습니까?
        // 다른 날짜의 글을 쓰시겠습니까 물어보는 알럿 띄우ㅠ기
        
        navigationController?.pushViewController(CreateViewController(), animated: true)
  
    }
    
    func configureTabBar(){
        tabBar.tintColor = .black
        let MainVC = MainViewController()
        MainVC.tabBarItem = UITabBarItem(title: "추천 옷차림", image: UIImage(systemName: "thermometer.low"),selectedImage: UIImage(systemName: "thermometer.high"))
        
        // 기온 별 struct 선언해서 아이콘 다르게 보이게 하기?? thermometer.transmission
        
        let DateVC = DateViewController()
        DateVC.tabBarItem = UITabBarItem(title: "날짜별 옷일기", image: UIImage(systemName: "calendar"),selectedImage: UIImage(systemName: "calendar.circle"))
        
        let ListVC = ListViewController()
        ListVC.tabBarItem = UITabBarItem(title: "온도별 옷일기", image: UIImage(systemName: "list.clipboard"),selectedImage: UIImage(systemName: "list.clipboard"))

        

        setViewControllers([MainVC, DateVC, ListVC], animated: true)
    }
    func settingTabbar(){
        let apperance = UITabBarAppearance()
        apperance.configureWithTransparentBackground()
        apperance.backgroundColor = .white
        tabBar.standardAppearance = apperance
       
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        title = item.title
     
    }
    
}



