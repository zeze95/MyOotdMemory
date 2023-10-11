//
//  HomeViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit


class HomeViewController: UITabBarController{
    let repository = DiaryTableRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        settingTabbar()
        settingNavBar()
        view.backgroundColor = Constants.BaseColor.backgroundGray

    }
    
    func settingNavBar() {
        self.navigationController?.isNavigationBarHidden = true
        title = "추천 옷차림"
        let navigationItem = self.navigationItem
    
        let addButtonImg = UIImage(systemName: "square.and.pencil")
        let addButton = UIBarButtonItem(image: addButtonImg, style: .plain, target: self, action: #selector(addButtonClicked))
        addButton.tintColor = Constants.BaseColor.point
        navigationItem.rightBarButtonItem = addButton

        if let navigationBar = navigationController?.navigationBar {
            let titleFont = UIFont(name: "SUITE-ExtraBold", size: 20) ?? UIFont.systemFont(ofSize: 20)
             let titleColor = Constants.BaseColor.text
            let titleTextAttributes: [NSAttributedString.Key: Any] = [
                            .font: titleFont,
                            .foregroundColor: titleColor
                        ]
            navigationBar.titleTextAttributes = titleTextAttributes
        }
    }
    
    @objc func addButtonClicked() {
        let check = repository.fetchFilterDate(date: DateFormatter.today())
        
        if check {
            navigationController?.pushViewController(CreateViewController(), animated: true)
        }else {
            showAlert()
        }
        
        
    }
    func showAlert() {
            let alertController = UIAlertController(title: "알림", message: "오늘 날짜에 이미 게시물이 있습니다. 게시물 수정을 하시겠습니까?", preferredStyle: .alert)
            
            // 액션 추가 (버튼 추가)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
                // 확인 버튼을 눌렀을 때 실행할 코드 작성
                let editVC = CreateViewController()
                editVC.isEdit = true
                editVC.editDate = "\(DateFormatter.today())"
                self.navigationController?.pushViewController(editVC, animated: true)
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action) in
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            // 알럿을 현재 뷰 컨트롤러에 표시
            present(alertController, animated: true, completion: nil)
        }
    
    func configureTabBar(){
   
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
        tabBar.tintColor = Constants.BaseColor.background
        tabBar.backgroundColor = Constants.BaseColor.backgroundBlack
        let apperance = UITabBarAppearance()
        apperance.configureWithTransparentBackground()
        apperance.backgroundColor = Constants.BaseColor.backgroundBlack
        tabBar.standardAppearance = apperance
       
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        title = item.title
     
    }
    
}


