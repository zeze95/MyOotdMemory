//
//  BaseViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
    }
    

     func configureView(){
         view.backgroundColor = Constants.BaseColor.backgroundGray
         view.layer.backgroundColor = Constants.BaseColor.backgroundGray.cgColor
         view.tintColor = .black

         // 다크 모드 변경 하기,,,
    }
    func setConstraints(){

    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = Constants.BaseColor.backgroundGray
        let titleFont = UIFont(name: "SUITE-SemiBold", size: 20)
        let titleColor = Constants.BaseColor.text
                let titleTextAttributes: [NSAttributedString.Key: Any] = [
                    .font: titleFont!,
                    .foregroundColor: titleColor
                ]
                navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
            
       }
    
}
